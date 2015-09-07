<%-- 
    Document   : adminlogin
    Created on : 7 Apr, 2014, 12:18:56 PM
    Author     : Neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Property Guide</title>
        <style type="text/css">
.tcat {
	background: #079ACB;
	font: 11px verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;
	color: #ffffff;
}
.tcat a:link {
	color: #ffffff;
	text-decoration: none;
}
        </style>
    </head>
   <body bgcolor="#F4F4F4">
<table  cellspacing="1" cellpadding="10" width="100%" align="center" border="0" class="tborder">
  <tbody>
    <tr>
      <td class="tcat" valign="top" height="50px"><h3>Advanced Property Guide</h3>
        Admin Panel For Location Guide </td>
    </tr>
  </tbody>
</table>
<table cellspacing="1" cellpadding="6" width="95%" align="left" border="0">
  <tbody>
    <tr>
      <td valign="top" nowrap height="350px"><span style="color:#990000">
        </span> <br>
        <br>
        <form action="Adminlogin" method="post" accept-charset="utf-8">
          <table class="tborder" cellspacing="1" cellpadding="6" width="400px" align="center" border="0">
            <tbody>

            <tr>
              <td class="tcat" colspan="2" align="center"><strong>Please enter your Admin User name and password to log in</strong></td>
            </tr>
            <tr>

                <tr><th>
<%
    String msg="";
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
                <font size="5" color="red"><%=msg%></font>
<%
    }
    
%>
                </th></tr>
                
            <td class="alt1">

            <div class="alt2 raised" align="center">

            <div align="left">

            <fieldset>

            <legend>Login Form</legend>
            <div style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px">
              <table cellSpacing="0" width="100%" cellPadding="6" border="0">
                <tbody>
                  <tr vAlign="top">
                    <td colSpan="2">User_Name<br>
                        <input type="text" name="username" value="" size="50" class="bginput required" id="username" maxlength="100" title="username" required="required" placeholder="Your Username" autofocus="" /></td>
                  </tr>
                  <tr vAlign=top>
                    <td colSpan="2">Password<br>
                      <input type="password" name="password" value="" size="50" class="bginput required" id="password" maxlength="100" title="Password" required="required" placeholder="***********"  /></td>
                  </tr>
                </tbody>
              </table>
            </div>
            </fieldset>
            </div>

            </div>

            <div style="MARGIN-TOP: 6px" align=center> &nbsp;&nbsp;
              <input type="submit" name="" value="Login" class="button"  />
            </div>
            </td>

            </tr>
            
            </tbody>

          </table>
        </form>
      </td>
    </tr>
  </tbody>
</table>
</body>
</html>
