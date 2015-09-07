<%-- 
    Document   : Forgotpassword
    Created on : 13-Apr-2015, 23:34:27
    Author     : MISHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
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
    height: 200px;
    margin: 100px;
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
.tth
{
    font-size: x-large;
    font-weight: bolder;
    color: sienna;
}
.ttd
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
    String msg="";
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
    <center><font size="5" color="red"><%=msg%></font></center>
<%
    }
    
%>
    
<center>
<div class="ch">
    
    <table border="0" align="center">
        <tr><th colspan="2" height="60" class="tth">Recover Your Password</th></tr>
    
   
    
        <form action="Forgotpassword" method="post">
  
    <tr><td width="150" height="40" class="ttd">Enter Your Email</td><td class="ttd"> <input id="np" placeholder="Enter Your Email" type="email" name="mail" size="30" autofocus="" required=""></td></tr>
    <tr><td colspan="2" align="center" class="ttd"><input type="submit" value="Submit" class="in"></tr>
  
</form>
</table></div>

</center>
    </body>
</html>
<%@include  file="footer.jsp" %>
