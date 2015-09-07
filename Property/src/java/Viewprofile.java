/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(urlPatterns = {"/Viewprofile"})
public class Viewprofile extends HttpServlet {

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
            String email = (String)session.getAttribute("useremail");
            if (email!="")
            {
                
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
           
           String name=null,cont=null,city=null,state=null;
	   Userdto dto=new Userdto();
           Userdao udo=new Userdao();
	   ArrayList<Userdto> al=udo.getprofile(email);
           dto=al.get(0);
           name=dto.getName();cont=dto.getContact();city=dto.getCity();state=dto.getState();
	   out.println("<center><table border=\"2\" style=\"border: 3px solid #7a7a7a\">");
           out.println("<br><br><br><br><br><br>");
	   out.println("<tr><th align=\"left\" width=\"100\" height=\"40\"><font size=\"5\" color=\"sienna\">Name</font></th><td width=\"300\"><font size=\"5\" color=\"sienna\">"+name+"</font></td></tr>");
           out.println("<tr><th align=\"left\" width=\"100\" height=\"40\"><font size=\"5\" color=\"sienna\">Email</font></th><td width=\"300\"><font size=\"5\" color=\"sienna\">"+email+"</font></td></tr>");
           out.println("<tr><th align=\"left\" width=\"100\" height=\"40\"><font size=\"5\" color=\"sienna\">Contact</font></th><td width=\"300\"><font size=\"5\" color=\"sienna\">"+cont+"</font></td></tr>");
           out.println("<tr><th align=\"left\" width=\"100\" height=\"40\"><font size=\"5\" color=\"sienna\">City</font></th><td width=\"300\"><font size=\"5\" color=\"sienna\">"+city+"</font></td></tr>");
           out.println("<tr><th align=\"left\" width=\"100\" height=\"40\"><font size=\"5\" color=\"sienna\">state</font></th><td width=\"300\"><font size=\"5\" color=\"sienna\">"+state+"</font></td></tr>");
           out.println("</table></center>");
	   out.println("</form>");
            
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
