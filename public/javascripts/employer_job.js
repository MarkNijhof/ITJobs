
$(document).ready(function(){

	$(window).scroll(function () {
		var scrollTop = 116;
		var topSpaceTop = '14px'

		if ($(window).scrollTop() > scrollTop) {
			$('.editor_toolbar').css('position', 'fixed');
			$('.editor_toolbar').css('top', topSpaceTop);
		} else {
			$('.editor_toolbar').css('position', 'absolute');
			$('.editor_toolbar').css('top', '');
		}
	});

	var editor1 = WysiHat.Editor.attach($('#job_description'));
	var editor2 = WysiHat.Editor.attach($('#company_description'));
	
	jQuery.extend(jQuery.expr[':'], {
	    focus: function(element) { 
	        return element == document.activeElement; 
	    }
	});
	var isEditor1Focussed = false;
	$("#job_description").focus(function(){ isEditor1Focussed = true; });
	$("#company_description").focus(function(){ isEditor1Focussed = false; });

    var boldButton = $('.editor_toolbar .bold').first();
    var italicButton = $('.editor_toolbar .italic').first();
    var underlineButton = $('.editor_toolbar .underline').first();
    var strikethroughButton = $('.editor_toolbar .strikethrough').first();
    var numberedlistButton = $('.editor_toolbar .numberedlist').first();
    var bulletsButton = $('.editor_toolbar .bullets').first();

    boldButton.click(function(event) 			{ if (isEditor1Focussed) editor1.boldSelection(); 			else editor2.boldSelection(); return false; });
    italicButton.click(function(event) 			{ if (isEditor1Focussed) editor1.italicSelection(); 		else editor2.italicSelection(); return false; });
    underlineButton.click(function(event) 		{ if (isEditor1Focussed) editor1.underlineSelection(); 		else editor2.underlineSelection(); return false; });
    strikethroughButton.click(function(event) 	{ if (isEditor1Focussed) editor1.strikethroughSelection(); 	else editor2.strikethroughSelection(); return false; });
    numberedlistButton.click(function(event) 	{ if (isEditor1Focussed) editor1.toggleOrderedList(); 		else editor2.toggleOrderedList(); return false; });
    bulletsButton.click(function(event) 		{ if (isEditor1Focussed) editor1.toggleUnorderedList(); 	else editor2.toggleUnorderedList(); return false; });

});
