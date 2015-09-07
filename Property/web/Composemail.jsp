<%-- 
    Document   : Composemail
    Created on : 14-Apr-2015, 01:17:01
    Author     : MISHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Advanced Property Guide</title>
    </head>
    <body>
        <%
            String name="";
       if(session.getAttribute("aname")!=null)
            {  
               name=(String)session.getAttribute("aname"); 
               
            }  
            else
            {  
               response.sendRedirect("index.jsp");
            }
       
    String msg="";
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
    <center><font size="5" color="red"><%=msg%></font></center>
<%
    }
%>
       
       <form action="Composemail" method="post">
           <table border="1" align="center"  style="margin-top: 80px;">
               <tr><th colspan="4"><font size="5" style="color: peru;">Compose Mail</font></th></tr>
               
            <tr height="20px">
                <th>To:</th><td><input type="email" value="" name="to" size="35"  placeholder="Enter target email id" autofocus="" required="" /></td>
            
                <th>Subject:</th><td><input type="text" name="sub" size="35" placeholder="Enter Subject" required="" /></td></tr>
            <tr>
                <th>Message:</th><td colspan="3"><textarea cols="65" rows="7" name="msg" placeholder="Message..." required="" ></textarea></td></tr>
            <tr><td colspan="4" align="center"><input type="submit" value="Send Mail"></td></tr>
            </table>
        </form>
       
    </body>
</html>
