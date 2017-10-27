<#import "/spring.ftl" as spring/>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">


<div class="plaisio container-fluid">
    <div class="header_table_custom">
        <div class="boardmsg">
            <div class="row">
                <div class="col-md-3">
                    <form name="searchForm" action="owners/search" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <label> Search for an owner </label>
                        <input required class="form-control" type="text" name="search" placeholder="Search"/>
                </div><#--end col-->
                <div class="col-md-3">
                    <label> Search by:</label>
                    <select class="form-control" name="whatToSearch">
                        <option value="afm">AFM</option>
                        <option value="mail">E-Mail</option>
                    </select>
                </div><#-- end col-->
                <div class="col-md-2">
                    <input class="btn btn-md text-success" id="searchButton" type="submit" value="Search">
                </div>
                </form>


                <div class="col-md-3">
                    <form style="display:none" class="findVehicles" name="idForm" action="owners/findVehicles"
                          method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="id" id="id"/>
                        <input type="submit" value="Search">
                    </form>

                    <p><a href="#" id="addUserButton" data-toggle="modal" data-target="#addUserModal"
                          class="btn btn-primary btn-lg" role="button">Add Owner</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <#if errorMessage?has_content>
        <div class="boardmsg" id="boardmsg">
            <h2> ${errorMessage}</h2>
        </div>
    <#else>

        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">

                        <#if ownersList??>
                        <div class="col-md-12">
                            <div class="table-responsive" style="background: gainsboro">

                                <table id="mytable" class="table table-striped">
                                    <thead style="background-image: linear-gradient(to top,#f1f1f1,#fff);">
                                    <th style="display:none;">Id</th>
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
                                            <a href="#">
                                                <td style="display:none;" class="id goToVehicles">${owner.id}</td>
                                                <td class="name goToVehicles">${owner.name}</td>
                                                <td class="surname goToVehicles">${owner.surname}</td>
                                                <td class="afm goToVehicles">${owner.afm}</td>
                                                <td class="mail goToVehicles">${owner.mail}</td>
                                                <td class="address goToVehicles">${owner.address}</td>
                                                <td class="password goToVehicles">${owner.pass}</td>
                                            </a>
                                            <td>
                                                <p data-placement="top" data-toggle="modal" title="Edit">
                                                    <button id="edit" class="editb btn btn-success btn-xs"
                                                            data-title="Edit"
                                                            data-toggle="modal"
                                                            data-target="#editUserModal"><span
                                                            class="glyphicon glyphicon-pencil"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Add">
                                                    <button id="addUser" class="plub btn btn-warning btn-xs"
                                                            data-title="Add"
                                                            data-toggle="modal"
                                                            data-target="#addVehicleModal"><span
                                                            class="glyphicon glyphicon-plus"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Delete">
                                                    <button id="delete" class="delb btn btn-danger btn-xs"
                                                            data-title="Delete"
                                                            data-toggle="modal"
                                                            data-target="#deleteModal"><span
                                                            class="glyphicon glyphicon-trash"></span>
                                                    </button>
                                                </p>
                                            </td>
                                        </tr>
                                        </#list>
                                    </tbody>

                                </table>
                            </div>
                        <#else>
                            <h2> No Owners have found!</h2>
                        </#if>

                    </div>
                    </div>
                </div>
            </div>
        </div>

    </#if>

</div>

<#-- Add Vehicle Modal -->


<div id="addVehicleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">Add Vehicle</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="addVehicleForm" name="addVehicleForm" action="vehicles/add"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" id="id" name="id"/>
                        <input type="text" class="form-control input-lg" id="plate" name="plate"
                               placeholder="Plate">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="brand" name="brand"
                               placeholder="Brand">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="color" name="color"
                               placeholder="Color">
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
                    </div>
                </form>

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
                </form>
                <form id="addUserForm" name="addUserForm" action="owners/add"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="text" class="form-control input-lg" id="name" name="name" placeholder="Name"
                               data-error="Insert a name ..." required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="surname" name="surname"
                               placeholder="Last Name" data-error="Insert a surname ..." required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input type="email" class="form-control input-lg" id="mail" name="mail" placeholder="E-Mail"
                                   data-error="Insert a valid email ...." required>
                        </div> <#--end input group   -->

                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control input-lg" id="pass" name="pass"
                               placeholder="Password" data-error="Insert a Password ..." required>
                        <div class="help-block with-errors"></div>
                    </div>

                    <div class="form-group">
                        <input type="text" pattern="^[0-9]{9}$" class="form-control input-lg" id="afm" name="afm"
                               data-error="Insert a valid afm .... " placeholder="AFM" required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="address" name="address"
                               placeholder="Address" data-error="Insert an address ... " required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<#-- Edit User Modal -->
<div id="editUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">Edit User</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="editUserForm" name="editUserForm" action="owners/edit" data-toggle="validator"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" id="id" name="id"/>
                        <input type="text" class="form-control input-lg" id="name" name="name" placeholder="Name"
                               data-error="Insert a name ..." required>
                        <div class="help-block with-errors"></div>
                    </div>


                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="surname" name="surname"
                               data-error="Insert a Surname ..."
                               placeholder="Last Name" required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="mail" name="mail" placeholder="E-Mail"
                               data-error="Insert a valid email ...." required>
                        <div class="help-block with-errors"></div>
                    </div>

                    <div class="form-group">
                        <input type="text" pattern="^[0-9]{9}$" class="form-control input-lg" id="afm" name="afm"
                               placeholder="AFM" data-error="Insert a valid AFM ...." required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="address" name="address"
                               placeholder="Address" data-error="Insert an address ..." required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-lg btn-block">Update</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
</div>

    <#include "/admin/delete_modal.ftl">

<!--scripts loaded here-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>
<script src="<@spring.url '/js/editown.js'/>"></script>
<script src="<@spring.url '/js/addveh.js'/>"></script>
<script src="<@spring.url '/js/deleteOwner.js'/>"></script>
<script src="<@spring.url '/js/goToVehicles.js'/>"></script>
<script src="<@spring.url '/js/validator.js'/>"></script>
<script src="<@spring.url '/js/validation_custom.js'/>"></script>

</@c.page>
