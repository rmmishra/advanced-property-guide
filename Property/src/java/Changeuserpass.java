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
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Encoder;
import userdao.Userdao;
import userdto.Userdto;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Changeuserpass"})
public class Changeuserpass extends HttpServlet {

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
            
            
            String oldpass=request.getParameter("opsd");
            String npwd=request.getParameter("npsd");
            
            
            //password encoading...
            MessageDigest md5=MessageDigest.getInstance("MD5");
            md5.update(oldpass.getBytes(), 0, oldpass.getBytes().length);
            byte[] newpass=md5.digest(oldpass.getBytes());
            String opwd=new BASE64Encoder().encode(newpass);
            
            md5.update(npwd.getBytes(), 0, npwd.getBytes().length);
            byte[] np=md5.digest(npwd.getBytes());
            String npas=new BASE64Encoder().encode(np);
            
            
            //end encoding...
            
            
            Userdao ad=new Userdao();
            Userdto dto=new Userdto();
            dto.setPwd(npas);
            dto.setMail(email);
            int st=ad.changepwd(dto,opwd);
            if(st>0)
            {
                response.sendRedirect("Changeuserpass.jsp");
            }
            else
            {
                String ss="Password Not Change!";
                request.setAttribute("msg",ss);
                RequestDispatcher rd=request.getRequestDispatcher("Changeuserpass.jsp");
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
