function validation()
{         
    //first name checking//
    var nm = /^[a-zA-Z]+$/;
    if(!(document.regis.name.value.match(nm)))
    {
        document.getElementById("n2").innerHTML="";
        document.getElementById("n6").innerHTML="";
        document.getElementById("n3").innerHTML="";
        document.getElementById("n4").innerHTML="";
        document.getElementById("n5").innerHTML="";
    document.getElementById("n1").innerHTML="Enter Correct Name (Characters Only)";
    document.regis.name.focus();
    return false;
    }
    //last name checking//
    var lnm = /^[a-zA-Z]+$/;
    if(!(document.regis.lname.value.match(lnm)))
    {
        document.getElementById("n1").innerHTML="";
        document.getElementById("n2").innerHTML="";
        document.getElementById("n3").innerHTML="";
        document.getElementById("n4").innerHTML="";
        document.getElementById("n5").innerHTML="";
    document.getElementById("n6").innerHTML="Enter Correct Name (Characters Only)";
    document.regis.lname.focus();
    return false;
    }
    
    // password checking //
    var cpwd=document.forms["regis"]["cpwd"].value;
    var pwd = document.forms["regis"]["pwd"].value;
    if(pwd !== cpwd)
    {
        document.getElementById("n1").innerHTML="";
        document.getElementById("n3").innerHTML="";
        document.getElementById("n4").innerHTML="";
        document.getElementById("n5").innerHTML="";
        document.getElementById("n6").innerHTML="";
    document.getElementById("n2").innerHTML="Password Not Match";
    document.regis.cpwd.focus();
    return false;
    }
    
	//mobile checking//
    var mn =/^\+?([7-9]{1})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{5})$/;
   
    if(!(document.regis.contact.value.match(mn)))
    {
        document.getElementById("n1").innerHTML="";
        document.getElementById("n2").innerHTML="";
        document.getElementById("n4").innerHTML="";
        document.getElementById("n5").innerHTML="";
        document.getElementById("n6").innerHTML="";
    document.getElementById("n3").innerHTML="Enter Correct mobile no ";
    //alert('Enter Correct Mobile no!');
    document.regis.contact.focus();
    return false;
    }
     
     // State checking //
     var state=document.regis.state.selectedIndex;
     
            if (state===0)
            {
                document.getElementById("n1").innerHTML="";
                document.getElementById("n2").innerHTML="";
                document.getElementById("n3").innerHTML="";
                document.getElementById("n5").innerHTML="";
                document.getElementById("n6").innerHTML="";
                document.getElementById("n4").innerHTML="Please Select State  ";
                document.regis.state.focus();
                return false;
            }
     
     
    //City checking//
    var city = /^[a-zA-Z]+$/;
    if(!(document.regis.city.value.match(city)))
    {
        document.getElementById("n1").innerHTML="";
        document.getElementById("n2").innerHTML="";
        document.getElementById("n3").innerHTML="";
        document.getElementById("n4").innerHTML="";
        document.getElementById("n6").innerHTML="";
    document.getElementById("n5").innerHTML="Enter Correct City Name (Characters Only)";
    document.regis.city.focus();
    return false;
    }
    
    
}