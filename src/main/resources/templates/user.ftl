<#import "/spring.ftl" as spring/>

<head lang="en">
    <title>Spring Boot Demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<h1>Hello ${fullName}!!!</h1>
<h1> You are User! </h1>
<h2><a href="/logout">Logout</a></h2>

<#if repairList??>
<h3>Retrieved Repairs:</h3>
<table>
    <#list repairList as repair>
        <tr>
            <td> Datetime: ${repair.dateTime}  </td>
            <td> Status: ${repair.status}  </td>
            <td> Type: ${repair.price}  </td>
        </tr>

    </#list>
</table>
<#else>
<h2> No repairs found </h2>
</#if>

<#--<h2>${errorMessage!""}</h2>-->

</body>
