
var secs=0;
var timerID = null;
var timerRunning = true;
var delay = 1000;

function InitializeTimer(isSlideShow, setSlideShow)
{
    secs = Number(setSlideShow); // Set the initial delay
    alert('setSlideShow');
    if (isSlideShow == "false")
    {
        alert('StopTheClock');
        StopTheClock();
    }
    else
    {
        alert('StartTheTimer');
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
    secs = 10; 
    if ( $("#tabs").data('selected.tabs') == 1)
        $("#tabs").tabs('select', 0); // switch to first tab
}

function ShowSlideShow()
{
    secs = 1;
}
 
function ResetSlideShow()
{
    secs = 10; // the initial delay
}


// $(document).ready(function(){

//    var isFlashArea = false;

//    $("#mainArea").mousemove( function() 
//        {
//            resetTabs();
//        }
//    );
//    
//    $("#objFlashMovieArea").mouseover( function() 
//        {
//            setActive();
//        }
//    );
//    
//    $("#objFlashMovieArea").mouseout( function() 
//        {
//            setActive();
//        } 
//    );
//    
//    $("#tabsArea").mouseout( function() 
//        {
//            //setActive();
//        }
//    );
//    
//    $("#tabsArea").mouseover( function() 
//        {
//            setInActive();
//            //setInActive();
//        } 
//    );
//    
//    function setActive()
//    {
//        resetTabs();
//        //$("#mainArea").bind("mousemove", {foo: "bar"}, resetTabs() );
//    }
//    
//    function resetTabs(event)
//    {
//        secs = 10; 
//        if ( $("#tabs").data('selected.tabs') == 1)
//            $("#tabs").tabs('select', 0); // switch to first tab
//    }
//    
//    function setInActive()
//    {
//        $("#mainArea").unbind( "mousemove" );
//    }

//    InitializeTimer();

//    
// });