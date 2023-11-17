/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laricao.src;

/**
 *
 * @author 182220040
 */
public abstract class FormasDePagamento {

    private int tipo;

    public int getTipoPagamento() {
        switch (this.tipo) {
            case 1:
                return 0;
            case 2:
                return 9;
            default:
                return 3;

        }
    }
         public void setTipo(int tipo) {
            this.tipo = tipo;
    }

    }

   
