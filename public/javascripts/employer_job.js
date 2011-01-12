
$(document).ready(function(){  
	if($.browser.safari){ 
		bodyelem = $("body") 
	} else{ 
		bodyelem = $("html,body") 
	}
	
    $(window).scroll(function () {  
		if ($(window).scrollTop() > 148) {
			$('#topSpace').css('position', 'fixed');
			$('#topSpace').css('top', '2px');			
		} else {
			$('#topSpace').css('position', 'absolute');
			$('#topSpace').css('top', '');			
		}
    });  
});