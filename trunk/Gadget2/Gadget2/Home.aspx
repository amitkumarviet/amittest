<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Gadget2_Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Search</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
        
    <link type="text/css" href="../css/Gadget/StyleSheet.css" rel="Stylesheet" />	

    <script type="text/javascript" src="../js/jquery-1.3.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-personalized-1.6rc6.js"></script>
    <link type="text/css" href="../css/ui.all.css" rel="Stylesheet" />	
 
    <script type="text/javascript" src="../js/flashobject.js"></script>
 
    <script language="javascript" type="text/javascript">
        //Global Declarations
        var ie = (document.all) ? true : false;

//        isSlideShow='<%=isSlideShow%>';
//        setSlideShow='<%=setSlideShow%>';
        
//        alert(isSlideShow);
//        alert(setSlideShow);
        
        isSlideShow = true;
        setSlideShow = 10;
 
//         $(document).ready(function() {
//         
         
        $(function() {
		    $("#tabs").tabs();
	    });
	    
		$(function(){
			  //$("#datepicker").datepicker();
			  $('#datepicker').datepicker(
			  	{
			        beforeShowDay: nationalDays,
			        onChangeMonthYear: datepickeronChangeMonthYear,
			        onSelect: datepickeronSelect
			    }
			  );
		 });
		 

		// Highlight certain national days on the calendar
        var natDays = [
            [4, 06, 2009]
        ];

        function nationalDays(date) {
	        for (i = 0; i < natDays.length; i++) {
		        if (date.getMonth() == natDays[i][0] - 1 && date.getDate() == natDays[i][1] && date.getYear() == natDays[i][2]) {
			        ////return [true, 'hasEvents_day'];
			        return [true, ''];
		        }
	        }
	        return [true, ''];
        }
		 
		function datepickeronChangeMonthYear(date) {
            //dt = new date();            
            //alert(dt.getDay()); 
        }
        
        function datepickeronSelect(date) {
            LoadEvent(date); 
        }
        
//		  onChangeMonthYear: function(year, month) 
//		     {         
//		        alert('Moved to month ' + month + '/' + year); }
//		     }
//		     }
		 
//        });


var xmlhttp;

     
function InitialLoadEvent()
{
    //alert(objstartdate);
//    var startdate=objstartdate;
//    var enddate=objenddate;
    var venue=0;
    var category=0;
    //alert(startdate);
    
    var url = "Events.aspx?CategoryId=" + category + "&VenueId=" + venue  ;
    loadXMLDoc(url);
    return false;
}
          
function LoadEvent(objstartdate)
{
    //alert(objstartdate);
    var startdate=objstartdate;
    var enddate=objstartdate;
    var venue=0;
    var category=0;
    
    var url = "Events.aspx?StartDate=" + startdate + "&EndDate=" + enddate + "&CategoryId=" + category + "&VenueId=" + venue  ;
    loadXMLDoc(url);
    return false;
}

function loadXMLDoc(url)
{
    xmlhttp=null;
    if (window.XMLHttpRequest)
    {
        // all modern browsers
        xmlhttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        // for IE5, IE6
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlhttp!=null)
    {
        xmlhttp.onreadystatechange=state_Change;
        xmlhttp.open("GET",url,true);
        xmlhttp.send(null);
    }
    else
    {
        alert("Your browser does not support XMLHTTP.");
    }
}

function state_Change()
{
    if (xmlhttp.readyState==4)
    {
        // 4 = "loaded"
        if (xmlhttp.status==200)
        {
            // 200 = "OK"    
            //alert(xmlhttp.responseText);
            //$("#events").html(xmlhttp.responseText);
             document.getElementById('events').innerHTML = xmlhttp.responseText;
        }
        else
        {
            alert("Problem retrieving data:" + xmlhttp.statusText);
        }
    }
}

</script>
<script type="text/javascript" >
            function loadObjects()
            {
                var dimensions = {width: 0, height: 0};
                if (document.documentElement) 
                {
                    dimensions.width = document.documentElement.offsetWidth;
                    dimensions.height = document.documentElement.offsetHeight;
                }
                else if (window.innerWidth && window.innerHeight) 
                {
                    dimensions.width = window.innerWidth;
                    dimensions.height = window.innerHeight;
                }

                fWidth = 250;
                fHeight = 140;
                Ratio = 1;

                Ratio =  dimensions.width / 270;

                //alert(dimensions.width + ' ' + dimensions.height);

                fWidth = 250 * Ratio;
                fHeight = 140 * Ratio;

                fWidth = Math.round(fWidth);
                fHeight = Math.round(fHeight);

//                if (fWidth > 250)
//                {
//                    fWidth = 250;
//                    fHeight = 140;
//                }

                if (fWidth < 50)
                {
                    fWidth = 50;
                    fHeight = 28;
                }


                //alert(fWidth + ' ' +fHeight);

                var flashHtml = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' ";
                flashHtml += "codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' ";
                flashHtml += "width='" + String(fWidth) + "' height= '" + String(fHeight) + "'  id='main' > \n";
                flashHtml += "<param name='movie' value='http://lincoln.cccom.com/watauga/htdocs/portals/0/swf/watauga_ssp_big.swf' /> \n";
                flashHtml += "<param name='quality' value='high' /> \n";
                flashHtml += "<param name='allowFullScreen' value='true' /> \n";
                flashHtml += "<param name='scale' value='scale' /> \n";
                flashHtml += "<param name='allowScriptAccess' value='always' /> \n";
                flashHtml += "<embed src='http://lincoln.cccom.com/watauga/htdocs/portals/0/swf/watauga_ssp_big.swf' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='" + String(fWidth) + "' height= '" + String(fHeight) + "' allowScriptAccess='always' ></embed>";
                flashHtml += "</object>";

                document.getElementById("divFlash").innerHTML = flashHtml;
                
                LogoWidth = fWidth;
                
//                if (LogoWidth < 180)
//                    LogoWidth=180;
                
                $("#imgLogo").attr("width", String(LogoWidth));
                //document.getElementById("imgLogo").setAttribute("width", string(fWidth));
           }     

//document.write(wi+'x'+window.screenX);

//                var fo = new FlashObject("http://lincoln.cccom.com/watauga/htdocs/portals/0/swf/watauga.swf", "animationName", fWidth, fHeight, "10", "#FFFFFF");
//                fo.addParam("allowScriptAccess", "sameDomain");
//                fo.addParam("quality", "high");
//                fo.addParam("scale", "scale");
//                fo.addParam("loop", "true");
//                fo.addParam("WMode", "transparent");
//                fo.addParam("BGColor", "#FF0000");
//                fo.addParam("allowScriptAccess", "always");
//                fo.addVariable ("xmlfile", "http://wtdadirector.cccom.com/images.php?album=4");

//                fo.write("flashcontent");
         
</script>
</head>
<body onresize="loadObjects();" onload="loadObjects()">
    <form id="form1" runat="server">
        <table id="mainArea" width="100%" style="height:100%" cellpadding="0" cellspacing="0" border="0" >
            <tr><td align="left"><a href="http://exploreboonearea.com" target="_blank" style="border:0px" ><img id="imgLogo" src="../images/BOO-1001-Logo4c.jpg" alt="ExploreBooneArea.com" style="border:0px;" /></a></td></tr>
            <tr>
                <td align="center" valign="top" style="height:220px" id="tabsArea">
                    <div id="tabs" >
	                    <ul >
		                    <li><a href="#tabs-1" onclick="ResetSlideShow();"><font size="1px">Calender</font></a></li>
		                    <li><a href="#tabs-2" onclick="ShowSlideShow();"><font size="1px">Slide-Show</font></a></li>
	                    </ul>
	                    <div id="tabs-1" >
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" valign="middle" style="height:180px" onmouseover="chkSlideShow();">
                                        
                                        <div class="calDiv" ><div id="datepicker"  /></div>
                                        
                                    </td>
                                </tr>
                            </table>
	                    </div>
	                    <div id="tabs-2">
	                        <table style="height:180px" border="0" cellpadding="0" cellspacing="0">
	                            <tr>
	                                <td align="center" valign="middle">
                                        <table id="objFlashMovieArea" width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="center">
                                                    <%--<iframe id="iFrameHome1" src="http://lincoln.cccom.com/watauga/htdocs/portals/0/swf/flash.html" width="250px" height="140px" frameborder="0" marginheight="0" marginwidth="0"  style="border-collapse:collapse;" scrolling="no" ></iframe>--%>
                                                    <%--<object   classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" align="middle" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="350" height="180">
                                                        <param name="movie" value="http://lincoln.cccom.com/watauga/htdocs/portals/0/swf/watauga_4.swf" />
                                                        <param name="quality" value="high" />
                                                        <param name="allowFullScreen" value="false" />
                                                        
                                                        <embed align="middle" src="http://lincoln.cccom.com/watauga/htdocs/portals/0/swf/watauga_4.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="350" height="180"></embed>
                                                    </object>--%>
                                                    
                                                   <div id="divFlash" name="divFlash" >test</div>
       <!--<div id="flashcontent" style="width: 100%; z-index:0">-->

    <script type="text/javascript" language="javascript">

        loadObjects();

    </script>

                                                </td>
                                            </tr>
                                        </table>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
                    </div>
                </td>
            </tr>
            <tr onmouseover="chkSlideShow();">
                <td align="Left" style="height:300px;" onmouseover="chkSlideShow();">
                    <div id="EventScroll" style="border:1px ; overflow: auto; height: 300px;">
                        <div id="events" style="margin:5px">

                        </div>
                    </div>
                </td>
            </tr>
        </table>
<script language="javascript" type="text/javascript">

    var secs=0;
    var initialsecs=Number(setSlideShow); // Set the initial delay
    var timerID = null;
    var timerRunning = true;
    var delay = 1000;

    function InitializeTimer(isSlideShow, setSlideShow)
    {
        secs = initialsecs;
//        alert('setSlideShow');
        if (isSlideShow == "false")
        {
//            alert('StopTheClock');
            StopTheClock();
        }
        else
        {
//            alert('StartTheTimer');
            StartTheTimer();
        }
    }

    function StopTheClock()
    {
        if (timerRunning)
        {
            clearTimeout(timerID);
            timerRunning = false;
        }
    }

    function StartTheTimer()
    {
        if (secs == 0)
        {
            secs = 1; //-OR- timerRunning=false;
            StartSlideShow(); //call the function when time expires
        }
        //self.status = secs;
        secs = secs - 1;
        if (timerRunning)
        {
            timerID = self.setTimeout("StartTheTimer()", delay);
        }
    }

    function StartSlideShow()
    {
        //alert("asdf");
        
        if ( $("#tabs").data('selected.tabs') == 0)
            $("#tabs").tabs('select', 1); // switch to second tab

    }

    function chkSlideShow()
    {
        secs = initialsecs; 
        if ( $("#tabs").data('selected.tabs') == 1)
            $("#tabs").tabs('select', 0); // switch to first tab
    }

    function ShowSlideShow()
    {
        secs = 1;
    }
     
    function ResetSlideShow()
    {
        secs = initialsecs; // the initial delay
    }


    $(document).ready(function(){
        InitializeTimer(isSlideShow, setSlideShow);
        
        
    });

    InitialLoadEvent();
    
</script>
         
    </form>
</body>
</html>
