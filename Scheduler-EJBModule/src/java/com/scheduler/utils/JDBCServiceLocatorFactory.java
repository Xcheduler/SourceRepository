/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.scheduler.utils;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;


public class JDBCServiceLocatorFactory {
 private static DataSource dsScheduler;
 private static Context ctx;

 public static synchronized Connection getSchedulerConnection() throws SQLException {
      Connection conn = null;
     try {
         ctx = getContext();
         dsScheduler = (DataSource) ctx.lookup("java:/SehedulerDS");
         conn = dsScheduler.getConnection();
      } catch (Exception e) {
          e.printStackTrace();
      }
     return conn;
    }

    public static void close(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    public static void close(PreparedStatement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    public static void close(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    private static Context getContext() {
        try {
            Properties p = new Properties();
            p.put("java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory");
            p.put("java.naming.factory.url.pkgs", "org.jboss.naming");
            ctx = new InitialContext(p);
        } catch (Exception e) {
            System.out.println("Error when getting Conext");
        }
        return ctx;
    }
}
