<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio">

    <p class="text-light">
    <h3> Search For a User</h3> </p>
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

    <p><a href="#" data-toggle="modal" data-target="#addUserModal" class="btn btn-primary btn-lg" role="button">Add
        User</a></p>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <div class="content-wrapper">
        <div class="container-fluid">
            <div class="card mb-3">
                <div class="card-header">

                    <#if ownersList??>
                    <div class="col-md-12">
                    <div class="table-responsive" style="background: gainsboro">

                        <table id="mytable" class="table table-striped">
                            <thead style="background-image: linear-gradient(to top,#f1f1f1,#fff);">

                            <th>Name</th>
                            <th>Last Name</th>
                            <th>AFM</th>
                            <th>E-Mail</th>
                            <th>Address</th>
                            <th>Password</th>

                            <th>Edit</th>
                            <th>Add Vehicle</th>
                            <th>Delete</th>

                            </thead>
                            <tbody>
                                <#list ownersList as owner>
                                <tr>
                                <tr>
                                    <td class="name">${owner.name}</td>
                                    <td class="surname">${owner.surname}</td>
                                    <td class="afm">${owner.afm}</td>
                                    <td class="mail">${owner.mail}</td>
                                    <td class="address">${owner.address}</td>
                                    <td class="password">${owner.pass}</td>
                                    <td>
                                        <p data-placement="top" data-toggle="modal" title="Edit">
                                            <button id="edit" class="editb btn btn-primary btn-xs" data-title="Edit"
                                                    data-toggle="modal"
                                                    data-target="#editVehicleModal"><span
                                                    class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </p>
                                    </td>
                                    <td>
                                        <p data-placement="top" data-toggle="tooltip" title="Add">
                                            <button id="edit" class="plub btn btn-warning btn-xs" data-title="Add"
                                                    data-toggle="modal"
                                                    data-target="#add"><span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </p>
                                    </td>
                                    <td>
                                        <p data-placement="top" data-toggle="tooltip" title="Delete">
                                            <button id="edit" class="delb btn btn-danger btn-xs" data-title="Delete"
                                                    data-toggle="modal"
                                                    data-target="#delete"><span
                                                    class="glyphicon glyphicon-trash"></span>
                                            </button>
                                        </p>
                                    </td>

                                </tr>
                                </#list>
                            </tbody>

                        </table>

                    <#else>
                        <h2> No Owners have found!</h2>
                    </#if>
                </div>
                </div>
                </div>
            </div>
        </div>
    </div>


<#-- Add User Modal -->
    <div id="addUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h2 class="text-center">Add User</h2>
                </div>
                <div class="modal-body row">
                    <div class="text-center">
                        <h4 class="text-danger">${errorMsg!""}</h4>
                    </div>
                    <form id="loginForm" name="loginForm" action="owners/add"
                          class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                        <div class="form-group">
                            <!--{% csrf_token %}-->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="text" class="form-control input-lg" id="name" name="name" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control input-lg" id="surname" name="surname"
                                   placeholder="Last Name">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control input-lg" id="mail" name="mail" placeholder="E-Mail">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" id="pass" name="pass"
                                   placeholder="Password">
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control input-lg" id="afm" name="afm" placeholder="AFM">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control input-lg" id="address" name="address"
                                   placeholder="Address">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

<#-- Edit User Modal -->

</div>

<!--scripts loaded here-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>

</@c.page>
