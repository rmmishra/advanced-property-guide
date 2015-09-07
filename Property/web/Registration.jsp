<%-- 
    Document   : Registration
    Created on : 08-Apr-2015, 14:22:18
    Author     : MISHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Advanced Property Guide</title>
<script src="js/Registration_Validation.js"></script>
    </head>
    <body>
        <!-- ------------------------------------ Registration Start --------------------------- -->


        <form action="Registration" method="post" id="regdform"  name='regis' onsubmit="return validation();">
            <center>
            <table align="center" border="0" style="margin-left: 30%;">
            <tr>
                <td colspan="2">
         <img src="img/RegisterHere.png" alt="Register" align="middle" width="600px" height="50px">
                </td>
            </tr>
            <tr><td>&nbsp;&nbsp;</td></tr>
<%
    String msg="";
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
                <tr><td colspan="2" align="center"><font size="5" color="red"><%=msg%></font></td></tr>
<%
    }
    
%>
            
            <tr>
                <td>
                    First_Name:
                </td>
                <td><input type="text" name="name" required="" placeholder="Enter Your First Name" autofocus=""> </td>
                <td><span id="n1" style="color:red;font-size:large"></span></td>
            </tr>
            <tr>
                <td>
                    Last_Name:
                </td>
                <td><input type="text" name="lname" required="" placeholder="Enter Your Last Name"> </td>
                <td><span id="n6" style="color:red;font-size:large"></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
             <tr>
                <td>
                    Gender:
                </td>
                <td><input type="radio" name="gender" required="" value="male">    Male
                 <input type="radio" name="gender" required="" value="female">     Female </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    Email:
                </td>
                <td><input type="email" name="email"  placeholder="Enter Your Email" required=""> </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    Password:
                </td>
                <td><input type="password" name="pwd" required="" placeholder="**********" > </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    Confirm Password:
                </td>
                <td><input type="password" name="cpwd" required=""  placeholder="**********" > </td>
                <td><span id="n2" style="color:red;font-size:large"></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
           <tr>
                <td>
                    Contact:
                </td>
                <td><input type="text" name="contact" placeholder="Enter Your Contact No" required=""> </td>
                <td><span id="n3" style="color:red;font-size:large"></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    State:
                </td>
                <td>
                    <select name="state" style="width:280px">
                    <option value="" selected="selected">Select a State</option>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                    <option value="Chattisgarh">Chattisgarh</option>
                    <option value="Chandigarh">Chandigarh</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Gujarat">Gujarat</option>
                    <option value="Hariyana">Hariyana</option>
                    <option value="Jharkhand">Jharkhand</option>
                    <option value="Keral">Keral</option>
                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Panjab">Panjab</option>
                    <option value="Rajasthan">Rajasthan</option>
                    <option value="Tamilnafu">Tamilnadu</option>
                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                    <option value="West Bangal">West Bangal</option>
                    </select>
                </td>
                <td><span id="n4" style="color:red;font-size:large"></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                    <input type="text" name="city" placeholder="Enter Your Current City" required="">
                </td>
                <td><span id="n5" style="color:red;font-size:large"></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
           <tr>
                <td>
                    
                </td>
                <td>
                    <input type="submit" value="Register">
                    <input type="reset" value="Reset">
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            </table></center>
 </form>

        <!-- ------------------------------------ Registration End --------------------------- -->
    <%@include file="footer.jsp" %>
</body>
</html>