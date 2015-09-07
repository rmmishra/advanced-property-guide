<%-- 
    Document   : Passwordrecovery
    Created on : 15-Apr-2015, 00:06:34
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
    height: 300px;
    margin: 50px;
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
<script>
    function validation()
{           
	//name checking//
    var npwd=document.forms["regis"]["npwd"].value;
    var cpwd=document.forms["regis"]["cpwd"].value;
    if (npwd!==cpwd)
    {
        
    document.getElementById("n").innerHTML="Password Not Match!";
    //alert('Enter Correct Mobile no!');
    document.regis.npwd.focus();
    return false;
    }
        
}
</script>
    </head>
    <body>
         <%
    String msg="";
    String mail=request.getParameter("Email");
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
    <center><font size="5" color="red"><%=msg%></font></center>
<%
    }
    
%>
    <center><span id="n" style="color:red;font-size:large"></span></center>    
<center>
<div class="ch">
    
    <table border="0" align="center">
        <tr><th colspan="2" height="60" class="tth">Set Your Password</th></tr>
    
   
    
        <form action="Setpassword" method="post" name="regis" onsubmit="return validation();">
  
            <tr><td width="150" height="40" class="ttd">Your Email</td><td class="ttd"> <input id="np" placeholder="Enter Your Email" type="email" value="<%=mail%>" name="mail" size="30" readonly="" required=""></td></tr>
    <tr><td width="150" height="40" class="ttd">New Password</td><td class="ttd"><input id="cn" placeholder="New Password" type="password" name="npwd" size="30" autofocus="" required=""></tr></td>
<tr><td width="150" height="40" class="ttd">Confirm&nbsp;Password</td><td class="ttd"><input id="nn" placeholder="Confirm Password" type="password" name="cpwd" size="30" required=""></tr></td>
<tr><td colspan="2" align="center" class="ttd"><input type="submit" value="Submit" class="in"></tr>
  
</form>
</table></div>

</center>
    </body>
</html>
<%@include  file="footer.jsp" %>
