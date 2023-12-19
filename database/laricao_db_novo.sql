select * from cliente;
SET SQL_SAFE_UPDATES = 0;

select cpf, nome, email, telefone, dataNasc, endereco, numEndereco, cidade, unidade_federativa, bairro, complemento from cliente;

INSERT INTO cliente (cpf, nome, senha, email, telefone, dataNasc, endereco, numEndereco, bairro, cidade, complemento, unidade_federativa) VALUES ("031.240.544-06", "José", "astro", "jose@gmail", "(54)998341234", "02/09/1998", "Rua José josé", "402", "Cidade baixa", "Porto Alegre", "Ao lado do mercadinho", "Rio Grande do Sul");

delete from cliente;

create database laricao_db;
USE laricao_db;

drop database laricao_db;

CREATE TABLE produto (
	id_produto INT(5) AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    disponivel VARCHAR(3) NOT NULL,
    valor_unitario FLOAT(5,2) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    descricao VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id_produto)
);

CREATE TABLE IF NOT EXISTS `cliente` (
  `cpf` VARCHAR(14) NOT NULL UNIQUE,
  `nome` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL UNIQUE,
  `telefone` VARCHAR(13) NOT NULL UNIQUE,
  `dataNasc` VARCHAR(10) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `numEndereco` VARCHAR(5),
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(100),
  `unidade_federativa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`));

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

INSERT INTO cliente(cpf, nome, senha, email, telefone, dataNasc, endereco, numEndereco, bairro, cidade, complemento, unidade_federativa) VALUES
	("031.240.544-06", "José dos Santos", "astro", "jose@gmail", "(54)998341234", "02/09/1998", "Rua José josé", "402", "Cidade baixa", "Porto Alegre", "Ao lado do mercadinho", "Rio Grande do Sul"),
    ("061.260.944-67", "Andreia Oliveira", "astro", "andreia@gmail", "(55)998329634", "02/10/1998", "Rua Sebastião Carvalho", "1000", "Moinhos", "Porto Alegre", "", "Rio Grande do Sul"),
    ("047.240.584-29", "João Hans", "astro", "joao@gmail", "(54)998395430", "10/09/2000", "Avenida Carlos Gomes", "507", "Cidade baixa", "Porto Alegre", "Em frente a agência da Caixa", "Rio Grande do Sul"),
    ("267.240.546-06", "Bruna Castro", "astro", "bruna@gmail", "(67)920141234", "30/01/1996", "Rua Oliveira", "980", "Centro", "Porto Alegre", "", "Rio Grande do Sul");
    
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

