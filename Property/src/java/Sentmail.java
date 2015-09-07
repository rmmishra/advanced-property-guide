/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import maildto.Maildto;
import userdao.Userdao;


/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Sentmail"})
public class Sentmail extends HttpServlet {

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
            
            Userdao ud=new Userdao();
            Maildto dto=new Maildto();
            ArrayList<Maildto> al=ud.sentmail();
	    Iterator<Maildto> it=al.iterator();
           int id=0;
           out.println("<form action=\"Deletesentmail\" method=\"post\">");
           out.println("<center><table border=\"2\" style=\"border: 3px solid #7a7a7a\">");
           
           out.println("<font size=\"6\" color=\"sienna\" style=\"font-weight: bolder\">Sent Mail</font><br><br>");
	   out.println("<tr><th>ID</th><th>To</th><th>Subject</th><th>Mail Date</th><th>Message</th><th><input type=\"submit\" value=\"Delete\"/></th></tr>");
	   while(it.hasNext())
	   {
               dto=it.next();
               id=dto.getId();
		out.println("<tr><th>"+id+"</th><td width=\"150\">"+dto.getTo()+"</td><td>"+dto.getSubject()+"</td><td>"+dto.getMaildate()+"</td>"
                        + "<td><a href=\"Viewmail?msg="+dto.getMsg()+"\">Read Msg</a></td><th><input type=\"checkbox\" name=\"data\" value="+id+" ></th></tr>");
	    }
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
