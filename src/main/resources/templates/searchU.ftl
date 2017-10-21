<#import "/spring.ftl" as spring/>
<html>
<body>


<h2> Search For a User</h2>

<!--to name einai ayto pou exw final ston SearchController-->
<form name="searchForm" action="/search" method="post">

      <div class="hello">
    <label> AFM:</label><input type="text" name="afm" placeholder="search by AFM "/><input type="submit" value="Search">
    <label> Email:</label><input type="text" name="mail" placeholder="search by email"/><input type="submit" value="Search">
    </div>
</form>


<h2>${errorMessage!""}</h2>
<#if owner??>
<form name="editUser" id="editUser"  method="post">
<h3 name="${owner.afm}" >${owner.afm}</h3> <button type="submit" id="btn-edit" class="btn btn-primary">Edit</button>
</form>
<h3>${owner.mail}</h3>
</#if>






</body>

</html>