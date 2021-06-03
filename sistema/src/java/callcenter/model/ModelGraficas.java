/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author zuagu
 */
public class ModelGraficas {
    
    public static String grafica1() {
        try {
            StartConexion ic = new StartConexion();
            String resultado = "";
            JSONArray dataEncuesta = new JSONArray();
            String sql = "call neto_grafica_1();";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            // preg1, valor
            while (ic.rs.next()) {
                JSONObject ressEnc = new JSONObject();
                ressEnc.put("preg1", ic.rs.getString("preg1"));
                ressEnc.put("valor", ic.rs.getString("valor"));
                dataEncuesta.add(ressEnc);
            }
            ic.conn.close();
            ic.rs.close();
            ic.st.close();
            return dataEncuesta.toJSONString();
        } catch (SQLException ex) {
            System.out.println(ex);
            return "";
        }
    }
    
}
