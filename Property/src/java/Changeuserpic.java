/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.omg.CORBA.SystemException;
import userdao.Userdao;
import userdto.Userdto;

/**
 *
 * @author MISHRA
 */
@WebServlet(urlPatterns = {"/Changeuserpic"})
public class Changeuserpic extends HttpServlet {

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
            
            String pat=configuration.Configuration.userpic; 
            File pp = new File(pat);
            if(!pp.exists())
            {
               pp.mkdir();
            }
            MultipartRequest m=new MultipartRequest(request,pat, 1024 *1024 * 1024,new com.oreilly.servlet.multipart.DefaultFileRenamePolicy());
            String iname=m.getOriginalFileName("file");
            Userdao ado=new Userdao();
            Userdto dto=new Userdto();
            dto.setMail(email);
            dto.setPic(iname);
            int n=ado.setpic(dto);
            if(n>0)
            {
                response.sendRedirect("Userprofile.jsp");
            }
            else
            {
                response.sendRedirect("Userprofile.jsp");                
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
