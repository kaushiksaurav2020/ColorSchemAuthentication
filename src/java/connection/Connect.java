package connection;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;

public class Connect {

    static Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static Connection makeCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/colorschemeauthentication", "root", "admin");
           // System.out.println("opened conn");

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return con;
    }

    public static void CloseConnection() throws Exception {
        if (con != null) {
            con.close();
        }
    }
    
     public static void main(String[] arg) throws Exception {
        try {
            
            Connection c =  makeCon();
            System.out.println("connect :" + c.toString());
        } catch (Exception ex) {
            System.out.println("error catch: " + ex.toString());
        }

    }
}
