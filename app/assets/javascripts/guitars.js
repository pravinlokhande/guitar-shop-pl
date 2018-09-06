
$(document).ready(function() {
	$('#search_guitars').click(function() {
		$('#results').empty();
		$('#search_results_details').empty();
            
	    var query_text = $('#search_guitar_input_box').val();
		if (query_text.length < 2) {
			return;
		}
		$.ajax({
	      type: "POST",
	      contentType: "application/json; charset=utf-8",
	      data : JSON.stringify({query_text: query_text }),
	      dataType: "json",
	      url: "/get_search_results"
	    }).error(function(xhr){
	      var data = JSON.parse(xhr.responseText);
	      if(data != null){
	        $('#search_results_details').text('There is problem in searching your query ' + data);
	      }
	    }).done(function(data){
	      result = data.result
	      if (result.c > 0) {
            $('#results').removeClass('hide');
            var resultDiv = $.map(result.r, function(record) {
            	var record = record.table;
            	return (
			    	'<div class="col-md-12">'+
					  '<div class="col-md-3 padding-right-5">'+
					    record.brand +
					  '</div>'+
					  '<div class="col-md-3 padding-right-5">'+
					    record.model +
					  '</div>'+
					  '<div class="col-md-3 padding-right-5">'+
					    record.price +
					  '</div>'+
					'</div>'
				)
			});
            $('#results').append(
		      '<div class=" margin-top-15">'+
		        '<span>' + result.c + ' Record found.' + '</span>' +
		        resultDiv +
		      '</div>'
		    )
	      } else {
            var search_results = $('#search_results_details');
            search_results.text('No result fount for query: ' + data.result.q);
	      }
	    });
    });
});
