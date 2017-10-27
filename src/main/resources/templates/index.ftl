<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Garage">
<!-- custom page content -->


<section class="container-fluid" id="section1">

<#--<h1 class="text-center">Garage</h1>
<h2 class="text-center lato animate slideInDown">We Make IT Happen</h2>-->
    <br>
    <p class="text-center">
        <img src="<@spring.url 'imgs/RepairShopLogo.png'/>" width="60%" height="60%">
    </p>


    <a href="#section3">
        <div class="scroll-down bounceInDown animated">
            <span>
                <i class="fa fa-angle-down fa-2x"></i>
            </span>
        </div>
    </a>
</section>

<section class="container-fluid" id="section3">
    <h1 class="text-center">Power to You!</h1>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <h3 class="text-center lato slideInUp animate">Online customer service and... <strong>more</strong></h3>
            <br>
            <div class="row">
                <div class="col-xs-4 col-xs-offset-1">The only thing you have to do is ask for an online FREE account
                    from your nearest TelCom shop...
                </div>
                <div class="col-xs-2"></div>
                <div class="col-xs-4 text-right"></br></br>...or if you are already registered, just...</div>
            </div>
            <br>
            <p class="text-center">
                <br>
                <a href="#" class="btn btn-danger btn-lg btn-huge lato" data-toggle="modal" data-target="#myModal">Log
                    In</a>
            </p>
        </div>
    </div>
</section>


<section class="container-fluid" id="section2">
    <div class="container v-center">
        <div class="row">
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInLeft animate">
                            <div class="panel-heading">
                                <h3>Over 10,000 scolarships to students</h3></div>
                            <div class="panel-body">
                                <p>TelCom supports the students and offers....</p>
                                <hr>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInUp animate">
                            <div class="panel-heading">
                                <h3>Give green a chance</h3></div>
                            <div class="panel-body">
                                <p>Our company for one more year supports Green Peace and its vision</p>
                                <hr>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="panel panel-default slideInRight animate">
                            <div class="panel-heading">
                                <h3>Absorve taxes</h3></div>
                            <div class="panel-body">
                                <p>Telcom absorves the upcoming raise of taxes and keeps its prices intouche</p>
                                <hr>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/row-->
        <div class="row">
            <br>
        </div>
    </div>
    <!--/container-->
</section>


<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">Login</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="loginForm" name="loginForm"  action="/"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="text" class="form-control input-lg" name="email" placeholder="E-Mail" data-error="Insert a valid email"  >
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="password" data-minlength="4"  class="form-control input-lg" name="pass" data-error="Insert a password" placeholder="Password"   >
                          <div class="help-block with-errors"> </div>


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
    </div>
</div>

<!--scripts loaded here-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="js/validator.js"></script>


<script src="<@spring.url '/js/scripts.js'/>"></script>



<script>
        <#if !flag>
        $('#myModal').modal('show');
        </#if>
</script>

</@c.page>