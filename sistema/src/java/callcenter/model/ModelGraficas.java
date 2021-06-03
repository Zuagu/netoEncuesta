/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.SQLException;

/**
 *
 * @author zuagu
 */
public class ModelGraficas {
    
    public static int iniciar_sesion() {
        try {
            StartConexion inicioConexion = new StartConexion();
            int resultado = 0;
            String sql = "select ";
            System.out.println(sql);
            inicioConexion.rs = inicioConexion.st.executeQuery(sql);
            while (inicioConexion.rs.next()) {
                resultado = Integer.parseInt(inicioConexion.rs.getString("resultado"));
            }
            inicioConexion.conn.close();
            inicioConexion.rs.close();
            inicioConexion.st.close();
            return resultado;
        } catch (SQLException ex) {
            System.out.println(ex);
            return 0;
        }
    }
    
}
