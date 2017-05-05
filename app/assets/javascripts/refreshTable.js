function createTable(data){
  headers = data.columns;
  dataSet = data.dataSet;
  $("div#datatable_wrapper").remove();
  var tabledef = '<table id="datatable" class="table table-striped table-bordered bulk_action" style="opacity:0;"> </table>';
  $("div#refreshTable").append(tabledef);
  if (typeof(myTable) !== 'undefined'){
    myTable.destroy();
  }
  //Set dataSet and headers as inputs of DataTable()
  myTable = $("#datatable").DataTable({
    data: dataSet,
    columns: columns,
    dom: "lBfrtip",
    buttons: [
      {
        extend: "copyHtml5",
        className: "btn-sm"
      },
      {
        extend: "csvHtml5",
        className: "btn-sm"
      },
      {
        extend: "excelHtml5",
        className: "btn-sm"
      },
      {
        extend: "pdfHtml5",
        className: "btn-sm"
      },
      {
        extend: "print",
        className: "btn-sm"
      },
    ],
    keys: true,
    responsive: true,
    fixedHeader: true
  });
  $("#datatable_wrapper").css("opacity",100);
  $("table#datatable").css("opacity",100);
  drawTable();
  press_select_all = false;
  press_deselect_all = false;
}

$(document).ready(function()
{
  press_select_all = false;
  press_deselect_all = false;
  $('.checkbox').on('ifToggled', function(event){
    if (!($("input.flat:checked").length == $("input.flat:checkbox").length) && press_select_all){
      return;
    }
    if (!($("input.flat:checked").length == 0) && press_deselect_all){
      return;
    }
    checked_ids = [];
    column_header = [];
    $("input.flat:checkbox").each(function(i){
      var val = $(this).is(':checked');
      if(val){
        checked_ids.push($(this).attr("id"));
      }
    });
    if(checked_ids.length!=0){
      ajax_call('json', 'table', '<%= path %>', createTable, false);
    }
    else
    {
      var wrapper_element = document.getElementById('datatable_wrapper');
      if (wrapper_element !== null){
        $("#datatable_wrapper").css("opacity",0);
        $("div#datatable_wrapper").remove();
        myTable.destroy();
      }
      if (press_deselect_all){
        press_deselect_all = false;
      }
    }
  });
});
