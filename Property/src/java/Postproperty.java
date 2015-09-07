/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(urlPatterns = {"/Postproperty"})
public class Postproperty extends HttpServlet {

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
            
          String pat=configuration.Configuration.propertypic; 
            File pp = new File(pat);
            if(!pp.exists())
            {
               pp.mkdir();
            }
            MultipartRequest m=new MultipartRequest(request,pat, 1024 *1024 * 1024,new com.oreilly.servlet.multipart.DefaultFileRenamePolicy());
            String iname=m.getOriginalFileName("logo");
            Userdao ado=new Userdao();
            Propertydto dto=new Propertydto();
            
            String fname=m.getParameter("fname");
            String cont=m.getParameter("phone");
            String type=m.getParameter("ptype");
            String area=m.getParameter("location");
            String city=m.getParameter("city");
            String state=m.getParameter("state");
            String rate=m.getParameter("prate");
            String service=m.getParameter("services");
            dto.setName(fname);
            dto.setContact(cont);
            dto.setType(type);
            dto.setArea(area);
            dto.setCity(city);
            dto.setState(state);
            dto.setRate(rate);
            dto.setService(service);
            dto.setPic(iname);
            dto.setMail(email);
            
            int n=ado.insertproperty(dto);
            if(n>0)
            {
                response.sendRedirect("index.jsp");
            }
            else
            {
               String ss="Not Inserted!";
                request.setAttribute("msg",ss);
                RequestDispatcher rd=request.getRequestDispatcher("Postproperty.jsp");
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
