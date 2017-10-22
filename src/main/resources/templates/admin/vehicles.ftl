<#import "/spring.ftl" as spring/>
<html>
<body>

<h2> Search For a User</h2>
<form name="searchForm" action="vehicles/search" method="post">
    <div class="hello">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="text" name="plate" placeholder="Plate"/>
        <input type="submit" value="Search">
    </div>
</form>

<#if vehiclesList??>
<h3>Retrieved Vehicles:</h3>
<table>
    <tr>
        <td><h4> Plate </h4></td>
        <td><h4> Brand </h4></td>
        <td><h4> Color </h4></td>
        <td><h4> Owner' AFM </h4></td>
        <td><h4> Owner' Last Name </h4></td>
    </tr>
    <#list vehiclesList as vehicle>
        <tr>
            <td><h4> ${vehicle.plate} </h4></td>
            <td><h4> ${vehicle.brand} </h4></td>
            <td><h4> ${vehicle.color} </h4></td>
            <td><h4> ${vehicle.user.afm} </h4></td>
            <td><h4> ${vehicle.user.surname} </h4></td>
        </tr>

    </#list>
</table>

<#else>
<h2> No Vehicles have found!</h2>
</#if>

</body>

</html>