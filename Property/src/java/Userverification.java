/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import userdao.Userdao;
import userdto.Userdto;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Userverification"})
public class Userverification extends HttpServlet {

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
            HttpSession session=request.getSession();
            String Email=request.getParameter("Email");
            String authcode1= request.getParameter("Authcode");

   //out.println(authcode1);
   if(Email!="" && authcode1!="")
       {
         int n=0;
         Userdao ud=new Userdao();
         Userdto dto=new Userdto();
         dto.setMail(Email);
         dto.setAuthcode(authcode1);
         n=ud.verifyuser(dto);
         if(n>0)
             {
                session.setAttribute("verify","you can login now verified successfully");
                response.sendRedirect("index.jsp");
                }
         else
             {
                session.setAttribute("verify","you are already register");
                response.sendRedirect("index.jsp");
                }
         }
         else
             {
                response.sendRedirect("index.jsp");
             }
            
           
        }catch(Exception e)
        {
            System.out.println(e);
        }finally {            
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
