<%@page import="com.devops.reglage.EmploiSetting"%>
<%@page import="com.dhtmlx.planner.controls.DHXLocalization"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dhtmlx.planner.controls.DHXRule"%>
<%@page import="com.dhtmlx.planner.controls.DHXFilter"%>
<%@page import="com.dhtmlx.planner.controls.DHXTimelineView"%>
<%@page import="com.dhtmlx.planner.data.DHXDataLoader.DHXDynLoadingMode"%>
<%@page import="com.dhtmlx.planner.controls.DHXAgendaView"%>
<%@page import="com.dhtmlx.planner.api.DHXEventBox"%>
<%@page import="com.dhtmlx.planner.controls.DHXMiniCalendar"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxMultiselect"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxRadio"%>
<%@page import="com.dhtmlx.planner.controls.DHXMapView"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxRecurringBlock"%>


<%@page import="com.dhtmlx.planner.controls.DHXLightboxCheckbox"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxSelectOption"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxSelect"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxTime"%>

<%@page import="com.dhtmlx.planner.controls.DHXLightboxMiniCalendar"%>
<%@page import="com.dhtmlx.planner.controls.DHXLightboxText"%>
<%@page import="com.dhtmlx.planner.extensions.DHXExtension"%>
<%@page import="javax.servlet.http.HttpSession"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	String check = (String) session.getAttribute("skey");
	String fname = "";
	String promoposition = "";

	if (check != null) {
		fname = (String) session.getAttribute("ssname");
		promoposition = (String) session.getAttribute("ssup");

	} else {
		response.sendRedirect("index.jsp");
	}
%>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ADMIN-IFI</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
  <!--   <link rel="stylesheet" href="/css/bootstrap.min.css"> -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../css/AdminLTE.min.css">
    <link href="css/layout_style.css" rel="stylesheet" type="text/css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <!-- <link rel="stylesheet" href="plugins/morris/morris.css"> -->
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link href="css/layout_style.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="favicon.ico">
	<link rel="icon" type="image/gif" href="../images/ifi/animated_favicon1.gif">
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
      <header class="main-header" >
      <div style=" width: 230px; height: 130px; float: left;background-image: url('images/ifi/logoifi.png');" >
     </div>
     
     <div style=" width: 878px; height: 130px; float: right;background-image: url('images/ifi/headerifi5.png');" >
        
        <!-- <img class=" img-responsive" src="images/ifi/headerifi4.png"> -->
    
     </div>
      </header>
     
      <!-- Content Wrapper. Contains page content -->
      
        <!-- Content Header (Page header) -->
      <section class="content-header" style="background-color:#ffffff ">
          <h1>
            ADMINISTRATION 
            <small>EMPLOI DU TEMPS IFI</small>
          </h1>
           <ol class="breadcrumb" style="list-style-type: none; ">
            <li><a href="logout2.jsp"><i class="fa fa-power-off"></i> Deconnexion</a></li>
            
          </ol>
        </section> 
	
        <!-- Main content -->
       
        
  <div style="
	width:95%; 
	max-width:3000px;
	min-height:100px;
	overflow:auto;
	margin:10 auto auto 200;
	/* clear:both; */
  ">

	<div class="planner" id="planner"><%=getPlanner(request)%></div>
	<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*"%>
	<%!String getPlanner(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		int uid = (Integer) session.getAttribute("ssuid");
		EmploiSetting cs = new EmploiSetting();
		DHXPlanner s;

		s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
		s.setWidth(1050);
		
		s.setInitialDate(2018, 00, 01);
		s.lightbox.clear();

		//change the language

		String LNG = cs.changeLanguage(uid);

		
		//add tooltips for events
		s.extensions.add(DHXExtension.TOOLTIP);

		// add event details field
		DHXLightboxText notes = new DHXLightboxText("text", "COURS:");
		notes.setHeight(40);
		s.lightbox.add(notes);

		//set Mini calendar giving time period in the lightbox
		s.lightbox.add(new DHXLightboxMiniCalendar("name", "PERIODE:"));
		
		//set event colors
		DHXLightboxSelect select = new DHXLightboxSelect("color", "COULEUR:");
		select.addOption(new DHXLightboxSelectOption("", ""));
		select.addOption(new DHXLightboxSelectOption("#FF6699", "ROSE"));
		select.addOption(new DHXLightboxSelectOption("#E6B800", "JAUNE"));
		select.addOption(new DHXLightboxSelectOption("#FF7F00", "ORANGE"));
		select.addOption(new DHXLightboxSelectOption("#FF0000", "ROUGE"));
		select.addOption(new DHXLightboxSelectOption("#76b007", "VERT"));
		select.addOption(new DHXLightboxSelectOption("#1796b0", "BLEU"));
		s.lightbox.add(select);

		
		//Enables autoresizing for the scheduler container

		s.extensions.add(DHXExtension.CONTAINER_AUTORESIZE);

		//Enables the keyboard navigation.

		s.extensions.add(DHXExtension.KEYBOARD_NAVIGATION);

		//export to PDF

		String ch1 = cs.activepdf(uid);
		if (ch1.equals("pdfA")) {

			s.extensions.add(DHXExtension.PDF);
			s.toPDF();
		} else {
			s.extensions.clear();
		}

		String ch2 = cs.activeminc(uid);

		if (ch2.equals("mcA")) {

			s.calendars.attachMiniCalendar();
		} else {
			s.calendars.clear();
		}

		//export to ical 

		String ical = cs.activeIcal(uid);

		if (ical.equals("icA")) {
			s.extensions.add(DHXExtension.ICAL);
			s.toICal("ical.jsp");
		}

		//connect to map

		DHXMapView view = new DHXMapView();
		String map = cs.activeMap(uid);

		if (map.equals("mapA")) {
			s.views.add(view);
		}

		//Agenda

		String agn = cs.activeAgenda(uid);
		if (agn.equals("agA")) {

			s.views.add(new DHXAgendaView());
		}

		//Limiting the number of events per cell in the Month view
		s.config.setMaxMonthEvents(3);
		s.load("events.jsp", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("events.jsp");

		return s.render();

	}%>
		</div>
        </div><!-- /.row (main row) -->      
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2017 <a href="http://www.ifi.edu.vn/">INSTITUT INTERNATIONAL FRANCOPHONE</a>.</strong> All rights reserved. Design by kouadio.p21
      </footer>
     <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/morris/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="js/app.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/demo.js"></script>
    <script src="js/layout.js"></script>
    
  </body>
</html>
