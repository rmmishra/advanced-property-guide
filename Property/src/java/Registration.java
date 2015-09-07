/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mail.AuthCode_1;
import mail.Sendmail;
import sun.misc.BASE64Encoder;
import userdao.Userdao;
import userdto.Userdto;



/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Registration"})
public class Registration extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String fname=request.getParameter("name");
            String lname=request.getParameter("lname");
            String name=fname+" "+lname;
            String gender=request.getParameter("gender");
            String mail=request.getParameter("email");
            String pwd=request.getParameter("pwd");
            String cpwd=request.getParameter("cpwd");
            String cont=request.getParameter("contact");
            String state=request.getParameter("state");
            String city=request.getParameter("city");
            
            String ml="male.jpg";
            String fml="female.jpg";
            
            AuthCode_1 ac= new AuthCode_1();
            String authcode=ac.generateCode();
                
            
           if(!pwd.equals(cpwd))
            {
                request.setAttribute("msg","Password Not Match...!");
                response.sendRedirect("Registration.jsp");
            }
           
            //password encoading...
            MessageDigest md5=MessageDigest.getInstance("MD5");
            md5.update(pwd.getBytes(), 0, pwd.getBytes().length);
            byte[] newpass=md5.digest(pwd.getBytes());
            String finalpass=new BASE64Encoder().encode(newpass);
            //end encoding...
           
            
            Userdao ud=new Userdao();
            Userdto ut=new Userdto();
            if(gender.equals("male"))
            {
                ut.setPic(ml);
            }
            else
            {
                ut.setPic(fml);
            }
            ut.setName(name);
            ut.setGender(gender);
            ut.setMail(mail);
            ut.setPwd(finalpass);
            ut.setContact(cont);
            ut.setState(state);
            ut.setCity(city);
            ut.setAuthcode(authcode);
            int st = ud.registration(ut);
    
            if(st==1)
            {
              
                String sub="User Verification";
                String msg="Hello "+name+",plz click on this link to verify yourself on our Website Advanced Property Guide "+configuration.Configuration.url+"Userverification?Email="+mail+"&Authcode="+authcode+"";
                Sendmail s=new Sendmail();
                s.sndmail(mail, sub, msg);
                response.sendRedirect("index.jsp");

            }
            else
            {
                String ss="Not Registered...!";
                request.setAttribute("msg",ss);
                RequestDispatcher rd=request.getRequestDispatcher("Registration.jsp");
                rd.forward(request, response);
            }
        }catch(Exception e)
        {
            System.out.println(e);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
