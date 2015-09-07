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
import sun.misc.BASE64Encoder;
import userdao.Userdao;
import userdto.Userdto;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Setpassword"})
public class Setpassword extends HttpServlet {

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
            String mail=request.getParameter("mail");
            String npwd=request.getParameter("npwd");
            String cpwd=request.getParameter("cpwd");
            if(!npwd.equals(cpwd))
            {
                System.out.println("password not match!");
                response.sendRedirect("Passwordrecovery.jsp");
            }
            else
            {
             
            //password encoading...
            MessageDigest md5=MessageDigest.getInstance("MD5");
            md5.update(npwd.getBytes(), 0, npwd.getBytes().length);
            byte[] newpass=md5.digest(npwd.getBytes());
            String finalpass=new BASE64Encoder().encode(newpass);
            
            Userdao ud=new Userdao();
            Userdto dto=new Userdto();
            dto.setMail(mail);
            dto.setPwd(finalpass);
            int n=ud.setpassword(dto);
            if(n>0)
            {
                response.sendRedirect("index.jsp");
            }
            else
            {
                String ss="Password Not Change!";
                request.setAttribute("msg",ss);
                RequestDispatcher rd=request.getRequestDispatcher("Passwordrecovery.jsp");
                rd.forward(request, response);
//               response.sendRedirect("Changepass.jsp");

            }
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
