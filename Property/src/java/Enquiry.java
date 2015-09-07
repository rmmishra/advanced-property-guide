/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import enquerydto.Enquerydto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import userdao.Userdao;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Enquiry"})
public class Enquiry extends HttpServlet {

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
            String name=request.getParameter("name");
            String mail=request.getParameter("mail");
            String cont=request.getParameter("contact");
            String enquiry=request.getParameter("inqu");
            Userdao ud=new Userdao();
            Enquerydto endto=new Enquerydto();
            endto.setName(name);
            endto.setMail(mail);
            endto.setContact(cont);
            endto.setMsg(enquiry);
            int n=ud.setenquiry(endto);
            if(n>0)
            {
                System.out.println("done");
                 response.sendRedirect("index.jsp");                 
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
            
        }catch(Exception e)
        {
            System.out.println(e); 
        } finally {            
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
