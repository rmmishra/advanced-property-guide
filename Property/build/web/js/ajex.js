// JavaScript Document


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
    url=url+"?q1="+val;

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






