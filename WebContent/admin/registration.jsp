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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <link rel="shortcut icon" href="favicon.ico">
	<link rel="icon" type="image/gif" href="../images/ifi/animated_favicon1.gif">
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header" >
      <div style=" width: 230px; height: 130px; float: left;background-image: url('images/ifi/logoifi.png');" >
        <!-- Logo -->
        <!-- <a href="index2.html" class="logo">
          mini logo for sidebar mini 50x50 pixels
          <span class="logo-mini"><b>I</b>FI</span>
          logo for regular state and mobile devices
          <span><img class=" img-responsive" src="images/ifi/logoifi.png"></span>
        </a> -->
     </div>
     
     <div style=" width: 878px; height: 130px; float: right;background-image: url('images/ifi/headerifi5.png');" >
        
        <!-- <img class=" img-responsive" src="images/ifi/headerifi4.png"> -->
    
     </div>
     
       <!--  <div >
        Header Navbar: style can be found in header.less
     
          Sidebar toggle button
          <span class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </span>
      
            <img class=" img-responsive" src="images/ifi/headerifi2.png">
           </div> -->
      
      </header>
     
      <!-- Left side column. contains the logo and sidebar -->
     <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="images/ifi/vide.png" class="img-circle" >
            </div>
            <div class="pull-left info">
              <p><%=fname%></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
         <ul class="sidebar-menu">
            <li class="header">MENU</li>
            <li class="treeview">
              <a href="home.jsp">
                <i class="fa fa-home"></i>
                <span>HOME</span>
                <i class="label label-primary pull-right"></i>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-graduation-cap"></i>
                <span>GESTION DES PROMOS</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="registration.jsp"><i class="fa fa-user-plus"></i> Ajouter une promo</a></li>
                <li><a href="admin2.jsp"><i class="fa fa-edit"></i> Editer une promo</a></li>
                <li><a href=""><i class="fa fa-trash-o"></i> Suprimer une promo</a></li>
                <li><a href=""><i class="fa fa-search"></i> Rechercher une promo</a></li>
               
              </ul>
            </li>
     
            <li class="treeview">
              <a href="#">
                <i class="fa fa-street-view"></i>
                <span>GESTION DES PROFS</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="AjouProf.jsp"><i class="fa fa-user-plus"></i> Ajouter un prof</a></li>
                <li><a href="EditProf.jsp"><i class="fa fa-edit"></i> Editer un prof</a></li>
                <li><a href="DeleteProf.jsp"><i class="fa fa-trash-o"></i> Suprimer un prof</a></li>
                <li><a href="searchProf.jsp"><i class="fa fa-search"></i> Rechercher un prof</a></li>
               
              </ul>
            </li>
            <li class="treeview">
              <a href="setting.jsp">
                <i class="fa fa-wrench"></i>
                <span>CONFIGURATION</span>
              </a>
            </li>
            <li class="treeview">
              <a href="about.jsp">
                <i class="fa fa-edit">
                </i> <span>A PROPOS</span>
              </a>
            </li>
            <li class="treeview">
              <a href="help.jsp">
                <i class="fa  fa-question-circle"></i>
                 <span>AIDE</span>
              </a>
            </li> 
            <li class="treeview">
              <a href="home.jsp">
                <i class="fa  fa-question-circle"></i>
                 <span>menu 2</span>
              </a>
            </li> 
            </ul>  
        </section>
        <!-- /.sidebar -->
      </aside>
      
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            ADMINISTRATION 
            <small>EMPLOI DU TEMPS IFI</small>
          </h1>
           <ol class="breadcrumb" style="list-style-type: none; ">
            <li><a href="logout2.jsp"><i class="fa fa-power-off"></i> Deconnexion</a></li>
          </ol>
        </section>
	
        <!-- Main content -->
       
      <div class="container">
		<p style="margin-top:50px;"></p>
    <div class="row vertical-offset-100">
      <div class="col-md-6 col-md-offset-2">
        <div class="panel panel-default">
          <div class="panel-heading">
          
           <h2 style="padding-left:60px; color:#EE352A; font-Weight: Bold; text-align: center;">
            		ENREGISTRER UNE PROMOTION	
          </h2>
        </div>
          <div class="panel-body" >
            <form accept-charset="UTF-8" role="form"action="../Addpromo" method="post">
                    <fieldset>
                <div class="form-group">
                  <input class="form-control" placeholder="Nom " name="username" type="text"required="required">
              </div>
              <!-- <div class="form-group">
                <input class="form-control" placeholder="Password" name="password" type="password" value=""required="required">
              </div>
               <input class="form-control" placeholder="Confirm Password" name="cpassword" type="password" value="" required="required">
              <div class="form-group"> -->
                
              </div>


              <input class="btn btn-lg btn-primary btn-block" type="submit" value="SAVE">
            </fieldset>
              </form>
          </div>

      </div>

    </div>
  </div>
</div>

         
           		
			
			
			
						
						
  				
			

         
         
          
            
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
  </body>
</html>
