$(document).ready( function() {
  console.log("JavaScript is running successfully");
  M.AutoInit();

  $(document).ready(function(){
    $('.fixed-action-btn').floatingActionButton();
  });

  $(document).ready(function(){
    console.log("Modals running successfully");
    $('.modal').modal();
  });


  $(document).ready(function(){
    $('input.autocomplete').autocomplete({
      data: {
        "Title": null,
        "Microsoft": null,
        "Google": 'https://placehold.it/250x250'
      },
    });
  });
});
