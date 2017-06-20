$( function() {
    $( ".tier" ).sortable({
    	revert: true
    });
    $( ".alternative" ).draggable({
     /* connectToSortable: ".tier" ,*/
      /*helper: "clone",*/
      /*revert: "invalid",*/
    });
    $( "div" ).disableSelection();
  } );