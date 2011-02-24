
$(document).ready(function(){  
	
    $(window).scroll(function () {  
		var scrollTop = 118;
		var topSpaceTop = '12px'

		if ($(window).scrollTop() > scrollTop) {
			$('.toolBar').css('position', 'fixed');
			$('.toolBar').css('top', topSpaceTop);			
		} else {
			$('.toolBar').css('position', 'absolute');
			$('.toolBar').css('top', '');			
		}
    });  
});