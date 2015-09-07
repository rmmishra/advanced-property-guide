/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package userdao;

import dbconnection.Dbconnection;
import enquerydto.Enquerydto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import maildto.Maildto;
import propertydto.Propertydto;
import userdto.Userdto;

/**
 *
 * @author MISHRA
 */
public class Userdao
{
    
    Connection con = null;
    Dbconnection db=new Dbconnection();
    PreparedStatement ps=null;
    ResultSet rs=null;
        
    // registering userifo..
    public int registration(Userdto ut) throws SQLException 
    {
        int st=0;
        String name=ut.getName();
        String gender=ut.getGender();
        String mail=ut.getMail();
        String pwd=ut.getPwd();
        String cont=ut.getContact();
        String state=ut.getState();
        String city=ut.getCity();
        String pic=ut.getPic();
        String authcode=ut.getAuthcode();
        try
        {
            con=db.getconnection();
            String query="insert into registration (name,gender,mail,pwd,contact,state,city,pic,authcode) values(?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, gender);
            ps.setString(3, mail);
            ps.setString(4, pwd);
            ps.setString(5, cont);
            ps.setString(6, state);
            ps.setString(7, city);
            ps.setString(8, pic);
            ps.setString(9, authcode);
            st=ps.executeUpdate();
            
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}
        return st;
    }

    // login user code...
    public int loginuser(Userdto ut) throws SQLException 
    {
        int st=0;
        String mail=ut.getMail();
        String pwd=ut.getPwd();
        try
        {
            con=db.getconnection();
            String query="select * from registration where mail='"+mail+"' and pwd='"+pwd+"' and status=1";
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

    //fetch user data...
    public ArrayList<Userdto> fetchdata() throws SQLException 
    {
        ArrayList<Userdto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select id,name,gender,mail,contact,state,city,status,pic from registration order by id";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Userdto dto=new Userdto();
                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setGender(rs.getString("gender"));
                dto.setMail(rs.getString("mail"));
                dto.setContact(rs.getString("contact"));
                dto.setState(rs.getString("state"));
                dto.setCity(rs.getString("city"));
                dto.setStatus(rs.getInt("status"));
                dto.setPic(rs.getString("pic"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
     
    }

    //delete userdata...
    public int deletedata(List<String> l) throws SQLException 
    {
        int st=0;
        String ss="";
        con=db.getconnection();
        try
        {
            for(String e:l)
            {
		  ss="delete from registration where id='"+e+"'";
		  ps=con.prepareStatement(ss);
		  st=ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return st;
    }

    //fetch Property data...
    public ArrayList<Propertydto> fetchprpperty() throws SQLException 
    {
         ArrayList<Propertydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select * from postproperty";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Propertydto dto=new Propertydto();
                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setContact(rs.getString("contact"));
                dto.setMail(rs.getString("mail"));
                dto.setType(rs.getString("type"));
                dto.setArea(rs.getString("area"));
                dto.setCity(rs.getString("city"));
                dto.setState(rs.getString("state"));
                dto.setRate(rs.getString("rate"));
                dto.setService(rs.getString("service"));
                dto.setPic(rs.getString("pic"));
                dto.setStatus(rs.getInt("status"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //delete property data...
    public int deleteproperty(List<String> l) throws SQLException 
    {
        int st=0;
        String ss="";
        con=db.getconnection();
        try
        {
            for(String e:l)
            {
		  ss="delete from postproperty where id='"+e+"'";
		  ps=con.prepareStatement(ss);
		  st=ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return st;
        
    }

    //verify property...
    public int verifyproperty(Propertydto pdto) throws SQLException 
    {
        int n=0;
        int id=pdto.getId();
        try
        {
            con=db.getconnection();
            String query="update postproperty set status=? where id="+id+"";
            ps=con.prepareStatement(query);
            ps.setInt(1,1);
            n=ps.executeUpdate();
          
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}        
        return n;
    }

    //fetch enquery...
    public ArrayList<Enquerydto> fetchenquery() throws SQLException 
    {
         ArrayList<Enquerydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select * from enquery";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Enquerydto dto=new Enquerydto();
                dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setContact(rs.getString("contact"));
                dto.setMail(rs.getString("mail"));
                dto.setMsg(rs.getString("msg"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
        
    }

    //delete enquery...
    public int deleteenquery(List<String> l) throws SQLException 
    {
       int st=0;
        String ss="";
        con=db.getconnection();
        try
        {
            for(String e:l)
            {
		  ss="delete from enquery where id='"+e+"'";
		  ps=con.prepareStatement(ss);
		  st=ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return st;
    }

    //insert enquiry...
    public int setenquiry(Enquerydto endto) throws SQLException 
    {
       int st=0;
        String name=endto.getName();
        String mail=endto.getMail();
        String cont=endto.getContact();
        String msg=endto.getMsg();
        try
        {
            con=db.getconnection();
            String query="insert into enquery (name,mail,contact,msg) values(?,?,?,?)";
            ps=con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, mail);
            ps.setString(3, cont);
            ps.setString(4, msg);
            st=ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}
       return st;
    }

    //search property...
    public ArrayList<Propertydto> searchproperty(Propertydto pdto) throws SQLException 
    {
        String type=pdto.getType();
        
        String city=pdto.getCity();
        
        ArrayList<Propertydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="select * from postproperty where city='"+city+"' and type='"+type+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Propertydto dto=new Propertydto();
                //dto.setId(rs.getInt("id"));
                dto.setName(rs.getString("name"));
                dto.setContact(rs.getString("contact"));
                dto.setMail(rs.getString("mail"));
                dto.setArea(rs.getString("area"));
                dto.setState(rs.getString("state"));
                dto.setRate(rs.getString("rate"));
                dto.setService(rs.getString("service"));
                dto.setPic(rs.getString("pic"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //get property for index page...
    public ArrayList<Propertydto> getproperty() throws SQLException 
    {
         ArrayList<Propertydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select distinct city from postproperty ";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Propertydto dto=new Propertydto();
                
                dto.setCity(rs.getString("city"));
                
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }
    
    //get all property...
    public ArrayList<Propertydto> getallproperty() throws SQLException 
    {
         ArrayList<Propertydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select * from postproperty where type<>'Buy'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Propertydto dto=new Propertydto();
                dto.setName(rs.getString("name"));
                dto.setContact(rs.getString("contact"));
                dto.setMail(rs.getString("mail"));
                dto.setType(rs.getString("type"));
                dto.setArea(rs.getString("area"));
                dto.setCity(rs.getString("city"));
                dto.setState(rs.getString("state"));
                dto.setRate(rs.getString("rate"));
                dto.setService(rs.getString("service"));
                dto.setPic(rs.getString("pic"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //insert property...
    public int insertproperty(Propertydto dto) throws SQLException 
    {
        int st=0;
        String name=dto.getName();
        String cont=dto.getContact();
        String mail=dto.getMail();
        String type=dto.getType();
        String area=dto.getArea();
        String city=dto.getCity();
        String state=dto.getState();
        String rate=dto.getRate();
        String service=dto.getService();
        String pic=dto.getPic();
        try
        {
            con=db.getconnection();
            String query="insert into postproperty (name,contact,mail,type,area,city,state,rate,service,pic) values(?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, cont);
            ps.setString(3, mail);
            ps.setString(4, type);
            ps.setString(5, area);
            ps.setString(6, city);
            ps.setString(7, state);
            ps.setString(8, rate);
            ps.setString(9, service);
            ps.setString(10, pic);
            st=ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}
        return st;
    }

    // set user profile pic...
    public int setpic(Userdto dto) throws SQLException 
    {
        int st=0;
        String mail=dto.getMail();
        String pic=dto.getPic();
        try
        {
            con=db.getconnection();
            String query="update registration set pic=? where mail='"+mail+"'";
            ps=con.prepareStatement(query);
            ps.setString(1,pic);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }
    
    //get user pic...
    public ArrayList<Userdto> getpic(String email) throws SQLException 
    {
        ArrayList<Userdto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="select name,pic from registration where mail='"+email+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            { 
                Userdto dt=new Userdto();
                dt.setName(rs.getString("name"));
                dt.setPic(rs.getString("pic"));
                
                al.add(dt);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();} 
        return al;
    }

    //Change password...
    public int changepwd(Userdto dto, String opwd) throws SQLException 
    {
        int st=0;
        String mail=dto.getMail();
        String pwd=dto.getPwd();
        try
        {
            con=db.getconnection();
            String query="update registration set pwd=? where mail='"+mail+"' and pwd='"+opwd+"'";
            ps=con.prepareStatement(query);
            ps.setString(1,pwd);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    // view buyer...
    public ArrayList<Propertydto> viewbuyer() throws SQLException 
    {
        ArrayList<Propertydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select * from postproperty where type='Buy'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Propertydto dto=new Propertydto();
                dto.setName(rs.getString("name"));
                dto.setContact(rs.getString("contact"));
                dto.setMail(rs.getString("mail"));
                
                dto.setArea(rs.getString("area"));
                dto.setCity(rs.getString("city"));
                dto.setState(rs.getString("state"));
                dto.setRate(rs.getString("rate"));
                dto.setService(rs.getString("service"));
                dto.setPic(rs.getString("pic"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //get user property...
    public ArrayList<Propertydto> getuserproperty(String email) throws SQLException 
    {
        ArrayList<Propertydto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select * from postproperty where mail='"+email+"' ";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Propertydto dto=new Propertydto();
                dto.setId(rs.getInt("id"));
                dto.setType(rs.getString("type"));
                dto.setArea(rs.getString("area"));
                dto.setCity(rs.getString("city"));
                dto.setState(rs.getString("state"));
                dto.setRate(rs.getString("rate"));
                dto.setService(rs.getString("service"));
                dto.setPic(rs.getString("pic"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //delete user property...
    public int deleteuserproperty(List<String> l) throws SQLException
    {
        int st=0;
        String ss="";
        con=db.getconnection();
        try
        {
            for(String e:l)
            {
		  ss="delete from postproperty where id='"+e+"'";
		  ps=con.prepareStatement(ss);
		  st=ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return st;
        
    }

    //edit user profile...
    public int editprofile(String type, String info, String email) throws SQLException 
    {
        int st=0;
        String query="";
        try
        {
            con=db.getconnection();
            if(type.equals("name"))
            {
                query="update registration set name=? where mail='"+email+"'";
            }
            else if(type.equals("contact"))
            {
                query="update registration set contact=? where mail='"+email+"'";
            }
            else if(type.equals("city"))
            {
                query="update registration set city=? where mail='"+email+"'";
            }
            else
            {
                //state
                query="update registration set state=? where mail='"+email+"'";
            }
            ps=con.prepareStatement(query);
            ps.setString(1,info);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    //get user profile data
    public ArrayList<Userdto> getprofile(String email) throws SQLException 
    {
        ArrayList<Userdto> al=new ArrayList();
        try
        {
            con=db.getconnection();
            String query="Select name,contact,state,city from registration where mail='"+email+"' ";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Userdto dto=new Userdto();
                dto.setName(rs.getString("name"));
                dto.setContact(rs.getString("contact"));
                dto.setState(rs.getString("state"));
                dto.setCity(rs.getString("city"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //verify user...
    public int verifyuser(Userdto dto) throws SQLException 
    {
        int st=0;
        String mail=dto.getMail();
        String authcode=dto.getAuthcode();
        try
        {
            con=db.getconnection();
            String query="update registration set status=? where mail='"+mail+"' and authcode='"+authcode+"'";
            ps=con.prepareStatement(query);
            ps.setInt(1,1);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    //set forgot password...
    public int setpassword(Userdto dto) throws SQLException 
    {
        int st=0;
        String mail=dto.getMail();
        String pwd=dto.getPwd();
        try
        {
            con=db.getconnection();
            String query="update registration set pwd=? where mail='"+mail+"'";
            ps=con.prepareStatement(query);
            ps.setString(1,pwd);
            st=ps.executeUpdate();
               
        }catch(Exception e){
            System.out.println(e);
        }
        finally{con.close();}    
        return st;
    }

    //view sent mail...
    public ArrayList<Maildto> sentmail() throws SQLException 
    {
         ArrayList<Maildto> al=new ArrayList();
        try
        {
            
            con=db.getconnection();
            String query="Select * from mail where fromu='"+configuration.Mailconfig.email+"'";
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next())
            {
                Maildto dto=new Maildto();
                dto.setId(rs.getInt("id"));
                dto.setTo(rs.getString("tou"));
                dto.setSubject(rs.getString("subject"));
                dto.setMaildate(rs.getString("maildate"));
                dto.setMsg(rs.getString("msg"));
                al.add(dto);
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return al;
    }

    //delete sent mail...
    public int deletesentmail(List<String> l) throws SQLException
    {
        int st=0;
        String ss="";
        con=db.getconnection();
        try
        {
            for(String e:l)
            {
                System.out.println(e);
		  ss="delete from mail where id='"+e+"'";
		  ps=con.prepareStatement(ss);
		  st=ps.executeUpdate();
            }
        }catch(Exception e){
            System.out.println(e);
        }finally{con.close();}
        return st;
    }

}
