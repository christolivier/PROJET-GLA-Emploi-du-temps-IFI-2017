<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	String msg = " ";
	String i = " ";
	String x = "wrong";
	String y = "stwrong";

	try {
		i = request.getParameter("id");

		if (i.equals(x)) {
			msg = "your user name or password wrong, please try again";

		} else if (i.equals(y)) {
			msg = "Sorry , your account has been suspended ";
		} else {
			msg = " ";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<html>
<head>
	<title>AUTHENTIFICATION</title>
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
</head>


<body  style="background-image: url(images/ifi/background1.png); background-repeat: no-repeat; background-position: right;" >
<p style="margin-top: 60px;"></p>

<div class="container" >

    <div class="row vertical-offset-100">
      <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-default">
          <div class="panel-heading  ">
           <div><img class="img-thumbnail img-circle img-responsive col-md-offset-3"src="images/ifi/logoifilogin.png"  alt="IFI"></div>
        </div>
          <div class="panel-body" >
           <p style="color:red; text-shadow: 10px; text-align:center;"> login ou password incorrect</p>
          
            <form accept-charset="UTF-8" role="form" action="#" method="post" class="form">
                    <fieldset>
                <div class="form-group">
                  <input class="form-control" placeholder="Promotion" name="promoname" type="text" 
                  					required
									oninvalid="this.setCustomValidity('Enter promotion Name Here')"
									oninput="setCustomValidity('')"/>
              </div>
              <div class="form-group">
                <input class="form-control" placeholder="Password" name="promopass" type="password" 
                					required="required" required
									oninvalid="this.setCustomValidity('Enter Password Here')"
									oninput="setCustomValidity('')" />
              </div>

                 <!--<div class="checkbox">
                  <label>
                    <input name="remember" type="checkbox" value="Remember Me"> Remember Me
                  </label>
                </div>-->
              <input class="btn btn-lg btn-primary btn-block" type="submit" value="LOGIN" id="submitbtn">
            </fieldset>
              </form>
          </div>

      </div>

    </div>
  </div>
</div>
<!-- <script src='jquery/jquery-2.1.4.min.js'></script>
	<script src="js/index.js"></script> -->
</body>
</html>