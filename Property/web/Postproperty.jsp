<%-- 
    Document   : Postproperty
    Created on : 11-Apr-2015, 23:43:35
    Author     : MISHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%

      String email = (String)session.getAttribute("useremail");

        if (email!=null)
        {
                out.println(email);
        }
        else
        {
            response.sendRedirect("index.jsp");
        }

 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Property Guide</title>
        <link type="text/css" rel="stylesheet" href="css/property_guide.css" />
<link type="text/css" rel="stylesheet" href="css/contact_us.css" />
<link type="text/css" rel="stylesheet" href="css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="css/form.css" />
<link type="text/css" rel="stylesheet" href="css/form-base.css" />
<link type="text/css" rel="stylesheet" href="css/marketing.css" />


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
#dd1 {
	left:-300px;
	position:fixed;
	margin-top:150px;
	z-index:10000
}
.requestForm
{
width: 300px;
height: 320px;
float: left;
padding: 10px;
background-repeat: no-repeat;
background-position: center top;
margin-top: -40px;
margin-left: -25px;}


#commonScroller { font:13px/1.5em Arial; position:absolute; width:190px; visibility:hidden; z-index:100; border:1px solid #a5a5a5; background:#fff; }
	#commonScroller, #commonScroller a,  #commonScroller a:link, #commonScroller a:visited { color:#444; text-decoration:none; }
	#commonScroller a:hover{ color:#000;}
	#commonScroller .l { background:#e8edf5 url(img/scroller-lbg.gif) repeat-x bottom; margin-top:2px; padding:3px 10px; }
	#commonScroller .l img { vertical-align:middle; }
#dd{
    position:fixed;
	height:auto;
	width:auto;
	top:10%;
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
	filter:alpha(opacity'50');
	display:none;
	}
		.blink_me{
	animation-name:blinker;
	animation-duration:1s;
	animation-timing-function:linear;
	animation-iteration-count:infinite;
	-webkit-animation-name:blinker;
	-webkit-animation-duration:1s;
	-webkit-animation-timing-function:linear;
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
	
</style>
<script type="text/javascript" src="js/jquery-1.8.3.min.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery.cycle.all.js" language="javascript"></script>
<script type="text/javascript" language="javascript" src="js/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript" language="javascript" src="js/kundan_group.js"></script>
<script type="text/javascript" src="js/source/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" language="javascript" src="js/pop_contact_scroll.js"></script>

<link rel="stylesheet" type="text/css" href="js/source/jquery.fancybox.css" media="screen" />
<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="js/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript" src="js/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="js/source/helpers/jquery.fancybox-thumbs.css" />
<script type="text/javascript" src="js/source/helpers/jquery.fancybox-thumbs.js"></script>
<script type="text/javascript">
	var persistclose=0 //set 0 or 1. 1 means it closed for browser session
	var startX = 10 //set x offset of bar in pixels
	var startY = 70 //set y offset of bar in pixels
	var verticalpos="frombottom" // "fromtop" or "frombottom"
	var id_name ="commonScroller"
	var ti_alignment = "right"
	</script>
<script type="text/javascript" language="javascript">

</script>
    </head>
    <body onLoad="MM_preloadImages('img/search_btn_hover.png')">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=524672054267653";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">





</table>


<!-- ------------------------------------ Post property Start --------------------------- -->

<table width="80%" class="mainpage" align="center" style="height:auto"><tr><td valign="top">
<table width="980" border="0" align="center"  cellpadding="0" cellspacing="5">

<tr valign="top">
<td align="center">

	<table cellspacing="1" cellpadding="6" align="center" border="0" bgcolor="#4B7A96" >
<tbody>
<tr>
    <td valign="top" nowrap>
        <form method="post" action="Postproperty"  name="student_frm" id="student_frm" enctype="multipart/form-data">
	<table class="tborder"  cellspacing="1" align="center" border="0" bgcolor="#4B7A96" height="285px" width="700">
	<tbody>
	<tr valign="top">
	    <td  align="center" height="40px"><h2 style="color:#F06836">Post Your Property Now :</h2><hr /></td>
        <td align="center">
                </td>
       </tr>
       <center>
<%
    String msg="";
    msg=(String)request.getAttribute("msg");
    if(msg!=null)
    {
%>
<font size="5" color="red" ><%=msg%></font>
<%
    }
    
%>
    </center>  
        <tr>
	    <td class="alt1" colspan="2">
		<div class="alt2 raised" align="center">
       <div align="left">
		    <fieldset>
		    <div>
                        
			<table cellSpacing="0" width="90%" cellPadding="6" border="0" align="right" style="margin-right:-50px;" >
			<tbody>

			<tr vAlign="middle">
			    <td><strong>Full Name</strong></td><td>
                <input type="text" class="easyui-validatebox" size="50" maxsize="100" name="fname" placeholder="Your Full Name" required=""/>
                </td>
			

            <tr>
            <td><strong>Contact Number</strong></td>
           <td><input type="text" size="50" maxsize="100" name="phone" placeholder="+91-0123456789" required=""/></td>
            </tr>

            <tr>
            <td><strong>Type Of Property</strong></td>
           <td>
           <select name="ptype">
           <option value="select">Select Type</option>
           <option value="Buy">Buy</option>
           <option value="Sell">Sell</option>
           <option value="Rent">Rent</option>
           
           </select>

           </td>
            </tr>
            <tr>
            <td><strong>Location/Area</strong></td>
           <td>
           <input type="text" size="50" maxsize="100" name="location" placeholder="Enter Location/Area" required=""/>

           </td>
            </tr>
            <tr>
            <td><strong>City</strong></td>
           <td>
           <input type="text" size="50" maxsize="100" name="city" placeholder="Enter City" required=""/>

           </td>
            </tr>
            <tr>
            <td><strong>Select State</strong></td>
           <td>
           <select name="state">
               <option value="state" selected="selected">Select State</option>
           
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                    <option value="Chattisgarh">Chattisgarh</option>
                    <option value="Chandigarh">Chandigarh</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Goa">Goa</option>
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
                    <option value="Uttaranchal">Uttaranchal</option>
                    <option value="West Bangal">West Bangal</option>
           </select>
           </td>
            </tr>
            
            <tr>
            <td><strong>Rate Of Property</strong></td>
           <td>
           <select name="prate">
           <option value="rate">Rate of Property</option>
           <option value="Below 5 Lack">Below 5 Lack</option>
           <option value="5 - 10 Lack">5 - 10 Lack</option>
           <option value="10 - 20 Lack">10 - 20 Lack</option>
           <option value="Above 20 Lacks">Above 20 Lacks</option>
           </select>

           </td>
            </tr>

             </tr>
            <tr>
            <td><strong>Property Logo/Pic</strong></td>
           <td>
           <input type="file" name="logo" value="Please select Your Logo" required="" />

           </td>
            </tr>

            <tr>
            <td><strong>Enter Services</strong></td>
            <td><textarea rows="4"  name="services" required=""></textarea></td>
            </tr>

             <tr vAlign="middle">
			    <td colspan="2">&nbsp;</td>
			</tr>


			 <tr valign=top>
            <td align="center"><input type="submit" value="submit" style="padding:3px 5px 3px 5px" class="submit"></td>
            <td align="justify"><input type="reset" value="CLEAR" style="padding:3px 5px 3px 5px" class="submit"></td>
            </tr>
			</tbody>
			</table>
                        
		    </div>
		    </fieldset>
		</div>
		</div>

	    </td>
	</tr>
	</tbody>
	</table>
    </form>

    </td>

</tr></tbody></table></div>
   </td>
  <td width="18">&nbsp;</td>
    <td width="215" align="center" valign="top">
    </td>
  </tr>
</table>
</td></tr></table>

<%@include file="footer.jsp" %>
</body>
</html>
