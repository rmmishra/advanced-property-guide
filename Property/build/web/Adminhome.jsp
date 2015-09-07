<%-- 
    Document   : Adminhome
    Created on : 09-Apr-2015, 12:24:43
    Author     : MISHRA
--%>

<%@page import="admindao.Admindao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Property Guide</title>
        
<link rel="stylesheet" type="text/css" href="css/style_blue.css" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>

<!-- -------------------------change pic ----------------------------- -->
<script type="text/javascript" src="js/jquery-1.8.3.min.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery.cycle.all.js" language="javascript"></script>
<script type="text/javascript" language="javascript" src="js/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript" language="javascript" src="js/property_group.js"></script>
<script type="text/javascript" src="js/source/jquery.fancybox.js"></script>
<!-- -------------------------change pic ----------------------------- -->



<style>
    #mask
    {
        position:fixed;
        height:100%;
        width:100%;
        margin:0;
        padding:0;
        top:0;
        left:0;
        z-index:6000;
        background-color:#000;
        opacity:0.9;
        filter:alpha(opacity '50');
        display:none;
    }
    #dd{
        position:fixed;
        height:auto;
        width:auto;
        top:20%;
        left:50%;
        margin-top:-400px;
        margin-left:-200px;
        display:none;
        background:#F17077;
        z-index:7000;padding:10px;
        -moz-box-shadow:0 0 10px #aaa;
        -webkit-box-shadow:0 0 10px #aaa;
        -moz-border-radius:5px ;
        -webkit-border-radius:5px ;
    }
   
.tcat {
	background: #079ACB;
	font: 11px verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;
	color: #ffffff;
}
.tcat a:link {
	color: #ffffff;
	text-decoration: none;
}
#pic{
    height:150px;
    width:120px;
    float: left;
	font-weight: bold;
}

</style>
    </head>
<body>

<%
            String name="";
            String pic="";
            if(session.getAttribute("aname")!=null)
            {  
               name=(String)session.getAttribute("aname"); 
               
            }  
            else
            {  
               response.sendRedirect("index.jsp");
            }
            Admindao ad=new Admindao();
            pic=ad.getpic(name);
%>
											<!------------ Header Area ------------>


<table  cellspacing="1" cellpadding="10" width="100%" align="center" border="0" class="tborder">
  <tbody>
    <tr>
      <td class="tcat" valign="top" height="10px">
        <h3>Admin Panel For Location Guide</h3><span onMouseOut="style.border='dotted 0px #FFFFFF'"  style="border: 0px dotted rgb(150, 177, 129);float:right;"><a href="Adminlogout" style="color:#FFFFFF;font-weight:bold">Logout</a></span> </td>
    </tr>
  </tbody>
</table>
                                                                                        
                                             <!------------ Change Admin Profile pic ------------>                     
     <form method="post" enctype="multipart/form-data" action="Changeadminpic" id="dd" style=" background:url(img/btm.png); background-size:500px 400px; float:none;position:fixed; margin-top:0px;" name="qform">
        <table align="center" border="0px">
            <tr height="200px">
                <td width="250px" valign="top" align="justify" style="padding-left:50px">
                    <img src="img/close.png" id="back" style="margin-left:330px;right:0%" /><br><br><br>
                    <label style="color: #FFFFFF;font-weight: bolder;font-size: larger; ">Select Picture : </label><br>
                    <input type="file" name="file" required="" style=" font-weight: bolder;font-size: larger;color: #FFFFFF;"><br><br>
                    <input type="submit" value="Set Profile Picture" style="font-weight: bolder; background:#fFF; margin-bottom:6px; color:#000; padding:6px; border: 3px solid sienna; border-radius:4px;"/>
                    
                        
                </td>
            </tr>
            <tr><td align="center"><label id="error" style="color:#FF0000"></label></td></tr>
        </table>
    </form>
                                             <div id="mask"></div>
                                             <!------------ Change Admin Profile pic ------------>
                                             
                                                                                       
						<!------------ Middle Content Area ------------>

<iframe name="frame1" frameborder="0" width="85%" height="450px" style="margin-left:5%;margin-top:5%;margin-bottom: 0% ">
    </iframe>
<div id="pic">
    <img src="adminimg/<%=pic%>" height="100%" width="100%" style="margin-left: 5px; border-radius:3px; vertical-align:top" />
</div>
<br /> <br /><br /> <br /><br /> <br /><br /> <br /> <br /><br/>


 <div class="sidebar" id="sidebar" style="margin-top:-420px">
    <h2>Basic</h2>

        <ul>
            <li><a href="" class="selected">Home</a></li>
            <li><a href="javascript:void(0);" title="" class="enq">Change Profile Pic</a></li>
            <li><a href="Changepass.jsp" target="frame1">Change Password</a></li>
            <li><a href="Changeadminname.jsp" target="frame1">Change User Name</a></li>
        </ul>
<br>
    <h2>Info</h2>

        <ul>
            <li><a href="Userinfo" target="frame1">User Info</a></li>
            <li><a href="Uploadedproperty" target="frame1">Uploaded Property</a></li>
            <li><a href="Showenquiry" target="frame1">Enquiry</a></li>
        </ul>
<br>
    
		<h2>Mail</h2>

        <ul>
<!--            <li><a href="Inbox" target="frame1">Inbox</a></li>-->
            <li><a href="Composemail.jsp" target="frame1">Compose Mail</a></li>
            <li><a href="Sentmail" target="frame1">Sent Mail</a></li>
        </ul>

    </div>
<br>

    <div class="clear"></div>
    
													<!--end of center_content-->
													<!------------ Footer Area ------------>

                                                                                                        
    <div class="footer">
        <table  cellspacing="1" cellpadding="10" width="100%" align="center" border="0" class="tborder" >
  <tbody>
    <tr>
        <td class="tcat" valign="top" height="50px">Copyright &copy; 2015 Advanced Property Guide. All Right Reserved.       </td>
    </tr>
  </tbody>
</table>
	</div>
</div>

</body>
</html>