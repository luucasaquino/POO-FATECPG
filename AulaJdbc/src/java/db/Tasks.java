/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.util.ArrayList;
import java.sql.*;
import web.DbListener;

/**
 *
 * @author root
 */
public class Tasks {
    public static ArrayList<String> getTasks() throws Exception{
      ArrayList<String> list = new ArrayList<>();
      Connection con  = DbListener.getConnection();
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM tasks");
      while(rs.next()){
          list.add(rs.getString("name"));
      }
      rs.close();
      stmt.close();
      con.close();
      return list;
    }
    
    public static void addTask(String taskName) throws Exception{
        Connection con = DbListener.getConnection();
        Statement stmt  = con.createStatement();
        stmt.execute("INSERT INTO tasks VALUES('"+taskName+"')");
        stmt.close();
        con.close();
    }
    public static void removeTask(String taskName) throws Exception{
        Connection con = DbListener.getConnection();
        Statement stmt  = con.createStatement();
        stmt.execute("DELETE FROM tasks WHERE name = '"+taskName+"'");
        stmt.close();
        con.close();
    }
}
