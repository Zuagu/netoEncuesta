/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.systel.model;

import java.sql.Connection;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author zuagu
 */
public class DbConn {
    
    private static DataSource dataSource = null;
    
    public static Connection getConnectionPool() {
        try {
            if (dataSource == null) {
                InitialContext ic = new InitialContext();
                dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/call_encuestas");
            }
            return dataSource.getConnection();
        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }
    
}
