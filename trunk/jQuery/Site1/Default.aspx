<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sample</title>

        <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-personalized-1.6rc6.min.js"></script>
		<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
		
		<link type="text/css" href="css/ui.core.css" rel="Stylesheet" />	
		<link rel="stylesheet" href="css/themes/ui.theme.css" type="text/css" title="ui-theme" />
		<link rel="stylesheet" href="css/ui.datepicker.css" type="text/css" />
		<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
		
		<!-- from here down, demo-related styles and scripts -->
		<style type="text/css">
			body { font-size: 62.5%; }
			input {width: 196px; height: 1.1em; display:block;}
		</style>
		
		
		<script type="text/javascript">	
			$(function(){
				  $('input').daterangepicker(); 
			 });
		</script>
		
		
</head>
<body>
    <form id="form1" runat="server">
       
		<input type="text" value="Choose a Date" id="rangeA" />	
		
		
    </form>
</body>
</html>
