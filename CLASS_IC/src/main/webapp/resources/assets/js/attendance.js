
$(function() {
    $('.product').draggable();
    $('.favourites').droppable({
    	activeClass: "highlight",
    	appendTo: "body",
      	drop: function(event, ui) {

        $(this).addClass('highlight');

        var favourite 	=	ui.draggable.css('background-image');
        	miniFav		=	'<span style="background-image:'+favourite+';"></span>';

		$(miniFav).appendTo('.favourites-container');
		ui.draggable.fadeOut();
  		}
	});
});

$(function() {
   // $('.product').sortable();
    //$(".product").disableSelection();
	
	$(".save").click(function() {
		$('.product').each(function(index) {
			var id = $(this).text(),
				order = index;
			
			console.log("ID: " + id + " | " + "Order: " + order);
		});
	});
});
