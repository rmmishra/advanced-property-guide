<%-- 
    Document   : Searchproperty
    Created on : 11-Apr-2015, 14:37:57
    Author     : MISHRA
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="propertydto.Propertydto"%>
<%@page import="userdao.Userdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Property Guide</title>

<style>
.b
{
	background-repeat:no-repeat;
	background-size:100% 100%;
}
th
{
    color: #5C4647;
    font-weight: bolder;
    font-size: large;
    height: 50px;
}
td
{
    color: #000; 
    font-size: large ;
    
}
</style>
</head>
<body>
    <table height="300px" width="1150px" align="center" border="0px" cellspacing="0px" cellpadding="0px" bgcolor="#EEEEEE">
<%
    int n=0;
            
            Userdao ud=new Userdao();
            Propertydto pdto=new Propertydto();
            
            ArrayList<Propertydto> al=ud.getallproperty();
            Iterator<Propertydto> it=al.iterator();
            while(it.hasNext())
	    {
                n=1;
		pdto=it.next();
%>


<tr>
    <td>
<table  border="2" align="center" class="r b"  style="margin-left:50px; margin-top:30px; margin-bottom:30px; border-radius:20px;  -moz-box-shadow:0 0 20px; -webkit-box-shadow:0 0 20px; border:solid #9A4E4E;" bgcolor="#E3EAF4">
    <tr><th>Property Image</th><th>Owner Name</th><th>Property Type</th><th>Area/Location</th><th>City</th><th>State</th><th>Range</th><th>Contect</th><th>Email</th><th>Service</th></tr>
    
  <tr >
      
     <td  align="center" >
         
      <div  class="style1"> <img src="propertyimg/<%=pdto.getPic()%>" height="150px" width="200px" align="center" /> </div></td>
     <td>  <%=pdto.getName()%>
    </td>
    <td><%=pdto.getType()%></td>
    <td ><%=pdto.getArea()%></td>
    <td ><%=pdto.getCity()%></td>
    <td><%=pdto.getState()%></td>
    <td ><%=pdto.getRate()%></td>
    <td ><%=pdto.getContact()%></td>
    <td ><%=pdto.getMail()%></td>
    <td ><%=pdto.getService()%></td>
  </tr> 
</table>

    </td>
</tr>
<%
    }
            if(n==0)
            {
                
%>
<br><br>
<font size="5" color="grey">&nbsp;&nbsp;&nbsp;No Record Found !</font>

<%
        }
%>
</table>
</body>
</html>
<%@include  file="footer.jsp" %>
