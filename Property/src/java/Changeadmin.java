/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import admindao.Admindao;
import admindto.Admindto;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Encoder;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Changeadmin"})
public class Changeadmin extends HttpServlet {

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
            if(session.getAttribute("aname")!=null)
            {  
               //String name=(String)session.getAttribute("uname");  
            }  
            else
            {  
               response.sendRedirect("index.jsp");
            }
            
            String oldusername=request.getParameter("oun");
            String newusername=request.getParameter("nun");
            String pwd=request.getParameter("pwd");
            
            
            //password encoading...
            MessageDigest md5=MessageDigest.getInstance("MD5");
            md5.update(pwd.getBytes(), 0, pwd.getBytes().length);
            byte[] np=md5.digest(pwd.getBytes());
            String finalpass=new BASE64Encoder().encode(np);
            
            //end encoding...
            
            Admindao ad=new Admindao();
            Admindto dto=new Admindto();
            dto.setPwd(finalpass);
            dto.setUname(newusername);
            int st=ad.changeuname(dto,oldusername);
            if(st>0)
            {
                response.sendRedirect("Changeadminname.jsp");
            }
            else
            {
                String ss="Wrong User Name And Password!";
                request.setAttribute("msg",ss);
                RequestDispatcher rd=request.getRequestDispatcher("Changeadminname.jsp");
                rd.forward(request, response);
//               response.sendRedirect("Changepass.jsp");

            }
            
            
        }catch(Exception e){
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
