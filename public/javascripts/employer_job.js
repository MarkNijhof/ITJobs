
$(document).ready(function(){  
	
    $(window).scroll(function () {  
		var scrollTop = 148;
		var topSpaceTop = '2px'
	    if ($('.headerInnerBox').css('position') != 'absolute') {
			scrollTop = 47;
			topSpaceTop = '99px'
		}

		if ($(window).scrollTop() > scrollTop) {
			$('#topSpace').css('position', 'fixed');
			$('#topSpace').css('top', topSpaceTop);			
		} else {
			$('#topSpace').css('position', 'absolute');
			$('#topSpace').css('top', '');			
		}
    });  
});