<#import "/spring.ftl" as spring/>
<head lang="en">
    <title>Spring Boot Demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<h1>Hello ${username}!!!</h1>
<h1> You are Admin! </h1>
<h2><a href="/logout">Logout</a></h2>


<h2>${errorMessage!""}</h2>


</body>