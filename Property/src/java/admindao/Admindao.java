/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admindao;

import admindto.Admindto;
import dbconnection.Dbconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import maildto.Maildto;

/**
 *
 * @author MISHRA
 */
public class Admindao
{
   
    Connection con=null;
    Dbconnection dbcon=new Dbconnection();
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    //login Admincode...
    public int loginuser(Admindto dto) throws SQLException 
    {
        int st=0;
        String uname=dto.getUname();
        String pwd=dto.getPwd();
        try
        {
            con=dbcon.getconnection();
            String query="select * from admin where uname='"+uname+"' and pwd='"+pwd+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
           
            while(rs.next())
            { 
                st=1;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}        
        return st;
    }

    //change password...

    public int changepwd(Admindto dto, String opwd) throws SQLException 
    {
        int st=0;
        String uname=dto.getUname();
        String pwd=dto.getPwd();
        try
        {
            con=dbcon.getconnection();
            String query="update admin set pwd=? where uname='"+uname+"' and pwd='"+opwd+"'";
            ps=con.prepareStatement(query);
            ps.setString(1,pwd);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    //change user name...
    public int changeuname(Admindto dto, String oldusername) throws SQLException 
    {
        int st=0;
        String nuname=dto.getUname();
        String pwd=dto.getPwd();
        try
        {
            con=dbcon.getconnection();
            String query="update admin set uname=? where uname='"+oldusername+"' and pwd='"+pwd+"'";
            ps=con.prepareStatement(query);
            ps.setString(1,nuname);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    //set image...
    public int setpic(Admindto dto) throws SQLException 
    {
        int st=0;
        String uname=dto.getUname();
        String pic=dto.getPic();
        
        try
        {
            con=dbcon.getconnection();
            String query="update admin set pic=? where uname='"+uname+"'";
            ps=con.prepareStatement(query);
            ps.setString(1,pic);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    //get pic...
    public String getpic(String uname) throws SQLException 
    {
        
        String pic="";
        try
        {
            con=dbcon.getconnection();
            String query="select pic from admin where uname='"+uname+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
           
            while(rs.next())
            { 
                pic=rs.getString("pic");
            }
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();} 
        return pic;
    }

    //compose mail...
    public int composemail(Maildto dto) throws SQLException
    {
        int st=0;
        String to=dto.getTo();
        String sub=dto.getSubject();
        String msg=dto.getMsg();
        String from=configuration.Mailconfig.email;
        try
        {
            con=dbcon.getconnection();
            String query="insert into mail (tou,fromu,subject,msg) values(?,?,?,?)";
            ps=con.prepareStatement(query);
            ps.setString(1,to);
            ps.setString(2,from);
            ps.setString(3,sub);
            ps.setString(4,msg);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }
    
}
