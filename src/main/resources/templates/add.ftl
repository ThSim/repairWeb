<#import "/spring.ftl" as spring/>
<html>
<body>

<h2> Search For Books by title</h2>


<form name="addOwnerForm" action="/add" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <label> Name:</label><input type="text" name="name" placeholder="Name"/>
    <label> Surname:</label><input type="text" name="surname" placeholder="Surname"/>
    <label> Mail:</label><input type="text" name="mail" placeholder="Mail"/>
    <label> Password:</label><input type="password" name="pass" placeholder="Password"/>
    <label> Afm:</label><input type="text" name="afm" placeholder="Afm"/>
    <label> Address:</label><input type="text" name="address" placeholder="Address"/>
    <label> Brand:</label><input type="text" name="brand" placeholder="Brand"/>
    <label> Plate:</label><input type="text" name="plate" placeholder="Plate"/>
    <label> IsAdmin:</label><input type="text" name="isadmin" placeholder="Admin?"/>

    <input type="submit" value="Add">
</form>

<h2>${errorMessage!""}</h2>

</body>
</html>