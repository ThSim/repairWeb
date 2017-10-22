<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio">

    <h2> Search For a Vehicle</h2>
    <form name="searchForm" action="vehicles/search" method="post">
        <div class="hello">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="text" name="plate" placeholder="Plate"/>
            <input type="submit" value="Search">
        </div>
    </form>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <div class="container">
        <div class="row">

            <#if vehiclesList??>
            <div class="col-md-12">
                <h4>Bootstrap Snipp for Datatable</h4>
            <div class="table-responsive">

                <table id="mytable" class="table table-bordred table-striped">
                    <thead>

                    <th>Plate</th>
                    <th>Brand</th>
                    <th>Color</th>
                    <th>Owner' AFM</th>
                    <th>Owner' Last Name</th>

                    <th>Edit</th>
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
                                    <button id="edit" class="editb btn-primary btn-xs" data-title="Edit" data-toggle="modal"
                                            data-target="#editVehicleModal"><span class="glyphicon glyphicon-pencil"></span>
                                    </button>
                                </p>
                            </td>
                            <td>
                                <p data-placement="top" data-toggle="tooltip" title="Delete">
                                    <button id="edit" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal"
                                            data-target="#delete"><span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </p>
                            </td>
                        </tr>
                        </#list>
                    </tbody>

                </table>
            <#else>
                <h2> No Vehicles have found!</h2>
            </#if>


<#--

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
                            <td><h4> ${vehicle.plate}</h4></td>
                            <td><h4> ${vehicle.brand}</h4></td>
                            <td><h4> ${vehicle.color}</h4></td>
                            <td><h4> ${vehicle.user.afm}</h4></td>
                            <td><h4> ${vehicle.user.surname}</h4></td>
                        </tr>

                    </#list>
                </table>

            <#else>
                <h2> No Vehicles have found!</h2>
            </#if>
-->


            <div id="editVehicleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"  data-dismiss="modal"  aria-hidden="true">×</button>
                            <h2 class="text-center">Edit Vehicle</h2>
                        </div>
                        <div class="modal-body row">
                            <div class="text-center">
                                <h4 class="text-danger">${errorMsg!""}</h4>
                            </div>
                            <form id="vehicleForm" name="vehicleForm" action="vehicles/edit" class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0"  method="post">

                                <div class="form-group">
                                    <!--{% csrf_token %}-->
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="text" class="form-control input-lg" id = "plate" name="plate" placeholder="Plate">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control input-lg" id = "brand" name="brand" placeholder="Brand">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control input-lg" id = "color" name="color" placeholder="Color">
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>



                <!--scripts loaded here-->

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

            <script src="<@spring.url '/js/scripts.js'/>"></script>
                <script src="<@spring.url '/js/editveh.js'/>"></script>

</@c.page>