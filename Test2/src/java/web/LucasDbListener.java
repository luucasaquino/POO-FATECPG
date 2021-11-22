/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author root
 */
public class LucasDbListener implements ServletContextListener {

    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:lucas_tasks.db";

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("CREATE TABLE IF NOT EXISTS lucas_tasks ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY,"
                    + "title VARCHAR NOT NULL UNIQUE,"
                    + "user VARCHAR NOT NULL"
                    + ")");

        } catch (Exception ex) {

        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
