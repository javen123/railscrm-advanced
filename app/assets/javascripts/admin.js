function init_select2 () {
  $(".chosen-select").select2();
  $(".chosen-deselect").select2({ allowClear: true });
}

$(document).ready(function() {
 $(".jquery-ui-date").datepicker();
});