<%-- 
    Document   : Userprofile
    Created on : 11-Apr-2015, 23:53:55
    Author     : MISHRA
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="userdto.Userdto"%>
<%@page import="userdao.Userdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Property Guide</title>
       
        <!-- -------------------------change pic ----------------------------- -->
<script type="text/javascript" src="js/jquery-1.8.3.min.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery.cycle.all.js" language="javascript"></script>
<script type="text/javascript" language="javascript" src="js/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript" language="javascript" src="js/property_group.js"></script>
<script type="text/javascript" src="js/source/jquery.fancybox.js"></script>
<!-- -------------------------change pic ----------------------------- -->

<style type="text/css">
body {
	background-color:#D9CAB1;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(img/top.png);
	background-repeat: no-repeat;
	background-position:top;
}
#pic{
    height:150px;
    width:120px;
    float: left;
    font-weight: bold;
}
#welcome{
    font-size: 30px;
    font-weight: bold;
    width: 800px;
    height: 50px;
    float: right;
    border-radius: 5px;
    color:sandybrown;
}
a
{
    color: sienna;
}
#dd{
        position:fixed;
        height:auto;
        width:auto;
        top:35%;
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
</style>
    </head>
    <body>
        <%

      String email = (String)session.getAttribute("useremail");
        if (email!=null)
        {
                
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
        Userdao ad=new Userdao();
        Userdto dto=new Userdto();
        String name="",pic="";
        ArrayList<Userdto> al=ad.getpic(email);
        dto=al.get(0);
        name=dto.getName();
        pic=dto.getPic();
        

 %>
 
 
                                        <!------------ Change Profile pic ------------>                     
     <form method="post" enctype="multipart/form-data" action="Changeuserpic" id="dd" style=" background:url(img/btm.png); background-size:500px 400px; float:none;position:fixed; margin-top:0px;" name="qform">
        <table align="center" border="0px">
            <tr height="200px">
                <td width="250px" valign="top" align="justify" style="padding-left:50px">
                    <img src="img/close.png" id="back" style="margin-left:330px;right:0%" /><br>
                    <label style="color: #FFFFFF;font-weight: bolder;font-size: larger; ">Select Picture : </label>
                    <input type="file" name="file" required="" style=" font-weight: bolder;font-size: larger;color: #FFFFFF;"><br><br>
                    <input type="submit" value="Set Profile Picture" style="font-weight: bolder; background:#fFF; margin-bottom:6px; color:#000; padding:6px; border: 3px solid sienna; border-radius:4px;"/>
                    
                        
                </td>
            </tr>
            <tr><td align="center"><label id="error" style="color:#FF0000"></label></td></tr>
        </table>
    </form>
                                         <div id="mask"></div>
                                             <!------------ end Change Profile pic ------------>
                                             
                                  
    
 <table height="500px"  border="0"><tr valign="top"><td>
<div>
  
    <div id="pic">
        <img src="profilepic/<%=pic%>" height="200px" width="180px" style=" border: 1px solid buttonface;  margin: 5px 0 0 5px; border-radius:10px; margin-left:5px " />
         <br><br>
         <table border="1">
         <tr><td height="40">&nbsp;&nbsp;<a href="Viewprofile" target="frame1" >View&nbsp;Profile</a></td></tr>
         <tr><td height="40">&nbsp;&nbsp;<a href="Editprofile.jsp" target="frame1">Edit&nbsp;Profile</a></td></tr>
         <tr><td height="40">&nbsp;&nbsp;<a href="javascript:void(0);" title="" class="enq" >Change&nbsp;Photo</a></td></tr>
         <tr><td height="40">&nbsp;&nbsp;<a href="Changeuserpass.jsp" target="frame1">Change&nbsp;Password</a></td></tr>
         <tr><td height="40">&nbsp;&nbsp;<a href="Viewbuyer" target="frame1">View&nbsp;Buyer</a></td></tr>
         <tr><td height="40">&nbsp;&nbsp;<a href="Viewproperty" target="frame1">View&nbsp;Uploaded&nbsp;Properties</a></td></tr>
         
         </table>
         
<br />
<br />
<br />
<br />
	</div>
</div>
         </td><td><div id="welcome" style="margin-left: 10px;">
    <br />
    
    Welcome&nbsp;<%=name%>
    </div><iframe name="frame1" frameborder="0" width="1130px" height="450px" style="margin-left:7%;margin-top:0%">
    </iframe></td></tr>
 </table>
                            
    </body>
    
</html>
<%@include file="footer.jsp" %>
