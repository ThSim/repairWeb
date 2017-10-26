<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Garage">
<!-- custom page content -->


<section class="container-fluid" id="section1">

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
    <h1 class="text-center">Need a Fix?</h1>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <br>
            <div class="row">
                <div class="col-xs-4 col-xs-offset-1">The only thing you have to do is ask for an online FREE account
                    from our shop...
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
                        <input type="text" class="form-control input-lg" name="email" placeholder="E-Mail" data-error="" >
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="password" data-minlength="6"  class="form-control input-lg" name="pass" data-error="unvalid" placeholder="Password" >
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