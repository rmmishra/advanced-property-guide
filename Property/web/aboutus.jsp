
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
	filter:alpha(opacity='50');
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
<script type="text/javascript" language="javascript" src="js/property_group.js"></script>
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




<!-- ------------------------------------ About Us Start --------------------------- -->
<table width="1020" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="767" height="479" align="center" valign="top">


    <br>
    <table width="748" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" colspan="2" align="left" valign="top" style="background:url(img/line_do.png) no-repeat bottom"><span class="style26">ABOUT PROPERTY GUIDE :</span></td>
        </tr>
      <tr>
        <td width="244" height="203" align="left" valign="top" class="img"><br>
        <img src="img/img.png" width="215" height="165" style="margin-bottom:15px"/>
        <img src="img/img_1.png" width="215" height="165" style="margin-bottom:15px"/>
        <img src="img/img_2.png" width="215" height="165" style="margin-bottom:15px"/>
        </td>
        <td width="504" align="left" valign="top">
        <p align="justify" class="style33 contact-address">
        <b>Property Guide Properties</b> invites you to a once in a lifetime opportunity to avail the best property deals. We are a prominent Property Dealer in Kundli Sonipat & Delhi/NCR, offering a comprehensive range of real estate services to the prospective clients. We are widely acknowledged for our services regarding Buy / Sell Residential House & Commercial Shops in Kundli Sonipat & Delhi/NCR, Indore, Jodhpur, Patiala and Baddi. In addition, we also offer one of a kind service real estate service like Property Leasing Services.Properties invites you to a once in a lifetime opportunity to avail the best property deals. We are a prominent Property Dealer in Kundli Sonipat & Delhi/NCR, offering a comprehensive range of real estate services to the prospective clients. We are widely acknowledged for our services regarding Buy / Sell Residential House & Commercial Shops in Kundli Sonipat & Delhi/NCR, Indore, Jodhpur, Patiala and Baddi. In addition, we also offer one of a kind service real estate service like Property Leasing Services.Properties invites you to a once in a lifetime opportunity to avail the best property deals. We are a prominent Property Dealer in Kundli Sonipat & Delhi/NCR, offering a comprehensive range of real estate services to the prospective clients. We are widely acknowledged for our services regarding Buy / Sell Residential House &
        </p>
        <p align="justify" class="style33 contact-address"><b>PROPERTY GUDE GROUP</b> We are glad to introduce you to our company propety guide Group, we believe in environment friendly healthy habitat development.developer organization.</p>
         <p align="justify" class="style33 contact-address"><b>OUR CLIENTS</b> We are dedicated to deliver High Quality services to our clients. In construction Indusrty we provide highly technical construction solutions to our clients.We are symbol of trust in consultancy. </p>
          <p align="justify" class="style33 contact-address"><b>WHAT'S NEW</b> For Envesters:- All investors are invited to join SKG so that they can reach to a large number of clients.
For Clients:Just knock the door of SKG to take all property related solutions at one place. </p>

          </td>
        </tr>
    </table>

      </td>



    <td width="18">&nbsp;</td>
    <td width="215" align="center" valign="top">
</td>
  </tr>
</table>
<!-- ------------------------------------ About Us End --------------------------- -->


<%@include file="footer.jsp" %>
</body>
</html>
