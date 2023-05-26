$(document).ready(function(){
	function pagination() {
		var req_num_rowI = 10; // 화면에 표시할 목록 개수
		var $trI = jQuery('#example2 > tbody tr');	// paging 대상 class명
		var total_num_rowI = $trI.length;
		var num_pagesI = 0;
		if(total_num_rowI % req_num_rowI == 0){
			num_pagesI = total_num_rowI / req_num_rowI;
		}
		if(total_num_rowI%req_num_rowI >= 1) {
			num_pagesI = total_num_rowI/req_num_rowI;
			num_pagesI++;
			num_pagesI = Math.floor(num_pagesI++);
		}
		jQuery('.paginationI').append('<li class="page-itemI">'
				+ '<a class="page-linkI" href=# aria-label="Previous"'
				+ '<span aria-hidden="true" class="mdi mdi-chevron-left"></span>'
				+ '<span class="prevI">Previous</span></a></li>');
		for(var i=1; i <= num_pagesI; i++){
			jQuery('.paginationI').append('<li class="page-itemI"><a class="page-linkI" href="#">'+i+'</a></li>');
			jQuery('.paginationI li:nth-child(2)').addClass("active");
			jQuery('.paginationI a').addClass("pagination-linkI");
		}
		jQuery('.paginationI').append('<li class="page-itemI">'
				+ '<a class="page-linkI" href="#" aria-label="NextI">'
				+ '<span aria-hidden="true" class="mdi mdi-chevron-right"></span>'
				+ '<span class="nextI">Next</span></a></li>');
		$trI.each(function(i){
			jQuery(this).hide();
			if(i+1 <= req_num_rowI){
				$trI.eq(i).show();
			}
		});
		
		if(num_pagesI == 1){
			jQuery('.paginationI li:last-child').addClass("disabled");
		}
		
		jQuery('.paginationI a').click('.pagination-linkI', function(e){
			e.preventDefault();
			$trI.hide();
			var pageI = jQuery(this).text();
			var tempI = pageI - 1;
			var startI = tempI * req_num_rowI;
			var current_linkI = tempI;
			jQuery('.paginationI li').removeClass("active");
			jQuery(this).parent().addClass("active");
			for( var i=0; i<req_num_rowI; i++){
				$trI.eq(startI + i).show();
			}
			
			if(!pageI.indexOf("Next")){
				var numI = total_num_rowI -1 ;
				$trI.eq(numI).show();
				console.log(num_pagesI+1)
				jQuery('.paginationI li:nth-child('+(num_pagesI+1)+')').addClass("active");
				jQuery('.paginationI li:last-child').addClass("disabled");
				jQuery('.paginationI li:first-child').removeClass("disabled");
			}else if(!pageI.indexOf("Previous")){
				for( var i=0; i<req_num_rowI; i++){
					$trI.eq(i).show();
				}
				jQuery('.paginationI li:nth-child(2)').addClass("active");	
				jQuery('.paginationI li:first-child').addClass("disabled");
				jQuery('.paginationI li:last-child').removeClass("disabled");
			}else {
				if(pageI == 1){
					jQuery('.paginationI li:first-child').addClass("disabled"); // prev 비활성
					if(num_pagesI > 2) jQuery('.paginationI li:last-child').removeClass("disabled"); // next 활성
					else jQuery('.paginationI li:last-child').addClass("disabled"); // next 비활성
				}else if(pageI == num_pagesI){
					jQuery('.paginationI li:first-child').removeClass("disabled"); // prev 활성
					jQuery('.paginationI li:last-child').addClass("disabled");	
				}else {
					jQuery('.paginationI li:first-child').removeClass("disabled"); // prev 활성
					jQuery('.paginationI li:last-child').removeClass("disabled"); // next 활성
					}
				}
			});
	}
	jQuery('document').ready(function() {
		pagination();
		jQuery('.paginationI li:first-child').addClass("disabled");
	});
});

