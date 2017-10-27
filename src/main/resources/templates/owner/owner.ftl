<#import "/spring.ftl" as spring/>
<#import "/template.ftl" as c/>
<@c.page title="Admin">
<!-- custom page content -->
    <#include "/owner/owner_sidebar.ftl">


<div class="plaisio container-fluid">
    <div class="header_table_custom">
        <div class="boardmsg">
            <div class="row">
                <div class="col-md-4">
                    <h4>Welcome back, ${fullName}!</h4>
                </div>

            </div>
            <h4> The next Ten repairs: </h4>
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

                                    </thead>
                                    <tbody>
                                        <#list repairList as repair>
                                        <tr>
                                            <a href="#" style="display:block">
                                                <td style="display:none;" class="id">${repair.id}</td>
                                            </a>
                                            <td class="datetime">${repair.dateTime?datetime.iso?string("MM/dd/yyyy h:mm a")}</td>
                                            <td class="status">${repair.status}</td>
                                            <td class="price">${repair.price}</td>
                                            <td class="plate">${repair.vehicle.plate}</td>
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

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<@spring.url '/js/scripts.js'/>"></script>
<script src="<@spring.url '/js/load_more.js'/>"></script>
<script>
</script>


</@c.page>

