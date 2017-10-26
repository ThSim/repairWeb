<#import "/spring.ftl" as spring/>
<html>
<body>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio container-fluid">
 <div class="header_table_custom">
    <div class="boardmsg">
        <h3> Search For a Vehicle</h3>
    </div>
    <form name="searchRepairsForm" action="repairs/search" method="post">
            <div class="row">
            <div class="col-md-3">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input class="form-control" type="text" id="dateStart" name="dateStart" placeholder="Date Start"/>
                 </div><#--end col -->
            <div class="col-md-3">
            <input class="form-control" type="text" id="dateEnd" name="dateEnd" placeholder="Date End"/>
                 </div><#--end col -->
            <div class="col-md-3">
            <input type="submit" value="Search">

            </div><#--end col -->
            </div><#--end row -->

    </form>

</div><#-- end header_table_custom  -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <#if errorMessage?has_content>
        <div class="boardmsg">
            <h2> ${errorMessage}</h2>
        </div>
    <#else>

        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">

                        <#if repairList??>
                        <div class="col-md-12">
                            <div class="table-responsive" style="background: gainsboro">

                                <table id="mytable" class="table table-striped">
                                    <thead style="background-image: linear-gradient(to top,#f1f1f1,#fff);">

                                    <th style="display:none;">Id</th>
                                    <th>Datetime</th>
                                    <th>Status</th>
                                    <th>Price</th>
                                    <th>Vehicle's Plate</th>
                                    <th>Vehicle's Owner</th>

                                    <th>Edit</th>
                                    <th>Add Vehicle</th>
                                    <th>Delete</th>

                                    </thead>
                                    <tbody>
                                        <#list repairList as repair>
                                        <tr>
                                            <td style="display:none;" class="id">${repair.id}</td>
                                            <td class="datetime">${repair.dateTime}</td>
                                            <td class="status">${repair.status}</td>
                                            <td class="price">${repair.price}</td>
                                            <td class="plate">${repair.vehicle.plate}</td>
                                            <td class="surname">${repair.vehicle.user.surname}</td>
                                            <td>
                                                <p data-placement="top" data-toggle="modal" title="Edit">
                                                    <button id="edit" class="editb btn btn-primary btn-xs"
                                                            data-title="Edit"
                                                            data-toggle="modal"
                                                            data-target="#editRepairModal"><span
                                                            class="glyphicon glyphicon-pencil"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Add">
                                                    <button id="edit" class="plub btn btn-warning btn-xs"
                                                            data-title="Add"
                                                            data-toggle="modal"
                                                            data-target="#addParts"><span
                                                            class="glyphicon glyphicon-plus"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Delete">
                                                    <button id="edit" class="delb btn btn-danger btn-xs"
                                                            data-title="Delete"
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
                            <h2> No Repairs have found for the next days</h2>
                        </#if>

                    </div>
                    </div>
                </div>
            </div>
        </div>

    </#if>

</div>
<!--scripts loaded here-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>

<link href="<@spring.url '/js/date/bootstrap-datepicker.css'/>" rel="stylesheet">
<script src="<@spring.url '/js/date/moment.min.js'/>"></script>
<script src="<@spring.url '/js/date/bootstrap-datetimepicker.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
               $('#dateStart').datetimepicker();
               })
</script>

<script type="text/javascript">
$(document).ready(function() {
               $('#dateEnd').datetimepicker();
               })

</script>

</@c.page>