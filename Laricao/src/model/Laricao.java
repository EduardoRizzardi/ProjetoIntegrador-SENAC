package model;

import javax.swing.JFrame;
import view.ViewAdmin;
import view.ViewCadCliente;
import view.ViewEstabelecimento;
import view.ViewEdicaoProd;

/**
 *
 * @author 182220040
 */
public class Laricao {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*JFrame i = new ViewEstabelecimento();
        i.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        i.setVisible(true);
        i.setSize(650, 750);*/    
        
        JFrame j = new ViewCadCliente();
        j.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        j.setVisible(true);
        j.setSize(375, 530);
        
        /*JFrame k = new ViewAdmin();
        k.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        k.setVisible(true);
        k.setSize(1158, 585);*/
    }
    
}
