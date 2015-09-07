<%-- 
    Document   : Editprofile
    Created on : 12-Apr-2015, 23:27:08
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
    width: 200px;
    
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
    width: 100px;
    border: 2px solid #444;
    
}
select
{
    height: 30px;
    width: 200px;
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
    <tr><th colspan="2" height="60">Edit Your Profile</th></tr>
    
   
    
    <form action="Editprofile" method="post">
  
        <tr><td width="150" height="40">Select Info : </td><td><select name="select" id="nn">
                    <option value="select" selected="">Select</option>
                    <option value="name">Name</option>
                    <option value="contact">Contact</option>
                    <option value="city">City</option>
                    <option value="state">State</option>
                    
                </select> </td></tr>
        <tr><td width="100" height="40">Enter info  : </td><td><input id="nn" placeholder="Enter info" type="text" name="info" size="30" required=""></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="Edit" class="in"></td></tr>
  
</form>
</table></div>

                                            <!------------ Middle Content Area End------------>
        
    </body>
</html>
