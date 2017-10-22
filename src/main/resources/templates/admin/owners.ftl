<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio">

<h2> Search For a User</h2>
<form name="searchForm" action="owners/search" method="post">
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
    <p><a href="#" data-toggle="modal" data-target="#addUserModal" class="btn btn-primary btn-lg" role="button">Add User</a>


    <#if ownersList??>
    <h3>Retrieved Users:</h3>
    <table>
        <#list ownersList as owner>
            <tr>
                <td><h4> AFM: ${owner.afm} </h4></td>
                <td><h4> Name: ${owner.name} </h4></td>
                <td><h4> Surname: ${owner.surname} </h4></td>
                <td><h4> E-Mail: ${owner.mail} </h4></td>

            </tr>

        </#list>
    </table>

    <#else>
    <h2> No Users have found!</h2>
    </#if>

</div>

<div id="addUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"  data-dismiss="modal"  aria-hidden="true">×</button>
                <h2 class="text-center">Add User</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="loginForm" name="loginForm" action="owners/add" class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0"  method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="text" class="form-control input-lg" name="name" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" name="surname" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" name="mail" placeholder="E-Mail">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" name="pass" placeholder="Password">
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control input-lg" name="afm" placeholder="AFM">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" name="address" placeholder="Address">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
                    </div>
                </form>

        </div>
    </div>
</div>

    <!--scripts loaded here-->

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <script src="<@spring.url '/js/scripts.js'/>"></script>


</@c.page>
