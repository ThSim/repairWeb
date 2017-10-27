<#import "/spring.ftl" as spring/>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/admin/admin_sidebar.ftl">

<div class="plaisio">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <div class="boardmsg">
    <h2>Welcome back, ${fullName}</h2>
    <h3>This is the Admin's page, Be carefull!</h3>
    <h3>    The next Ten repairs: </h3>
    </div>

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
                                       <a href="#" style="display:block"> <td style="display:none;" class="id">${repair.id}</td></a>
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

                    <#else>
                        <h2> No Repairs have found for the next days</h2>
                    </#if>

                </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!--scripts loaded here-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>
<script src="<@spring.url '/js/load_more.js'/>"></script>
<script >
</script>


</@c.page>

