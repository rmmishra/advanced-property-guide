<%-- 
    Document   : Registration
    Created on : 08-Apr-2015, 14:22:18
    Author     : MISHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/property_guide.css" />
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css" />
        <link type="text/css" rel="stylesheet" href="css/menu.css" />
        <link type="text/css" rel="stylesheet" href="css/form.css" />
        <link type="text/css" rel="stylesheet" href="css/form-base.css" />
        <link type="text/css" rel="stylesheet" href="css/marketing.css" />


        <style type="text/css">
body {
	background-color:#FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(img/top.png);
	background-repeat: no-repeat;
	background-position:top;
}
h3{color:#E39048;}
ul
{
	background:#FFF;
	list-style:none;
}
.nav li a
{
	text-decoration:none;
	padding:10px;
	float:left;
	margin-top:2px;
	color:#FFF;
}
.nav li a:hover
{
	background:url(img/top_hover.png) repeat-x;
	width:auto;
}
.submenu
{
	position:absolute;
	display: none;
	z-index:2000;
	width:auto;
	padding: 0px;
	margin-left: -65px;
	top:149px;
	left:717px;
	clear:both;
	background:url(img/topmenu.png);
}
.submenu li a
{
	width:170px;
}
.submenu li a:hover
{
	background:url(img/top_hover.png) repeat-x;
	width:170px;
}
.haschildren:hover .submenu
{
display:block
}


.blink_me{
	animation-name:blinker;
	animation-duration:1s;
	animation-timing-function:linear;
	animation-iteration-count:infinite;
	-webkit-animation-name:blinker;
	-webkit-animation-duration:1s;
	-webkit-animation-timing-function:1 ;
	-webkit-animation-iteration-count:infinite;
	}
	@-moz-keyframes blinker {  /* Decimal not necessary, 0 and 1 is enough */
    0% { opacity: 1.0; }
    50% { opacity: 0.0; }
    100% { opacity: 1.0; }
}

@-webkit-keyframes blinker {
    0% { opacity: 1.0; }
    50% { opacity: 0.0; }
    100% { opacity: 1.0; }
}

@keyframes blinker {
    0% { opacity: 1.0; }
    50% { opacity: 0.0; }
    100% { opacity: 1.0; }
}

form div.dynamiclabel{ /* div container for each form field with pop up label */
  display: block;
  margin: 30px;
  font: 16px;
  position: relative;
  padding-left:150px;
}


form div.dynamiclabel input[type="text"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel textarea{
  height: 200px;
}


form div.dynamiclabel label{ /* pop up label style */
  position: absolute;
  left: 0;
  background: lightyellow;
  border: 1px solid yellow;
  border-radius: 2px;
  padding: 3px 10px;
  box-shadow: 4px 1px 5px gray;
  font-weight: bold;
  -webkit-backface-visibility: hidden;
  top: 10px; /* initial top position of label relative to dynamiclabel container */
  -moz-transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  -webkit-transition: all 0.4s ease-in-out; /* Safari doesn't seem to support cubic-bezier values beyond 0 to 1, so use keyword value instead */
  -o-transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  opacity: 0;
  z-index: -1;
}


form div.dynamiclabel > *:focus{ /* when user focuses on child element inside div.dynamiclabel */
  border: 1px solid #45bcd2;
  box-shadow: 0 0 8px 2px #98d865;
}


form div.dynamiclabel > *:focus + label{ /* label style when user focuses on child element inside div.dynamiclabel */
  opacity: 1;
  z-index:100;
  top: 0px; /* Post top position of label on focus relative to dynamiclabel container */
  -ms-transform: rotate(-3deg);
  -moz-transform: rotate(-3deg);
  -webkit-transform: rotate(-3deg);
  transform: rotate(-3deg);
}
</style>
    </head>
        <body onLoad="MM_preloadImages('img/search_btn_hover.png')">


                        <!-- Header Start -->

                        <!-- Top Header Area -->

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr align="left">
    <td width="258" height="150" rowspan="3" align="left" valign="middle">
    <a href="index.jsp">
        <img src="img/logo.png" width="198" height="112" style="border: none" title="Advance Property Guide" alt="Logo" />
    </a>
    </td>
    <td width="231" rowspan="3">&nbsp;</td>
    <td width="72" height="60">&nbsp;</td>
    <td width="50" align="center"><img src="img/ce.png" width="29" height="29" title="24*7 Call Service"/></td>
    <td width="176" class="style1"><strong>Call Us</strong><br />
    +91-9827936806</td>
    <td width="50" align="center"><img src="img/e-.png" width="29" height="29" title="24*7 Email Service"/></td>
    <td width="163" class="style1"><strong>E-mail</strong><br />
    rajneeshmishra70@gmail.com
    </td>
  </tr>

  <tr>
    <td height="46" colspan="5" align="right">
    </td>
  </tr>



                                                                   <!-- Top Header Area End -->



                                                                   <!-- Menu Area -->



  <tr>
    <td height="44" colspan="6" align="center" class="menu" valign="top">
    <ul class="nav" style="margin-top:-8px;margin-left: -10px;width: 620px">
	<li><a href="index.jsp">Home</a></li>
    <li class="haschildren"><a href="aboutus.jsp">About Us</a></li>
    <li class="haschildren"><a href="">Contact Us</a></li>
    <li><a href="Allproperty.jsp">All Property</a></li>
    
<%
 String email3 = (String)session.getAttribute("useremail");
 //out.println(email3);
 if(email3!=null){
%>
<li><a href="Postproperty.jsp">Post  Your Property</a></li>
<li><a href="Userprofile.jsp">Go To My Profile</a></li>
<li ><a href="Userlogout">SIGNOUT</a></li>

<%

 //session.removeAttribute("useremail");

 } %>
</ul>
    </td>
  </tr>


                                                                 <!-- Menu Area End -->
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F06836">
  <tr>
    <td height="3px"></td>
  </tr>
</table>

								<!-- Header End -->