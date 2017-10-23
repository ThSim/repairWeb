<#import "/spring.ftl" as spring/>

<body>

<h2> Search For Books by title</h2>


<form name="ownerForm" action="/addrepair" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <label> Datetime:</label><input type="text" name="dateTime" placeholder="Datetime"/>
    <label> Status:</label>
    <select name="status">
        <option value="Pending">Pending</option>
        <option value="OnTheWay">OnTheWay</option>
        <option value="Completed">Completed</option>
    </select>
    <label> Price:</label><input type="text" name="price" placeholder="Price"/>
    <input type="submit" value="Add">
</form>

<h2>${errorMessage!""}</h2>

</body>
