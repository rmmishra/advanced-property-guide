/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MISHRA
 */
public class Dbconnection 
{
   public Connection getconnection()
    {
       Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/propertyproject","root","mishra");
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e);}
        return con; 
    }
}
