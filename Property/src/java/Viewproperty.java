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
import propertydto.Propertydto;
import userdao.Userdao;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Viewproperty"})
public class Viewproperty extends HttpServlet {

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
            
             int id=0;
           String type=null,area=null,city=null,state=null,rate=null,service=null,pic=null;
	   Propertydto dto=new Propertydto();
           Userdao udo=new Userdao();
	   ArrayList<Propertydto> al=udo.getuserproperty(email);
	   Iterator<Propertydto> it=al.iterator();
           
           out.println("<form action=\"Deleteuserproperty\" method=\"post\">");
           out.println("<center><table border=\"2\" style=\"border: 3px solid #7a7a7a\">");
           out.println("<tr><th>ID</th><th>Type</th><th>Area</th><th>City</th><th>State</th><th>Rate</th><th>Service</th><th>Property pic</th><th><input type=\"submit\" value=\"Delete\"/></th></tr>");
	   while(it.hasNext())
	   {
		dto=it.next();
		id=dto.getId();type=dto.getType();area=dto.getArea();
                city=dto.getCity();state=dto.getState();rate=dto.getRate();service=dto.getService();pic=dto.getPic();
		out.println("<tr><th>"+id+"</th><td>"+type+"</td><td>"+area+"</td><td>"+city+"</td><td>"+state+"</td><td>"+rate+"</td><td>"+service+"</td><td><img src=\"propertyimg/"+pic+"\" height=\"150px\" width=\"200px\" align=\"center\" /></td><th><input type=\"checkbox\" name=\"data\" value="+id+" ></th></tr>");
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
