<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

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

<!--scripts loaded here-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>


</@c.page>

