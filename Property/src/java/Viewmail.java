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

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Viewmail"})
public class Viewmail extends HttpServlet {

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
            String name="";
            if(session.getAttribute("aname")!=null)
            {  
               name=(String)session.getAttribute("aname"); 
               
            }  
            else
            {  
               response.sendRedirect("index.jsp");
            }
            String msg=request.getParameter("msg");
            String url=request.getParameter("url");
            out.println("<center><table border=\"2\" style=\"border: 3px solid #7a7a7a\">");
           
           out.println("<font size=\"6\" color=\"sienna\" style=\"font-weight: bolder\">Message</font><br><br>");
	   out.println("<tr><th>Message</th></tr>");
           out.println("<tr><td><textarea cols=\"80\" rows=\"10\" name=\"msg\" placeholder=\"Message...\" required=\"\" readonly=\"\" >"+msg+"</textarea></td></tr>");
	   out.println("<tr><th><a href=\"Sentmail\">Back</a></th></tr>");
           out.println("</table></center>");
            
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
