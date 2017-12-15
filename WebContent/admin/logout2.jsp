<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	session.invalidate();

%>

<html>
<head>
	<title>DECONNEXION</title>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	 <link rel="stylesheet" type="text/css" href="css/bootstrap.css"> 
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/authenstyle.css">

   
<!--Script-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!--Fin du script-->
 	 <link rel="shortcut icon" href="favicon.ico">
	<link rel="icon" type="image/gif" href="../images/ifi/animated_favicon1.gif">
</head>


<body  style="background-image: url(images/ifi/background1.png); background-repeat: no-repeat; background-position: right;" >
<p style="margin-top: 60px;"></p>

<div class="container" >

    <div class="row vertical-offset-100">
      <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-default">
          <div class="panel-heading  ">
           <div><img class="img-thumbnail img-circle img-responsive col-md-offset-3"src="images/ifi/logoifilogin.png"  alt="IFI"></div>
           <div style="margin-left:50px; font-size: 14px; color:#212E84;">INOVATION SANS FRONTIERE !
           <br>
           <br>   
           <h3 style="margin-left:20px; color:#EE352A; font-Weight: Bold;"> Merci à Bientôt </h3>
           
           </div>
        </div>
          <div class="panel-body" >
            <form  class="form">
                    <fieldset>
                <div class="form-group">
                  
              </div>
              <div class="form-group">
                
              </div>
  
              <input class="btn btn-lg btn-primary btn-block"  value="S'AUTHENTIFIER" id="submitbtn"onclick="rederect();">
            </fieldset>
              </form>
          </div>

      </div>

    </div>
  </div>
</div>
<script src='jquery/jquery-2.1.4.min.js'></script>
	<script src="js/logout.js"></script>
</body>
</html>