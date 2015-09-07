/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import admindao.Admindao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mail.Sendmail;
import maildto.Maildto;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Composemail"})
public class Composemail extends HttpServlet {

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
            String to=request.getParameter("to");
            String sub=request.getParameter("sub");
            String msg=request.getParameter("msg");
            Admindao ad=new Admindao();
            Maildto dto=new Maildto();
            dto.setTo(to);
            dto.setSubject(sub);
            dto.setMsg(msg);
            int n=ad.composemail(dto);
            if(n>0)
            {
                Sendmail s=new Sendmail();
                s.sndmail(to, sub, msg);
                response.sendRedirect("Composemail.jsp");
            }
            else
            {
                String ss="Not Sent...!";
                request.setAttribute("msg",ss);
                RequestDispatcher rd=request.getRequestDispatcher("Composemail.jsp");
                rd.forward(request, response);
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
