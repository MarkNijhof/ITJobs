(function($){

	$.fn.openHeaderDropDownPanel = function(options) {

		if (options.content != "" && options.content != undefined){
			$('#dropDownHeaderContent').html(options.content);
		}

		if (options.template != "" && options.template != undefined){
			$('#dropDownHeaderContent').html('');
			$('#dropDownHeaderContent').loadTemplateFromStr($(options.template).html(), options.data);
		}
		
		if (options.callBack != undefined){
			options.callBack();
		}
		
		$('#dropDownHeader').slideDown(200);
	}
	$.fn.closeHeaderDropDownPanel = function(options) {
		$('#dropDownHeader').slideUp(200);
	}
	
})(jQuery);
	
var initialize_with_drop_down_open = false	

$(document).ready(function() { 
	
	$('#pushpin').click(function(){
		var position = $('#pushpin').css("background-position");
		if (position === undefined) {
			position = $('#pushpin').css("background-position-x") + ' ' + $('#pushpin').css("background-position-y");
		}
		
		if (position == '0px 0px') {
			$('#pushpin').css('background-position', '0px -15px');
			$('.headerInnerBox').css('position', 'fixed');
			$('.dropDownHeader').css('position', 'fixed');
			$('.dropDownHeader').css('margin-bottom', '0px');
		}
		else {
			$('#pushpin').css('background-position', '0px 0px');
			$('.headerInnerBox').css('position', 'absolute');
			$('.dropDownHeader').css('position', 'relative');
			$('.dropDownHeader').css('margin-bottom', '-30px');
		}
	});
		
	$('.dropDownHeader').show();
	
	if (initialize_with_drop_down_open) {
		$('#pushpin').css('background-position', '0px 0px');
		$('.headerInnerBox').css('position', 'absolute');
		$('.dropDownHeader').css('position', 'relative');
		$('.dropDownHeader').css('margin-bottom', '-30px');
		$.fn.openHeaderDropDownPanel({template: "#login_template", callBack: function() {setup_button_links(); }}); 
	}
	
	setup_login_link();
	setup_search_focus_button();
	
	function setup_search_focus_button() {
		$('#searchStart').click(function(){ 
			$('#searchText').focus();
		 });
		$('#searchButton').click(function(){ 
			if ($('#searchText').val() == "") $('#searchText').focus(); 
		});
	}
	
	function setup_login_link() {
		$('.signUpLink').click(function(){
			$.fn.openHeaderDropDownPanel({template: "#login_template", callBack: function() {setup_button_links(); }}); 
		});
		
		$('.signOutLink').attr('href', append_current_location($('#signOutLinkWhite').attr('href')));
	}
	
	function setup_button_links() {
		
		$('#loginWithLinkedin').click(function(){
			load_url_in_popup_window(append_current_location(linkedin_url), 'ITJo.bs - LinkedIn', 500, 400);
		});
		$('#loginWithFacebook').click(function(){
			load_url_in_popup_window(append_current_location(facebook_url), 'ITJo.bs - Facebook', 960, 400);
		});

	}
	
	function load_url_in_popup_window(url, title, width, height){
		var centeredY = 0;
		var centeredX = 0;
		if ($.browser.msie) {
			centeredY = (window.screenTop - 120) + 100;
			centeredX = window.screenLeft + ((((document.body.offsetWidth + 20)/2) - (width/2)));
		}else{
			centeredY = window.screenY + 100;
			centeredX = window.screenX + (((window.outerWidth/2) - (width/2)));
		}
		window.open(url, title, 'height='+ height +',width='+ width +',toolbar=0,scrollbars=0,status=0,resizable=0,location=0o,menuBar=0,left=' + centeredX +',top=' + centeredY).focus();
	}
});

function append_current_location(url) {
  return url + '/' + window.location.href;
}
