$(document).ready( function() {
  M.AutoInit();
  console.log("Materializecss javascript is running successfully ");

  $('.fixed-action-btn').floatingActionButton();
  console.log("floatingActionButton javascript is running successfully")

  $('.modal').modal();
  console.log("Modals running successfully");
  var ref_url = this.referrer.split('/');
  if (ref_url[ref_url.length-1] == "edit") {
    var modal = "#modal" + ref_url[ref_url.length-2];
    $('.modal' + modal).modal();
    $('.modal' + modal).modal('open');
  };

});
