/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zuagu
 */
public class StConServer1 {
    
    public StConServer1() {
        try {
            conn = DbCallcenter.getConnectionPoolServer1();
            st = conn.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(StartConexion.class.getName()
            ).log(Level.SEVERE, null, ex);
        }
    }

    public Connection conn = null;
    public Statement st = null;
    public ResultSet rs = null;
    
}
