<#import "/spring.ftl" as spring/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>X-editable starter template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
       <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.4.6/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet"/>


  </head>

  <body>

  <h2> Search For a User</h2>
  <form name="searchForm" action="owner/search" method="post">
      <div class="hello">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <input type="text" name="search" placeholder="Search"/>
          <label> Search by:</label>
          <select name="whatToSearch">
              <option value="afm">AFM</option>
              <option value="mail">E-Mail</option>
          </select>
          <input type="submit" value="Search">
      </div>
  </form>



      <div class="container">

<#if ownersList??>

        <table class="table table-striped">
        <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Surname</th>
                <th>Password</th>
                <th>afm</th>
                <th>address</th>
              </tr>
            </thead>
             <tbody>
    <#list ownersList as owner>
             <tr>
         <td><a href="#" class="name edsa" data-type="text" data-placement="right" data-title="Name">${owner.name}</a></td>
         <td><a href="#" class="mail edsa" data-type="text" data-placement="right" data-title="Mail">${owner.mail}</a></td>
         <td><a href="#" class="surname edsa" data-type="text" data-placement="right" data-title="Surname">${owner.surname}</a></td>
         <td><a href="#" class="pass edsa" data-type="text" data-placement="right" data-title="Pass">${owner.pass}</a></td>
         <td><a href="#" class="afm edsa" data-type="text" data-placement="right" data-title="Afm">${owner.afm}</a></td>
         <td><a href="#" class="address edsa" data-type="text" data-placement="right" data-title="Address">${owner.address}</a></td>
        <td>
         <a href="#" id="enable" class="enable10">  <span id="edit" class="glyphicon glyphicon-edit" value="edit">edit</span>  </a></td>
<td><a href="#" id="save" class="text-success" style="display:none" > <span  class="glyphicon glyphicon-save" >save</span>  </a></td>
<td><a href="#" id="cancel" class="text-danger" style="display:none" > <span  class="glyphicon glyphicon-remove" >cancel</span>  </a></td>
         </tr>
    <div class="id_user"  style="display:none">${owner.id}</div>
    </div>
    </#list>

        </table>

<#else>
    <h2> No Users have found!</h2>
</#if>
  </body>
   <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
   <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

    <!-- x-editable (bootstrap version) -->

    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.4.6/bootstrap-editable/js/bootstrap-editable.min.js"></script>

    <!-- main.js
   <script src="js/main.js"></script>
   <script src="js/ajax-call.js"></script>-->

  <script src="<@spring.url '/js/edit.js'/>"></script>
  <script src="<@spring.url '/js/scripts.js'/>"></script>



</html>