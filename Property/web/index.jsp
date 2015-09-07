<%-- 
    Document   : Registration
    Created on : 08-Apr-2015, 14:22:18
    Author     : MISHRA
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="propertydto.Propertydto"%>
<%@page import="userdao.Userdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Advanced Property Guide</title>

<style type="text/css">

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
        filter:alpha(opacity '50');
        display:none;
    }

</style>
<script type="text/javascript" src="js/jquery-1.8.3.min.js" language="javascript"></script>
<script type="text/javascript" src="js/ajex.js" language="javascript"></script>
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
<link rel="stylesheet" type="text/css" href="css/ajex.css"/>
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
    function qva()
    {
        
        var fname=document.qform.username.value;
        var email=document.qform.Email.value;
        var mobile=document.qform.mobile.value;
        var msg=document.qform.inqu.value;
        if(fname == "" || fname.length<2 || !isNaN(fname))
        {
            document.getElementById("error").innerHTML="Please Enter Corret Name";
            document.qform.username.focus();
            return false;
        }
        var atpos=email.indexOf("@");
        var dotpos=emai.lastIndexOf(".");
        if(email == "" || atpos<2 || dotpos-atpos<4 || dotpos+2 >= email.length)
        {
            document.getElementById("error").innerHTML="Please Enter Corret Email";
            document.qform.Email.focus();
            return false;
        }
        if(mobile == "" || mobile.length != 10 || isNaN(mobile))
        {
            document.getElementById("error").innerHTML="Please Enter Corret Phone Number";
            document.qform.mobile.focus();
            return false;
        }
        if(msg == "")
        {
            document.getElementById("error").innerHTML="Please Enter Your Query";
            document.qform.inqu.focus();
            return false;
        }
    }
</script>
<script type="text/javascript" language="javascript">
    var xmlhttp;
    var sm;

    function showsub(val)
    {

        // xmlhttp=GetXmlHttpObject();
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();
        }
        if (window.ActiveXObject)
        {
            xmlhttp =new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlhttp==null)
        {
            alert ("Your browser does not support Ajax HTTP");
            return;
        }

        var url="Ajexpage.jsp";
        url=url+"?q="+val;

        // xmlhttp.onreadystatechange=getOutput
        xmlhttp.onreadystatechange = function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status ==200)
            {
                document.getElementById("sub").innerHTML=xmlhttp.responseText;

            }
        }
        xmlhttp.open("GET",url,true);
        xmlhttp.send();
    }

</script>
<script type="text/javascript" language="javascript">
    var xmlhttp;
    var sm;

    function showsub1(val)
    {
        alert(val);
        // xmlhttp=GetXmlHttpObject();
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();
        }
        if (window.ActiveXObject)
        {
            xmlhttp =new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlhttp==null)
        {
            alert ("Your browser does not support Ajax HTTP");
            return;
        }

        var url="Ajexpage1.jsp";
        url=url+"?q1="+val;
        alert(url);
        // xmlhttp.onreadystatechange=getOutput
        xmlhttp.onreadystatechange = function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status ==200)
            {
                document.getElementById("sub1").innerHTML=xmlhttp.responseText;

            }
        }
        xmlhttp.open("GET",url,true);
        xmlhttp.send();
    }

</script>
<script type="text/javascript" language="javascript">
    var xmlhttp;
    var sm;

    function showsub2(val)
    {
        alert(val);
        // xmlhttp=GetXmlHttpObject();
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();
        }
        if (window.ActiveXObject)
        {
            xmlhttp =new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlhttp==null)
        {
            alert ("Your browser does not support Ajax HTTP");
            return;
        }

        var url="ajexpage2.jsp";
        url=url+"?q2="+val;
        alert(url);
        // xmlhttp.onreadystatechange=getOutput
        xmlhttp.onreadystatechange = function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status ==200)
            {
                document.getElementById("sub2").innerHTML=xmlhttp.responseText;

            }
        }
        xmlhttp.open("GET",url,true);
        xmlhttp.send();
    }

</script>
<script type="text/javascript" language="javascript">
    var xmlhttp;
    var sm;

    function showsub3(val)
    {
        alert(val);
        // xmlhttp=GetXmlHttpObject();
        if (window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();
        }
        if (window.ActiveXObject)
        {
            xmlhttp =new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlhttp==null)
        {
            alert ("Your browser does not support Ajax HTTP");
            return;
        }

        var url="ajexpage3.jsp";
        url=url+"?q3="+val;
        alert(url);
        // xmlhttp.onreadystatechange=getOutput
        xmlhttp.onreadystatechange = function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status ==200)
            {
                document.getElementById("sub3").innerHTML=xmlhttp.responseText;

            }
        }
        xmlhttp.open("GET",url,true);
        xmlhttp.send();
    }

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

    <table align="left" id="dd1" style="background:url(img/aa.png) no-repeat;background-position:left;" width="300" height="320">
        <tr>
            <td width="270" align="left"><div align="right"><img src="img/feedback-widget-close.png" id="feedclose1" align="top" style="margin-top:-20px;margin-right:-10px"/></div>
                <div class="requestForm" align="left">
                    <br /><br />
                    <h1 style="margin-left:50px;color:#AC040D">
                        Member Login</h1>
                    <form id="form" method="post" style="margin-top:20px" action="Userlogin">
                        <%
                                    String error1 = (String) session.getAttribute("error");
                                    //out.println(error1);
                                    if (error1 == "" || error1 == null) {
                                    }
                                    if (error1 != "" && error1 != null) {
                                        out.println(error1);

                                    }
                                    session.removeAttribute("error");
                        %>
                        
                        <label for="visitorname" style="margin-left:0px">Email Id</label>
                        <input type="email" required="" name="email" id="email" style="width:140px;outline:none" placeholder="Enter Email"/>
                        <label for="visitorph" style="margin-left:0px">Password</label>
                        <input type="password" required="" name="password" id="password" style="width:140px;outline:none"  placeholder="Enter Password" />

                        <input type="submit" value="" class="send" name="submit" style="margin-top:20px;margin-right:20px" />

                    </form>
                        
                    <center>
                        <br><br><br>
                        <a href="Forgotpassword.jsp" style="color:#990000;text-decoration:none;margin-left:30px;padding-top:20px">Forgot Password</a><br />
                        <br><a href="Registration.jsp" style="color:#990000;text-decoration:none;margin-left:30px;padding-top:20px">New Registration</a>

                    </center>

                </div>

                <br />

            </td>
            <td width="10" id="fd1" valign="middle"><img src="img/22.png" style="position:absolute;z-index:5000;margin-top:-65px;margin-left:-4px"></td>
        </tr>
    </table>


    <form method="post" action="Enquiry" id="dd" style=" background:url(img/btm.png); background-size:500px 400px; float:none;position:fixed; margin-top:0px;" name="qform">
        <table align="center" border="0px">
            <tr height="380px">
                <td width="250px" valign="top" align="justify" style="padding-left:50px">
                    <img src="img/close.png" id="back" style="margin-left:330px;right:0%" />
                    <label>Name</label>
                    <input type="text" required="" placeholder="Enter Your Name" name="name"/>
                    <label>E-mail</label>
                    <input type="email" required="" placeholder="Enter Your Email" name="mail" />
                    <label>Contact No</label>
                    <input type="text" required="" name="contact" placeholder="+91-0123456789" />
                    <label>Inquiry</label>
                    <textarea placeholder="Inquiry" required="" name="inqu"></textarea><br /><br />
                    <input type="submit" value="Send" style="background:#fFF; margin-bottom:6px; color:#000; padding:6px; border:none
                           ; border-radius:4px;" onclick="return qva()"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset" style="background:#FFF; margin-bottom:6px; color:#000; padding:6px; border:none
                           ; border-radius:4px;" />
                </td>
            </tr>
            <tr><td align="center"><label id="error" style="color:#FF0000"></label></td></tr>
        </table>
    </form>

    <div id="mask"></div>

    <!-- Header Start -->
    



        <!------------ Flash Area ------------>
        <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0"  >
            <tr valign="top">
                <td width="705" height="330" align="center" valign="top">
                    <div id="flash">
                        <!--    <img src="img/1.jpg" width="725px" height="340px" /> -->
                        <img src="img/2.jpg" width="725px" height="340px" />
                        <img src="img/3.jpg" width="725px" height="340px" />
                        <img src="img/4.jpg" width="725px" height="340px" />
                        <img src="img/5.jpg" width="725px" height="340px" />
                        <img src="img/8.jpg" width="725px" height="340px" />
                        <img src="img/bg.jpg" width="725px" height="340px" />

                    </div>
                </td>
                <td width="275" align="center">

                    <!-- Search property -->
                    <%
                                    Userdao ud=new Userdao();
                                    Propertydto pdto= new Propertydto();
                                    ArrayList<Propertydto> al=ud.getproperty();
                                    Iterator<Propertydto> it=al.iterator();

                    %>
                    <form name="search" action="Searchproperty.jsp" method="post">
                        <table width="248" border="0" cellspacing="0" cellpadding="0" background="img/search.png" style="background-position:top; background-repeat:no-repeat;" >
                            <tr>


                                <td height="48" colspan="3" align="center"><span class="style59">Search Properties</span></td>
                            </tr>
<!--                            <tr>
                                <td height="10" colspan="2" align="center" valign="top" style="background-position:left; background-repeat:no-repeat;">
                                    <select name="type" style="width:200px;padding:0px;outline:none;border-radius:8px;margin-left:1px" onChange="showsub(this.value)" id="main">
                                        <option value="0">Select Type</option>
                                        <option value="Infrastructure">Infrastructure</option>
                                        <option value="Traders">Traders</option>
                                        <option value="Builder">Builder</option>
                                        <option value="Real Estate">Real Estate</option>
                                    </select>
                                </td>
                            </tr>-->
                             <tr align="left">
                                        
                                 <td >&nbsp;&nbsp;<input type="text" value="" readonly="" style="border: none;background: transparent; " />
                                    
                            </tr>
                            <tr align="left">
                                        
                                 <td >&nbsp;&nbsp;<input type="text" value="Select Type : " style="border: none;background: transparent; " />
                                    
                            </tr>
                            
                            <tr align="left">
                                        
                                <td >&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Sell" name="property" required="" />&nbsp;&nbsp;&nbsp;<font size="3">Sale</font>
                                    
                            </tr>
                            <tr align="left">
                                        
                                <td >&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Buy" name="property" required="" />&nbsp;&nbsp;&nbsp;<font size="3">Buy</font>
                                    
                            </tr>
                            <tr align="left">
                                        
                                <td >&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Rent" name="property" required="" />&nbsp;&nbsp;&nbsp;<font size="3">Rent</font>
                                </td>
                            </tr>
                            <tr><td height="10px"></td>
                            </tr>
                            <tr></tr>
                           
<!--                            <tr>
                                <td height="20" colspan="2" align="center" valign="top" style="background-position:left; background-repeat:no-repeat;">
                                    <select name="state" style="width:210px;padding:0px;outline:none;border-radius:8px;margin-left:1px" id="sub" onChange="showsub1(this.value)">
                                        <option value="select">Select State</option>
                                        <option value="">Select State</option>
                                    </select>
                                </td>
                            </tr>-->
                            <tr>
                                <td height="20" colspan="2" align="center" valign="top" style="background-position:left; background-repeat:no-repeat;">
                                    <select name="city" style="width:210px;padding:0px;outline:none;border-radius:8px;margin-left:1px" id="sub1" >
                                        <option value="0" selected="">Select City</option>
                                        <%while(it.hasNext())
                                    {
                                        pdto=it.next();%>
                                        <option value="<%=pdto.getCity()%>"><%=pdto.getCity()%></option>
                                         <%}%>
                                    </select>

                                </td>
                            </tr>
                            
                            
<!--                            <tr>
                                <td height="20" colspan="2" align="center" valign="top" style="background-position:left; background-repeat:no-repeat;">
                                    <select name="location" style="width:210px;padding:0px;outline:none;border-radius:8px;margin-left:1px" id="sub2" onChange="showsub3(this.value)">
                                        <option value="0">Select Location</option>
                                        
                                    </select>

                                </td>
                            </tr>-->
<!--                            <tr>
                                <td height="20" colspan="2" align="center" valign="top" style="background-position:left; background-repeat:no-repeat;">
                                    <select name="rate" style="width:210px;padding:0px;outline:none;border-radius:8px;margin-left:1px" id="sub3">
                                        <option value="0">Select Range</option>

                                    </select>

                                </td>
                            </tr>-->
                            <tr valign="top">
                                <td height="55" colspan="2" align="center">
                                    <input type="submit">
                            </tr>
                        <tr align="left">
                                        
                                <td >&nbsp;&nbsp;<input type="text" value="" readonly="" style="border: none;background: transparent; " />
                                    
                            </tr>
                        </table></form> 
        </table>

        
        <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center" valign="top"><img src="img/shadow.png" width="1001" height="37" /></td>
    </tr>
</table>








<!------------ Flash Area End ------------>



<!------------ Middle Content Area ------------>
<table width="1020" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="767" height="479" align="center" valign="top">
            <table width="748" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="10" colspan="2" align="left" valign="top" style="background:url(img/line_do.png) no-repeat bottom"><span class="style26"><h2>Our Prides:</h2></span></td>
                </tr>
                <tr>
                    <td width="220" align="center" valign="top">
                        <div style="background: url(img/image-frame-sprite-2.png) 0px 0px no-repeat;background-position: -224px -465px;width: 220px;height: 144px;padding-top:5px" align="center">
                            <img src="img/6.jpg" width="205px" height="120px"/>
                        </div>
                        <div style="background: url(img/image-frame-sprite-2.png) 0px 0px no-repeat;background-position: -224px -465px;width: 220px;height: 144px;padding-top:5px" align="center">
                            <img src="img/3.jpg" width="205px" height="120px"/>
                        </div>
                    </td>
                    <td width="504" align="left" valign="top">
                        <span class="style26"><h2>Location guide : VISION</h2></span>
                        <p align="justify" style="color:#000000">
                            Our primary goal is to satisfy our customers desire, to invest and acquire their dream homes. We partner with the best property developers so that we can provide our customers the best value and deal for their investments, Safal Madhya always lives up to your expectations and “Delivers Your Choice”.
                        </p>
                        <ul style="color:#000000;background:none;list-style:square">
                            <li>Location guide is a Best Builder In Bhopal(M.P.).</li>
                            <li>Location guide is Developer and Contractor Firm.</li>
                            <li>Location guide is Property Investment Consultancy</li>
                            <li>Location guide is a Real-Estate Services Firm</li>
                            <li>Location guide is a Construction Material Supplier Firm</li>
                            <li>Steel Fabrication Factory is Our Sister Concern.</li>
                        </ul>
                </tr>
                <tr>
                    <td width="244" height="203" align="center" valign="top">
                        <div style="background: url(img/image-frame-sprite-2.png) 0px 0px no-repeat;background-position: -224px -465px;width: 220px;height: 144px;padding-top:5px" align="center">
                            <img src="img/5.jpg" width="205px" height="120px"/>
                        </div>


                    </td>
                    <td width="504" align="left" valign="top">

                        <span class="style26"><h2>SK Marketing Solutions : MISSION</h2></span> <p align="justify" style="color:#000000">To engage the business of Real Estate Development which includes development of land, construction, marketing and intensions of serving the society and community with complete dedication, commitment and cogitate on purpose while maintaining the highest standard of excellence. We are here for the long haul and build fruitful and lasting relationships with our valued customers.</p>
                        <p align="right"><a href="sk_marketing.html">View More</a></p>
                    </td>
                </tr>
            </table>
            <table width="774" border="0" cellpadding="0" cellspacing="0" background="img/feature.png" style="background-position:top; background-repeat:no-repeat;" height="253px">
                <tr>
                    <td height="49" colspan="6" align="center"><span class="style2">Featured Project</span></td>
                </tr>
                <tr>
                    <td width="15" rowspan="2">&nbsp;</td>
                    <td colspan="4" align="center">

                        <table align="center" width="100%"><tr>
                                <td>
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tbody><tr>

                                                <td width="40" align="left"><img src="img/client_left.png" width="38" height="46" id="prev" style="display: inline;"></td>
                                                <td>

                                                    <div class="list_carousel">
                                                        <div class="caroufredsel_wrapper" style="display: block; text-align: start; float: none; position: relative; top: auto; right: auto; bottom: auto; left: auto;  width: 800px; height: 100px; margin: 0px; overflow: hidden;">

                                                            <ul class="slide100" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; z-index: auto;">

                                                                <li>
                                                                    <span class="style4" style="font-size:10px">GURUKUL(Sandha)</span>
                                                                    <div class="I1" style="position:absolute; z-index:10;"><a class="fancybox" data-fancybox-group="gallery" href="img/img.png">
                                                                            <img src="img/img.png" height="80"  width="100" class="Img1" style="position:relative; z-index:5000000;" title="" alt=""/></a>


                                                                    </div>

                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">Geeta Dham Phase-2</span>
                                                                    <div id="I1"><a class="fancybox" data-fancybox-group="gallery" href="img/img_2.png">
                                                                            <img src="img/img_2.png" height="80" id="Img1" width="100" title="" alt="" /></a>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">GURUKUL Property</span>
                                                                    <div class="I1" style="position:absolute; z-index:10;"><a class="fancybox" data-fancybox-group="gallery" href="img/img.png">
                                                                            <img src="img/img.png" height="80"  width="100" class="Img1" style="position:relative; z-index:5000000;" title="" alt=""/></a>


                                                                    </div>

                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">Geeta Dham Phase-2</span>
                                                                    <div id="I1"><a class="fancybox" data-fancybox-group="gallery" href="img/img_2.png">
                                                                            <img src="img/img_2.png" height="80" id="Img1" width="100" title="" alt="" /></a>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">GURUKUL Property</span>
                                                                    <div class="I1" style="position:absolute; z-index:10;"><a class="fancybox" data-fancybox-group="gallery" href="img/img.png">
                                                                            <img src="img/img.png" height="80"  width="100" class="Img1" style="position:relative; z-index:5000000;" title="" alt=""/></a>


                                                                    </div>

                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">Geeta Dham Phase-2</span>
                                                                    <div id="I1"><a class="fancybox" data-fancybox-group="gallery" href="img/img_2.png">
                                                                            <img src="img/img_2.png" height="80" id="Img1" width="100" title="" alt="" /></a>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">GURUKUL Property</span>
                                                                    <div class="I1" style="position:absolute; z-index:10;"><a class="fancybox" data-fancybox-group="gallery" href="img/img.png">
                                                                            <img src="img/img.png" height="80"  width="100" class="Img1" style="position:relative; z-index:5000000;" title="" alt=""/></a>


                                                                    </div>

                                                                </li>
                                                                <li>
                                                                    <span class="style4" style="font-size:10px">Geeta Dham Phase-2</span>
                                                                    <div id="I1"><a class="fancybox" data-fancybox-group="gallery" href="img/img_2.png">
                                                                            <img src="img/img_2.png" height="80" id="Img1" width="100" title="" alt="" /></a>
                                                                    </div>
                                                                </li>





                                                            </ul></div>


                                                    </div>



                                                </td>
                                                <td width="39" align="right"><img src="img/client_right.png" width="38" height="46" id="next" style="display: inline;"></td>

                                            </tr>
                                        </tbody></table>

                                </td>

                            </tr></table>

                    </td>
                    <td width="15" rowspan="2">&nbsp;</td>

            </table>
            <table width="774" border="0" cellpadding="0" cellspacing="0" background="img/associates.png" style="background-position:top; background-repeat:no-repeat;">
                <tr>
                    <td height="49" align="center"><span class="style2">We are Associated With</span></td>
                </tr>
                <tr>
                    <td width="15" height="150" align="center" class="img">
                        <img src="img/associates_logo.png" width="121" height="126" />
                        <img src="img/a1.png" width="121" height="126" />
                        <img src="img/a2.png" width="121" height="126" />
                        <img src="img/a3.png" width="121" height="126" />
                        <img src="img/a4.png" width="121" height="126" />
                    </td>
                </tr>
            </table></td>
        <td width="18">&nbsp;</td>
        <td width="215" align="center" valign="top">









        </td>
    </tr>
</table>
<!------------ Middle Content Area End ------------>

<div id="commonScroller">
    <div style="background:url(img/scroller-hbg.gif);">
        <p style="float:right; padding:5px;"><a href="" onclick="closebar(); return false;" title=""><img alt="" title="" src="img/scroller-close.gif" /></a></p>
        <p style="padding:3px 5px;"><b>Enquiry Now</b></p>
    </div>
    <p class="l"><img alt="" title="" src="img/e-mail.png" /> <a href="javascript:void(0);" title="" class="enq">Send ENQUIRY</a></p>
</div>

</body>
</html>
<%@include file="footer.jsp" %>