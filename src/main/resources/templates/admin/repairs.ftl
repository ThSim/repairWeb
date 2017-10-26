<#import "/spring.ftl" as spring/>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio container-fluid">
    <div class="header_table_custom">
        <div class="boardmsg">
            <label>Search For a Repair</label>

            <div class="row">
                <div class="col-md-3">
                    <form name="searchRepairsForm" action="repairs/search" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <label> Starting date</label>
                        <input class="form-control" type="text" id="dateStart" name="dateStart"
                               placeholder="Date Start"/>
                </div><#--end col -->
                <div class="col-md-3">
                    <label> Ending date</label>
                    <input class="form-control" type="text" id="dateEnd" name="dateEnd" placeholder="Date End"/>
                </div><#--end col -->
                <div class="col-md-1">
                    <input class="btn btn-md text-success" id="searchButtonRep" type="submit" value="Search">
                </div><#--end col -->
                </form>
            </div><#--end row -->
        </div>
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
                                    <th>Add Parts</th>
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
                                                    <button id="edit" class="editb btn btn-success btn-xs"
                                                            data-title="Edit"
                                                            data-toggle="modal"
                                                            data-target="#editRepairModal"><span
                                                            class="glyphicon glyphicon-pencil"></span>
                                                    </button>
                                                </p>
                                            </td>
                                            <td>
                                                <p data-placement="top" data-toggle="tooltip" title="Add">
                                                    <button id="addPart" class="plub btn btn-warning btn-xs"
                                                            data-title="Add"
                                                            data-toggle="modal"
                                                            data-target="#addParts"><span
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
                            <h2> No Repairs have found for the next days</h2>
                        </#if>

                    </div>
                    </div>
                </div>
            </div>
        </div>

    </#if>

</div>

<#-- Edit Repair Modal -->
<div id="editRepairModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">Edit Repair</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="editRepairForm" name="editRepairForm" action="/admin/repairs/edit"
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


<!-- Add Parts Modal -->
<div id="addParts" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center">Add Parts</h2>
            </div>
            <div class="modal-body row">
                <div class="text-center">
                    <h4 class="text-danger">${errorMsg!""}</h4>
                </div>
                <form id="addPartForm" name="addPartForm" action="repairs/addParts"
                      class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" method="post">

                    <div class="form-group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" id="id" name="id"/>
                        <label for="cb"><input id="cb" type="checkbox" value="takatia" onclick="handleClick(this);">Checkbox</label>
                    </div>
                    <div class="form-group">
                        <label for="cb2"><input id="cb2" type="checkbox" value="check2" onclick="handleClick(this);">Checkbox2</label>
                    </div>
                    <div class="form-group">
                        <label for="cb3"><input id="cb3" type="checkbox" value="check3" onclick="handleClick(this);">Checkbox3</label>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-danger btn-lg btn-block" id="but">Submit</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


<!--Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
            </div>
            <div class="modal-body">

                <p>You are about to delete.</p>
                <p>Do you want to proceed?</p>
            </div>
            <div class="modal-footer ">
                <form class="edit_delete_form" action="/admin/repairs/delete" method="post" style="display:none">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input class="iduser" name="id" value=""/>

                </form>
                <a href="#" id="btnYes" class="btn danger">Yes</a>
                <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>


            </div>
        </div>
    </div>
</div>
<!-- /.modal-delete-->


<!--scripts loaded here-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>

<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.min.js" type="text/javascript"></script>


<script src="<@spring.url '/js/scripts.js'/>"></script>
<script src="<@spring.url '/js/deleteRepair.js'/>"></script>
<script src="<@spring.url '/js/editRepair.js'/>"></script>
<script src="<@spring.url '/js/addParts.js'/>"></script>

<link href="<@spring.url '/js/date/bootstrap-datepicker.css'/>" rel="stylesheet">
<script src="<@spring.url '/js/date/moment.min.js'/>"></script>
<script src="<@spring.url '/js/date/bootstrap-datetimepicker.js'/>"></script>
<script type="text/javascript">
    $(function () {
        $('#dateStart').datetimepicker();
    });
</script>

<script type="text/javascript">
    $(function () {
        $('#dateEnd').datetimepicker();
    });
</script>


<script type="text/javascript">
    $(function () {
        $('#dateTime').datetimepicker();
    });
</script>

</@c.page>