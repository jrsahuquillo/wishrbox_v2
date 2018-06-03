$(document).ready( function() {
  M.AutoInit();
  console.log("Materializecss javascript is running successfully ");

  $('.fixed-action-btn').floatingActionButton();
  console.log("floatingActionButton javascript is running successfully")

  $('.modal').modal();
  var ref_url = this.referrer.split('/');
  if (ref_url[5] == "edit") {
    var modal = "#modal" + ref_url[4];
    $('.modal' + modal).modal();
    $('.modal' + modal).modal('open');
  };

  console.log("Modals running successfully");

    $(document).click('a#modal123');






    /* $('input.autocomplete').autocomplete({
      data: {
        "Title": null,
        "Microsoft": null,
        "Google": 'https://placehold.it/250x250'
      },
    }); */
});
