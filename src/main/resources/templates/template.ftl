<#macro page title>
<html>
<head>

    <title>${title?html}</title>

    <meta charset="utf-8">
    <title>Garage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">


    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="<@spring.url '/css/sb-admin.css'/>" rel="stylesheet">

    <link rel="stylesheet" href="<@spring.url '/css/styles.css'/>" type='text/css'/>

</head>
<body>
<!-- header section -->

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

                <#if fullName??>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                class="fa fa-user"></i> ${fullName}<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${profile}"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <#else>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#myModal">Login <i
                                class="glyphicon glyphicon-log-in"></i></a>
                    </li>
                </#if>
                </ul></div>

        </div>
    </nav>

</div>

    <#nested/>
<!-- footer section -->
<div class="scroll-up">
    <a href="#"><i class="fa fa-angle-up"></i></a>
</div>

</body>
</html>
</#macro>