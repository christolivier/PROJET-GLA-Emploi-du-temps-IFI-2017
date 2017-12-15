
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EMPLOI DU TEMPS IFI</title>
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
	<link rel="icon" type="image/gif" href="images/ifi/animated_favicon1.gif">
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>IFI</b></span>
			<img class="logo-lg"src="images/ifi/logoifi.png">
        </a>

         <!-- affichage du header ifi -->
        <img class="img-responsive" style="float:right;" src="images/ifi/headerifi2.png">
        <!-- Header Navbar: style can be found in header.less -->
       
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">mobile</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a> 
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="images/ifi/vide.png" class="img-circle" alt="User Image">
            </div>
            <!--<div class="pull-left info">
              <p>Christ Olivier</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>-->
          </div>
          <!-- search form -->
          
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MENU</li>
            
            <li class="treeview">
              <a href="accueil.jsp">
                <i class="fa fa-home"></i>
                <span>HOME</span>
                <span class="label label-primary pull-right"></span>
              </a>
            </li>
             <li class="treeview">
              <a href="searchProf.jsp">
                <i class="fa fa-graduation-cap"></i>
                <span>PROMOTION</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-battery-empty"></i> Promo 23</a></li>
                <li><a href="#"><i class="fa fa-battery-2 (alias)"></i> Promo 22</a></li>
                <li><a href="#"><i class="fa fa-battery-full"></i> Promo 21</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="gestionEV.jsp">
                <i class="fa fa-calendar-check-o"></i>
                <span>My AGENDA</span>
              </a>
            </li>
            <li class="treeview">
              <a href="gestionProf.jsp">
                <i class="fa fa-male"></i>
                <span>My TEACHER</span>
              </a>
            </li>
        </section>
        <!-- /.sidebar -->
      </aside>



      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
        <!-- Main content -->
        <section class="content">
          <!-- Small boxes (Stat box) -->
          
          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
              <div class="col-md-10 col-md-offset-1">
              	
              	<div class="panel panel-primary">
					<div class=" panel panel-heading">RECHERCHER UN PROFESSEUR</div>
					<div class="panel panel-body">
						<form action="searchG.do" method="get">
							<label>Entrer le module:</label>
							<input type="text"name="motsearch">
							<button type="submit" class="btn btn-primary"> Chercher</button>
						</form>
						
						<table class="table table-striped">
							<tr>
								<th>ID</th>
								<th>NOM PRENOM</th>
								<th>EMAIL</th>
								<th>COURS</th>
							</tr>
							<c:forEach items="${model.professeur}" var="p">
								<tr>
									<td>${p.id} </td>
									<td>${p.nomprenom} </td>
									<td>${p.email} </td>
									<td>${p.cours} </td>
									<%-- <td><a onclick="return confirm('Etes vous sûre?')" href="Supprime.do?id=${p.id}">Supprimer</a> </td> --%>
									<td><a href="EditG.do?id=${p.id}">Afficher</a> </td>
								</tr>
							</c:forEach>
						</table>
					
					</div>
				</div>
              	
              	
            </div><!-- /.col -->
           
            </div><!-- /.row (main row) --> 
           
                  
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2017 <a href="#">INSTITUT INTERNATIONAL FRANCOPHONE</a>.</strong> All rights reserved. Design by kouadio.p21
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
