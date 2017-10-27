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
                    <form name="searchForm" action="vehicles/search" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <label> Search For a Vehicle</label>
                        <input required class="form-control" type="text" name="plate" placeholder="Plate"/>
                </div><#--end col-->
                <div class="col-md-2">
                    <label></label>
                    <input class="btn btn-md text-success" id="searchButton" type="submit" value="Search">
                </div>
                </form>
            </div><#--end row -->
        </div>
    </div><#-- end header_table_custom  -->

    <#-- Hidden form to send user to repairs of a particular vehicle -->
    <form style="display:none" class="findRepairs" name="idForm" action="vehicles/findRepairs"
          method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="id" id="id"/>
        <input type="submit" value="Search">
    </form>

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

                        <#if vehiclesList??>
                        <div class="col-md-12">
                            <div class="table-responsive" style="background: gainsboro">

                                <table id="mytable" class="table table-striped">
                                    <thead style="background-image: linear-gradient(to top,#f1f1f1,#fff);">
                                    <th style="display: none;">Id</th>
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
                                            <td class="id goToRepairs" style="display: none;">${vehicle.id}</td>
                                            <td class="plate goToRepairs">${vehicle.plate}</td>
                                            <td class="brand goToRepairs">${vehicle.brand}</td>
                                            <td class="color goToRepairs">${vehicle.color}</td>
                                            <td class="goToRepairs">${vehicle.user.afm}</td>
                                            <td class="goToRepairs">${vehicle.user.surname}</td>
                                            <td>
                                                <p data-placement="top" data-toggle="modal" title="Edit">
                                                    <button id="edit" class="editb btn btn-success btn-xs"
                                                            data-title="Edit"
                                                            data-toggle="modal"
                                                            data-target="#editVehicleModal"><span
                                                            class="glyphicon glyphicon-pencil"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Add">
                                                    <button id="edit" class="plub btn btn-warning btn-xs"
                                                            data-title="Add"
                                                            data-toggle="modal"
                                                            data-target="#addRepairModal"><span
                                                            class="glyphicon glyphicon-plus"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Delete">
                                                    <button id="edit" class="delb btn btn-danger btn-xs"
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
                            <h2> No Vehicles have found!</h2>
                        </#if>
                    </div>
                    </div>
                </div>
            </div>
        </div>

    </#if>

</div>

<#-- Add Repair Modal -->


<div id="addRepairModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">Add Repair</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="addRepairForm" name="addRepairForm" action="/admin/repairs/add"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" id="id" name="id"/>

                        <input type="text" class="form-control input-lg" id="dateTime" name="dateTime"
                               placeholder="Datetime"/>


                    </div>
                    <div class="form-group">
                        <select name="status" id="status" required class="form-control input-lg">
                            <option value="" disabled selected hidden>Status</option>
                            <option value="pending">Pending</option>
                            <option value="onTheWay">On the way</option>
                            <option value="completed">Completed</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="price" name="price"
                               placeholder="Price">
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
                    </div>
                </form>

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
                <form id="editVehicleForm" name="editVehicleForm" action="vehicles/edit"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <!--{% csrf_token %}-->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" id="id" name="id"/>
                        <input type="text" pattern="^[A-Z]{3}[-][0-9]{3}$" class="form-control input-lg" id="plate"
                               name="plate"
                               placeholder="Plate" data-error="Insert a valid plate" required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="brand" name="brand"
                               placeholder="Brand" data-error="Insert a brand" required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="color" name="color"
                               placeholder="Color" data-error="Insert a color" required>
                        <div class="help-block with-errors"></div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

    <#include "/admin/delete_modal.ftl">

<!--scripts loaded here-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>
<script src="<@spring.url '/js/editveh.js'/>"></script>

<script src="<@spring.url '/js/deleteVehicle.js'/>"></script>
<script src="<@spring.url '/js/goToRepairs.js'/>"></script>
<script src="<@spring.url '/js/addrep.js'/>"></script>

<link href="<@spring.url '/js/date/bootstrap-datepicker.css'/>" rel="stylesheet">
<script src="<@spring.url '/js/date/moment.min.js'/>"></script>
<script src="<@spring.url '/js/date/bootstrap-datetimepicker.js'/>"></script>

<script type="text/javascript">
    $(function () {
        $('#dateTime').datetimepicker();
    });
</script>

</@c.page>