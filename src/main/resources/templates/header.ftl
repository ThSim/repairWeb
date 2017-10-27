<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header.html</title>
    <!--<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="assets/css/styles.css">


	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.css" />

    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" rel="stylesheet" />
	
</head>

<body>
    <div class="container">
<nav class="navbar navbar-trans navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-danger" href="#">Dent Repair</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar-collapsible">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="/">Home</a></li>
                <li><a href="/about/">About</a></li>
                <li><a href="/contact/">Contact Us</a></li>
                <li>&nbsp;</li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

       <!-- <#if fullName??>
   <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${fullName}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/profile/"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
<#else> -->
    <li>
    <a href="#" data-toggle="modal" data-target="#myModal">Login <i class="glyphicon glyphicon-log-in"></i></a>
    </li>
<!--</#if>-->
    </ul></div>
    
    </div>
</nav>
    
</div>
<div class="container" style="background-color:red">
    
</div>

<!--Admin's menu-->

<div id="sideout">
 <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div id="side" class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="/profile/adMin/"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="/profile/adMin/show_p"><i class="glyphicon glyphicon-search"></i> Search Owner</a>
                    </li>
                    <li>
                        <a href="/profile/adMin/add_p"><i class="glyphicon glyphicon-plus"> Add Owner</i> </a>
                    </li>
                    <li>
                        <a href="/profile/adMin/add_user"><i class="glyphicon glyphicon-road"></i> Repair's History</a>
                    </li>
<li>
                        <a href="/profile/adMin/add_client"><i class="glyphicon glyphicon-user"></i> Mpla mpla mpla</a>
                    </li>
                </ul>
            </div>
      </div>

<div class="container">
<div class="plaisio">

<div class="center-block" id="page-wrapper">

	<div >
                    <h1>Welcome back, ${fullName}</h1>
                    <p><h3>This is the Admin's page, Be carefull!</h3></p>
                    <p><a href="#" class="btn btn-primary btn-lg" role="button">Pointless Button &raquo;</a>
                    </p>
                </div>

</div>
</div>
</div>

<!--here is the modal-->

<div class="modal-body row">
                <div class="text-center">
                <h4 class="text-danger">${errorMsg!""}</h4>
		</div>
                <form id="loginForm" name="loginForm" action="/" class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0"  method="post">
		
    		<div class="form-group">
		<!--{% csrf_token %}-->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="text" class="form-control input-lg" name="email" placeholder="E-Mail">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" name="pass" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-lg btn-block">Sign In</button>
		</div>
		</form>
            </div>
            <div class="modal-footer">
                <h6 class="text-center"><a href="">Privacy is important to us. Click here to read why.</a></h6>
            </div>
        </div>

<!--end-->
            

    <!--scripts loaded here-->
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    
    <script src="js/scripts.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>