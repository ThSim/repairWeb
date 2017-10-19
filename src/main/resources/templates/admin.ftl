<#import "/spring.ftl" as spring/>

<head>

    <meta charset="utf-8">
    <title>Garage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">


    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="<@spring.url 'css/sb-admin.css'/>" rel="stylesheet">


    <link rel="stylesheet" href="<@spring.url 'css/styles.css'/>" type='text/css'/>
</head>
<body>
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

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${fullName}<b
                            class="caret"></b></a>
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

            </ul>
        </div>
    </div>
</nav>

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

<div class="plaisio">

    <div class="center-block" id="page-wrapper">

        <div>
            <h1>Welcome back, ${fullName}</h1>
            <p>
            <h3>This is the Admin's page, Be carefull!</h3></p>
        <#if repairList??>
            <h3>Retrieved Repairs:</h3>
            <table>
                <#list repairList as repair>
                    <tr>
                        <td><h4> Datetime: ${repair.dateTime} </h4></td>
                        <td><h4> Status: ${repair.status} </h4></td>
                        <td><h4> Type: ${repair.price} </h4></td>
                    </tr>

                </#list>
            </table>

        <#else>
            <h2> No repairs found </h2>
        </#if>
            <p><a href="#" class="btn btn-primary btn-lg" role="button">Pointless Button &raquo;</a>
            </p>
        </div>

    </div>
</div>
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-3 column">
                <h4>Information</h4>
                <ul class="nav">
                    <li><a href="about-us.html">Products</a></li>
                    <li><a href="about-us.html">Services</a></li>
                    <li><a href="about-us.html">Benefits</a></li>
                    <li><a href="elements.html">Developers</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Follow Us</h4>
                <ul class="nav">
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Google+</a></li>
                    <li><a href="#">Pinterest</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Contact Us</h4>
                <ul class="nav">
                    <li><a href="#">Email</a></li>
                    <li><a href="#">Headquarters</a></li>
                    <li><a href="#">Management</a></li>
                    <li><a href="#">Support</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-3 column">
                <h4>Customer Service</h4>
                <ul class="nav">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                </ul>
            </div>
        </div>
        <!--/row-->
        <p class="text-right">©2017</p>
    </div>
</footer>

<div class="scroll-up">
    <a href="#"><i class="fa fa-angle-up"></i></a>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>
</body>

