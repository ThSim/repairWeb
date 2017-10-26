<!-- /.modal-delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Warning</h4>
            </div>
            <div class="modal-body">

                <p>You are about to delete.</p>
                <p>Do you want to proceed?</p>
            </div>
            <div class="modal-footer ">
                <form class="edit_delete_form" action="" method="post" style="display:none">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input class="iduser" name="id" value=""></input>
                </form>
                <a href="#" id="btnYes" class="btn danger">Yes</a>
                <a href="#" id="btnNo" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal-delete-->