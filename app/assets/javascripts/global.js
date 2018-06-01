$(document).ready( function() {
  M.AutoInit();
  console.log("Materializecss javascript is running successfully ");

  $('.fixed-action-btn').floatingActionButton();
  console.log("floatingActionButton javascript is running successfully")

  $('.modal').modal();
  console.log("Modals running successfully");

  


    /* $('input.autocomplete').autocomplete({
      data: {
        "Title": null,
        "Microsoft": null,
        "Google": 'https://placehold.it/250x250'
      },
    }); */
});
