CREATE DATABASE laricao_db;
USE laricao_db;

CREATE TABLE produto (
	id_produto INT(5) AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    disponivel VARCHAR(3) NOT NULL,
    valor_unitario FLOAT(5,2) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    descricao VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id_produto)
);

CREATE TABLE cliente (
	cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(11) NOT NULL UNIQUE,
    logradouro VARCHAR(10),
    endereco VARCHAR(100) NOT NULL,
    numero INT(5) NOT NULL,
    complemento VARCHAR(200),
    PRIMARY KEY (cpf)
);

CREATE TABLE pedido (
	id_pedido INT(5) AUTO_INCREMENT,
    valor_total FLOAT(5,2) NOT NULL, #PRIMEIRO DÍGITO DO FLOAT É A QUANTIDADE TOTAL DE INTEIROS, SEGUNDO DÍGITO REPRESENTA CENTAVOS.
    observacoes VARCHAR(200),
    data_pedido DATETIME NOT NULL,
    cliente_cpf VARCHAR(11) NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (cliente_cpf) REFERENCES cliente(cpf)
);
    
CREATE TABLE itens (
	id_produto INT(5),
    id_pedido INT(5),
    qtd_item INT(50) NOT NULL,
    PRIMARY KEY (id_produto, id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);


INSERT INTO produto(nome, disponivel, valor_unitario, tipo, descricao) VALUES
    ('Cachorro quente vegano', true, 20.00, 'Lanche', 'Cachorro delícia sem sofrimento animal'),
	('Xis tudo vegano', true, 30.00, 'Lanche', 'Xis delícia sem sofrimento animal'),
    ('Guaraná Jesus', true, 5.00, 'Bebida', 'Lata 350ml'),
    ('Suco de laranja', true, 10.00, 'Bebida', '1L de suco natural'),
    ('Maionese extra', true, 2.00, 'Adicional', '10g de maionese'),
    ('Porção de batata frita', false, 15.00, 'Porção', '250g de batata frita');

INSERT INTO cliente(cpf, nome, telefone, email, senha, logradouro, endereco, numero, complemento) VALUES
	(92849504013, 'Xcherolayni', 51999999999, 'xchero@', 'xcherosa','Avenida', 'Suvaco da Cobra', 231, 'Do lado do cachorro do claudião'),
    (72849504015, 'Zezin', 54999999998, 'xcher@', 'xcheros','Rua', 'Lugar nenhum', 666, 'Próximo a ovelha negra'),
    (52849504013, 'Rita Lua', 55999999977, 'xche@', 'xchero','Rua', 'Venâncio Aires', 93, 'Em frente ao mercadinho da larva'),
    (52849504663, 'Alfredo', 55999559977, 'xch@', 'xcher','Rua', 'Borger', 100, ''),
    (64849504013, 'Enzo', 55998499977, 'xc@', 'xche','Avenida', 'Praia de Belas', 1000, '');
    
    
INSERT INTO pedido(valor_total, observacoes, data_pedido, cliente_cpf) VALUES
	(50.00, 'Sem tomate e milho', '2015-12-12 22:32:00', 92849504013),
    (40.00, '', '2017-12-12 22:32:00', 72849504015),
    (90.00, 'Caprixa no suco', '2018-12-12 22:32:00', 52849504013),
    (999.99, '', '2013-12-12 22:32:00', 52849504663),
    (200.00, '', '2023-12-12 22:32:00', 64849504013);
    
INSERT INTO itens(qtd_item, id_produto, id_pedido) VALUES
	(2, 1, 1),
    (1, 3, 1),
    (4, 2, 2),
    (1, 4, 3),
    (2, 1, 3),
    (1, 5, 3),
    (1, 3, 4),
    (5, 1, 5);

show tables;
select * from cliente;
select * from produto;
select * from pedido;
select * from itens;


-- selecione o nome do cliente e os produtos do pedido agrupados pelo valor total
select c.nome, pt.nome, i.qtd_item, pt.valor_unitario
from cliente c
inner join pedido p on p.cliente_cpf = c.cpf
inner join itens i on i.id_pedido = p.id_pedido
inner join produto pt on i.id_produto = pt.id_produto
;

-- select sum(valor_unitario) 

-- selecione o nome e a data do cliente que fez o pedido mais recente
select c.nome, p.data_pedido
from cliente c
inner join pedido p on p.cliente_cpf = c.cpf
order by p.data_pedido desc
limit 1;

-- secione o nome do cliente e o valor do pedido mais caro
select c.nome, p.valor_total
from pedido p
inner join cliente c on p.cliente_cpf = c.cpf
order by p.valor_total desc
limit 1;

-- selecione apenas o nome dos produtos indisponíveis
select nome, disponivel
from produto
where disponivel = 0;

-- selecione a quantidade total de produtos em estoque
select nome, count(*)
from produto
where disponivel = 1
group by nome;
