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

    public static String select_id_trabajo() {
        try {
            StartConexion ic = new StartConexion();
            JSONArray listIdTabajo = new JSONArray();
            String sql = "call neto_select_id_trabajo();";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            // preg1, valor
            while (ic.rs.next()) {
                JSONObject idTrabajo = new JSONObject();
                idTrabajo.put("id_trabajo", ic.rs.getString("id_trabajo"));
                listIdTabajo.add(idTrabajo);
            }
            ic.conn.close();
            ic.rs.close();
            ic.st.close();
            return listIdTabajo.toJSONString();
        } catch (SQLException ex) {
            System.out.println(ex);
            return "";
        }
    }

    public static String grafica1(String id_trabajo) {
        try {
            StartConexion ic = new StartConexion();
            JSONArray dataEncuesta = new JSONArray();
            String sql = "call neto_grafica_1(" + id_trabajo + ");";
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

    public static String grafica2(String id_trabajo) {
        try {
            StartConexion ic = new StartConexion();
            JSONArray dataEncuesta = new JSONArray();
            String sql = "call neto_grafica_2(" + id_trabajo + ");";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            // preg1, valor
            while (ic.rs.next()) {
                JSONObject ressEnc = new JSONObject();

                JSONArray dataVote = new JSONArray();
                dataVote.add(ic.rs.getInt("cant"));

                ressEnc.put("name", "Candidato " + ic.rs.getString("preg2"));
                ressEnc.put("data", dataVote);

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

    public static String grafica3() {
        try {
            StartConexion ic = new StartConexion();
            JSONArray dataEncuesta = new JSONArray();
            String sql = "call neto_grafica_2();";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            int minutos = 0, hora = 0;
            int[] persona = {0, 0, 0, 0, 0, 0, 0, 0};
            // preg1, valor
            while (ic.rs.next()) {
                JSONObject votos = new JSONObject();
                if (ic.rs.getInt("preg2") == 2) {

                }
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

    public static String grafica4() {
        try {
            StConServer1 ic = new StConServer1();
            JSONArray dataEncuesta = new JSONArray();
            String sql = "select id from arcade_usuarios where id = 1433";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            // preg1, valor
            while (ic.rs.next()) {
                JSONObject votos = new JSONObject();
                votos.put("id", ic.rs.getString("id"));
                dataEncuesta.add(votos);
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

    public static String graficaavance(String id_trabajo) {
        try {
            StartConexion ic = new StartConexion();
            JSONArray dataEncuesta = new JSONArray();
            String sql = "call neto_grafica_avance(" + id_trabajo + ");";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            // preg1, valor
            while (ic.rs.next()) {
                JSONObject votos = new JSONObject();
                votos.put("fecha_min", ic.rs.getString("fecha_min"));
                votos.put("id_trabajo", ic.rs.getString("id_trabajo"));
                votos.put("cand1", ic.rs.getString("cand1"));
                votos.put("cand2", ic.rs.getString("cand2"));
                votos.put("cand3", ic.rs.getString("cand3"));
                votos.put("cand4", ic.rs.getString("cand4"));
                votos.put("cand5", ic.rs.getString("cand5"));
                votos.put("cand6", ic.rs.getString("cand6"));
                votos.put("cand7", ic.rs.getString("cand7"));
                votos.put("cand8", ic.rs.getString("cand8"));
                votos.put("fecha_max", ic.rs.getString("fecha_max"));
                dataEncuesta.add(votos);
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
