/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package view;

import controller.CliController;
import dao.ClienteDAO;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.Cliente;

/**
 *
 * @author felip
 */
public class ViewAdmin extends javax.swing.JFrame {

    /**
     * Creates new form ViewAdmin
     */
    public ViewAdmin() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lbListaCliCad = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        btAtualizarListaCli = new javax.swing.JButton();
        btEditaCadCli = new javax.swing.JButton();
        btDeletaCli = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lbListaCliCad.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        lbListaCliCad.setText("Lista de clientes cadastrados:");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "CPF", "Nome", "Email", "Telefone", "Data de nascimento", "Endereço", "Número", "Cidade", "Estado", "Bairro", "Complemento"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        btAtualizarListaCli.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btAtualizarListaCli.setText("Atualizar");
        btAtualizarListaCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btAtualizarListaCliActionPerformed(evt);
            }
        });

        btEditaCadCli.setForeground(new java.awt.Color(0, 0, 255));
        btEditaCadCli.setText("Editar");
        btEditaCadCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btEditaCadCliActionPerformed(evt);
            }
        });

        btDeletaCli.setForeground(new java.awt.Color(255, 0, 0));
        btDeletaCli.setText("Deletar");
        btDeletaCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btDeletaCliActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(34, 34, 34)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(lbListaCliCad)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btAtualizarListaCli)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btEditaCadCli)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btDeletaCli)
                        .addGap(34, 34, 34))))
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 1158, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lbListaCliCad, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(22, 22, 22)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btAtualizarListaCli)
                    .addComponent(btEditaCadCli)
                    .addComponent(btDeletaCli))
                .addContainerGap(29, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
        
    private void btAtualizarListaCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btAtualizarListaCliActionPerformed
        DefaultTableModel tabelaCli = (DefaultTableModel) jTable1.getModel();
        tabelaCli.setRowCount(0);
        ClienteDAO cliDAO = new ClienteDAO();
        Object[] dadosProd = new Object[11];
        int elementosPorLinha = 11;
        for (int i = 0; i < cliDAO.consultar().size(); i += elementosPorLinha) {
            for (int j = 0; j < elementosPorLinha && i + j < cliDAO.consultar().size(); j++) {
                dadosProd[j] = cliDAO.consultar().get(i + j);
            }
            tabelaCli.addRow(dadosProd);
        }
    }//GEN-LAST:event_btAtualizarListaCliActionPerformed

    private void btDeletaCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btDeletaCliActionPerformed
        CliController pc = new CliController();
        if(jTable1.getSelectedRow() == -1){
                JOptionPane.showMessageDialog(null, "Selecione um dos itens da tabela para deletar");
            } else{
                DefaultTableModel modeloTabela = (DefaultTableModel) jTable1.getModel();
                Cliente cli = new Cliente(cpf);
                cli.setCpf(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString());
                pc.Deletar(cli.getCpf());
                modeloTabela.removeRow(jTable1.getSelectedRow());
            }
    }//GEN-LAST:event_btDeletaCliActionPerformed

    private void btEditaCadCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btEditaCadCliActionPerformed
        //CliController pc = new CliController();
        ClienteDAO cliDAO = new ClienteDAO();
        if(jTable1.getSelectedRow() == -1){
            JOptionPane.showMessageDialog(null, "Selecione um dos itens da tabela para editar");
        } else{
            ViewEdCliente k = new ViewEdCliente();
            k.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            k.setVisible(true);
            k.setSize(365, 480);
            DefaultTableModel modeloTabela = (DefaultTableModel) jTable1.getModel();
            Cliente cli = new Cliente(cpf);
            cli.setCpf(jTable1.getValueAt(jTable1.getSelectedRow(), 0).toString());
            k.recebeInfoEd(cliDAO.consultarParaEditar(cli));
            //cliDAO.consultarParaEditar(cli);
            //System.out.println(cliDAO.consultarParaEditar(cli));
            
            
                
            /*Object[] dadosProd = new Object[11];
            int elementosPorLinha = 11;
            for (int i = 0; i < cliDAO.consultar().size(); i += elementosPorLinha) {
                for (int j = 0; j < elementosPorLinha && i + j < cliDAO.consultar().size(); j++) {
                    dadosProd[j] = cliDAO.consultar().get(i + j);
                }
                
            }*/
        }
    }//GEN-LAST:event_btEditaCadCliActionPerformed

    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ViewAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ViewAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ViewAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ViewAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ViewAdmin().setVisible(true);
            }
        });
    }
    
    private String cpf;
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btAtualizarListaCli;
    private javax.swing.JButton btDeletaCli;
    public javax.swing.JButton btEditaCadCli;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JLabel lbListaCliCad;
    // End of variables declaration//GEN-END:variables
}
