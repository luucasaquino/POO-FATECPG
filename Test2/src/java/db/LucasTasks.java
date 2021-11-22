/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.LucasDbListener;

/**
 *
 * @author root
 */
public class LucasTasks {
    public static ArrayList<String> getTasks() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Connection con = LucasDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM lucas_tasks");
        while(rs.next()){
            list.add(rs.getString("title"));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addTask(String title, String user) throws Exception{
        Connection con = LucasDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO lucas_tasks VALUES (null, '"+title+"', '"+user+"')");
        stmt.close();
        con.close();
    }
    
     public static void removeTask(String title) throws Exception{
        Connection con = LucasDbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("DELETE FROM lucas_tasks WHERE title = '"+title+"'");
        stmt.close();
        con.close();
    }
}
