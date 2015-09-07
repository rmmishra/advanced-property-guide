/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Encoder;
import userdao.Userdao;
import userdto.Userdto;


/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Userlogin"})
public class Userlogin extends HttpServlet {

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
            String mail=request.getParameter("email");
            String pwd=request.getParameter("password");
            
            //password encoading...
            MessageDigest md5=MessageDigest.getInstance("MD5");
            md5.update(pwd.getBytes(), 0, pwd.getBytes().length);
            byte[] newpass=md5.digest(pwd.getBytes());
            String finalpass=new BASE64Encoder().encode(newpass);
            //end encoding...
           
            
            Userdao ud=new Userdao();
            Userdto ut=new Userdto();
            ut.setMail(mail);
            ut.setPwd(finalpass);
            int n=ud.loginuser(ut);
            
            HttpSession session=request.getSession();  
                    
            if(n>0)
            {
                session.setAttribute("useremail",mail);
                response.sendRedirect("Userprofile.jsp");
                 //out.println("success");
            }
            else
            {
                session.setAttribute("error","wrong login detail");
                response.sendRedirect("index.jsp");
                out.println("wrong login details!");
            }
        }catch(Exception e){
            System.out.println(e);}
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
