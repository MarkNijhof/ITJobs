
$(document).ready(function(){

	$(window).scroll(function () {
		var scrollTop = 118;
		var topSpaceTop = '12px'

		if ($(window).scrollTop() > scrollTop) {
			$('.editor_toolbar').css('position', 'fixed');
			$('.editor_toolbar').css('top', topSpaceTop);
		} else {
			$('.editor_toolbar').css('position', 'absolute');
			$('.editor_toolbar').css('top', '');
		}
	});

	var editor = WysiHat.Editor.attach($('#job_description'));

    var boldButton = $('.editor_toolbar .bold').first();
    var italicButton = $('.editor_toolbar .italic').first();
    var underlineButton = $('.editor_toolbar .underline').first();
    var strikethroughButton = $('.editor_toolbar .strikethrough').first();
    var numberedlistButton = $('.editor_toolbar .numberedlist').first();
    var bulletsButton = $('.editor_toolbar .bullets').first();

    boldButton.click(function(event) { editor.boldSelection(); return false; });
    italicButton.click(function(event) { editor.italicSelection(); return false; });
    underlineButton.click(function(event) { editor.underlineSelection(); return false; });
    strikethroughButton.click(function(event) { editor.strikethroughSelection(); return false; });
    numberedlistButton.click(function(event) { editor.toggleOrderedList(); return false; });
    bulletsButton.click(function(event) { editor.toggleUnorderedList(); return false; });



	// var toolbar = new WysiHat.Toolbar(editor);
	// toolbar.initialize(editor);
	// 
	// toolbar.addButton({
	// 	label: "",
	// 	handler: function(editor) { return editor.toggleOrderedList(); }
	// });
	// 
	// toolbar.addButton({
	// 	label: "",
	// 	handler: function(editor) { return editor.toggleUnorderedList(); }
	// });	

	
//	$('#job_description').wysihat();
//	$('#company_description').wysihat();
});
