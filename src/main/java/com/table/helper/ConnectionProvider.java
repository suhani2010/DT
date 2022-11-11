
package com.table.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



    public class ConnectionProvider {
    

    static Connection con=null;
    static Statement st=null;
   
      static{
            try {
            Class.forName("com.mysql.jdbc.Driver");
           System.out.println("Driver Loaded");
           con=DriverManager.getConnection("jdbc:mysql://dynamictables.cyoxumwgggd5.us-east-1.rds.amazonaws.com:3306/db03","admin","walkover03");
            System.out.println("Connected :)");
            st=con.createStatement();
        }
        catch (ClassNotFoundException e) {
            System.out.println(e);
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
      }
    public static Statement getStatement()
    {
        return st;
    }
    public static Connection getConnection()
    {
        return con;
    }
}
