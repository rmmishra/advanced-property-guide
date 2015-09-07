<%-- 
    Document   : Changeuserpass
    Created on : 12-Apr-2015, 16:12:55
    Author     : MISHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Advanced Property Guide</title>
        
<style>
.ch
{
    border: 4px solid #7a7a7a;
    box-shadow: 0 0 8px 2px #98d865;
    width: 500px;
    height: 250px;
    margin-left: 180px;
}
input
{
    height: 30px;
    width: 250px;
    
}
input:focus{ /* when user focuses on child element inside div.dynamiclabel */
  border: 2px solid #45bcd2;
  box-shadow: 0 0 8px 2px #98d865;
}
th
{
    font-size: x-large;
    font-weight: bolder;
    color: sienna;
}
td
{
    font-size: large;
    font-weight: bolder;
    color: sandybrown;
    padding:  10px;
}
.in
{
    width: 150px;
    border: 2px solid #444;
    
}
</style>
    </head>
     <body>
        <%
            String email = (String)session.getAttribute("useremail");
      
        if (email!="")
            {
                
            }
        else
        {
            response.sendRedirect("index.jsp");
        }
        %>
        
                                               <!------------ Middle Content Area Start------------>
<br><br><br><br><br><br>

  
<%
    String msg="";
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
<font size="5" color="red" style="margin-left: 300px"><%=msg%></font>
<%
    }
    
%>
                 
<div class="ch">
    <table border="0" align="center">
    <tr><th colspan="2" height="60">Change Your Password</th></tr>
    
   
    
<form action="Changeuserpass">
  
    <tr><td width="150" height="40">Old Password : </td><td> <input id="nn" placeholder="Old Password" type="password" name="opsd" size="30" autofocus="" required=""></td></tr>
    <tr><td width="150" height="40">New Password : </td><td><input id="nn" placeholder="New Password" type="password" name="npsd" size="30" required=""></tr></td>
<tr><td colspan="2" align="center"><input type="submit" value="Change It" class="in"></tr>
  
</form>
</table></div>

                                            <!------------ Middle Content Area End------------>
        
        
    </body>
</html>
