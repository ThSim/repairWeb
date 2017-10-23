<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio">
<div class="boardmsg">
    <h3> Search For a Vehicle</h3>
</div>
    <form name="searchForm" action="vehicles/search" method="post">
        <div class="hello">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="text" name="plate" placeholder="Plate"/>
            <input type="submit" value="Search">
        </div>
    </form>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <div class="content-wrapper">
        <div class="container-fluid">
            <div class="card mb-3">
                <div class="card-header">

                    <#if vehiclesList??>
                    <div class="col-md-12">
                        <div class="table-responsive" style="background: gainsboro">

                            <table id="mytable" class="table table-striped">
                                <thead style="background-image: linear-gradient(to top,#f1f1f1,#fff);">

                                <th>Plate</th>
                                <th>Brand</th>
                                <th>Color</th>
                                <th>Owner' AFM</th>
                                <th>Owner' Last Name</th>

                                <th>Edit</th>
                                <th>Add Repair</th>
                                <th>Delete</th>
                                </thead>
                                <tbody>
                                    <#list vehiclesList as vehicle>
                                    <tr>
                                        <td class="plate">${vehicle.plate}</td>
                                        <td class="brand">${vehicle.brand}</td>
                                        <td class="color">${vehicle.color}</td>
                                        <td>${vehicle.user.afm}</td>
                                        <td>${vehicle.user.surname}</td>
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
                                            <p data-placement="top" data-toggle="tooltip" title="Delete">
                                                <button id="edit" class="plub btn btn-warning btn-xs" data-title="Add"
                                                        data-toggle="modal"
                                                        data-target="#add"><span
                                                        class="glyphicon glyphicon-plus"></span>
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
                        </div>

                    <#else>
                        <h2> No Vehicles have found!</h2>
                    </#if>
                </div>
                </div>
            </div>
        </div>
    </div>



<#-- Edit Vehicle Modal -->
    <div id="editVehicleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h2 class="text-center">Edit Vehicle</h2>
                </div>
                <div class="modal-body row">
                    <div class="text-center">
                        <h4 class="text-danger">${errorMsg!""}</h4>
                    </div>
                    <form id="vehicleForm" name="vehicleForm" action="vehicles/edit"
                          class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                        <div class="form-group">
                            <!--{% csrf_token %}-->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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

</div>
<!--scripts loaded here-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>
<script src="<@spring.url '/js/editveh.js'/>"></script>

</@c.page>