
$(document).ready(function(){  
	
    $(window).scroll(function () {  
		var scrollTop = 148;
		var topSpaceTop = '2px'
	    if ($('.headerInnerBox').css('position') != 'absolute') {
			scrollTop = 47;
			topSpaceTop = '99px'
		}

		if ($(window).scrollTop() > scrollTop) {
			$('.toolBar').css('position', 'fixed');
			$('.toolBar').css('top', topSpaceTop);			
		} else {
			$('.toolBar').css('position', 'absolute');
			$('.toolBar').css('top', '');			
		}
    });  
});