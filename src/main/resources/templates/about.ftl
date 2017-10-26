<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio container-fluid">

    <section class="container-fluid" id="section17">

        <h2 class="text-center lato animate slideInDown">ReGenaration Coding School 2017 Team 3</h2>
        <h3 class="text-center lato animate slideInDown">We are awesome</h3>
        <h4 class="text-center lato animate slideInDown">

            <br>
            Yiorgos Drakopoulos, Protomastoras
            </br>
            <br>
            Dimitris Vergos, Mhxanikos A'
            </br>
            <br>
            Maria Koutsokerh, Bafes-Episkeves
            </br>
            <br>
            Theodora Simou, Mpouzia-Amortisseur
            </br>


        </h4>


</div>









<!--scripts loaded here-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>




<script src="<@spring.url '/js/scripts.js'/>"></script>




</@c.page>