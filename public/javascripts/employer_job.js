
document.observe("dom:loaded", function() {
	Event.observe(window, 'scroll', function() {
		var scrollTop = 144;
		var topSpaceTop = '14px'

		if (document.viewport.getScrollOffsets()[1] > scrollTop) {
			$$('div.editor_toolbar')[0].setStyle({
				position: 'fixed',
				top: topSpaceTop
			});
		} else {
			$$('div.editor_toolbar')[0].setStyle({
				position: 'absolute',
				top: ''
			});
		}
	});
	
	var isEditor1Focussed = false;
	Event.observe('job_description', 'focus', function() { isEditor1Focussed = true; });
	Event.observe('company_description', 'focus', function() { isEditor1Focussed = false; });
		
	var editor1 = WysiHat.Editor.attach('job_description');
	var editor2 = WysiHat.Editor.attach('company_description');

    var boldButton = $$('.editor_toolbar .bold').first();
    var italicButton = $$('.editor_toolbar .italic').first();
    var underlineButton = $$('.editor_toolbar .underline').first();
    var strikethroughButton = $$('.editor_toolbar .strikethrough').first();
    var numberedlistButton = $$('.editor_toolbar .numberedlist').first();
    var bulletsButton = $$('.editor_toolbar .bullets').first();

	boldButton.on('click', function(event)          { if (isEditor1Focussed) editor1.boldSelection();          else editor2.boldSelection(); Event.stop(event); });
	italicButton.on('click', function(event)        { if (isEditor1Focussed) editor1.italicSelection();        else editor2.italicSelection(); Event.stop(event); });
	underlineButton.on('click', function(event)     { if (isEditor1Focussed) editor1.underlineSelection();     else editor2.underlineSelection(); Event.stop(event); });
	strikethroughButton.on('click', function(event) { if (isEditor1Focussed) editor1.strikethroughSelection(); else editor2.strikethroughSelection(); Event.stop(event); });
	numberedlistButton.on('click', function(event)  { if (isEditor1Focussed) editor1.toggleOrderedList();      else editor2.toggleOrderedList(); Event.stop(event); });
	bulletsButton.on('click', function(event)       { if (isEditor1Focussed) editor1.toggleUnorderedList();    else editor2.toggleUnorderedList(); Event.stop(event); });

});
