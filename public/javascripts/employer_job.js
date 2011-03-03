
var isEditor1Focussed = false;

document.observe("dom:loaded", function() {
	setup_toolbar_position_script();
	setup_wysihat_editors();
});

function setup_toolbar_position_script() {
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
}

function setup_wysihat_editors() {
	var editor1 = WysiHat.Editor.attach('job_description');
	var editor2 = WysiHat.Editor.attach('company_description');

  editor1.on('field:change', function(event) { extract_title_from_description(); });

	Event.observe('job_description_editor', 'focus', function() { isEditor1Focussed = true; });
	Event.observe('company_description_editor', 'focus', function() { isEditor1Focussed = false; });

  var boldButton = $$('.editor_toolbar .bold').first();
  var italicButton = $$('.editor_toolbar .italic').first();
  var underlineButton = $$('.editor_toolbar .underline').first();
  var strikethroughButton = $$('.editor_toolbar .strikethrough').first();
  var numberedlistButton = $$('.editor_toolbar .numberedlist').first();
  var bulletsButton = $$('.editor_toolbar .bullets').first();

  var pButton = $$('.editor_toolbar .p').first();
  var h1Button = $$('.editor_toolbar .h1').first();
  var h2Button = $$('.editor_toolbar .h2').first();

	boldButton.on('click', function(event)             { if (isEditor1Focussed) { editor1.boldSelection();             } else { editor2.boldSelection(); } Event.stop(event); });
	italicButton.on('click', function(event)           { if (isEditor1Focussed) { editor1.italicSelection();           } else { editor2.italicSelection(); } Event.stop(event); });
	underlineButton.on('click', function(event)        { if (isEditor1Focussed) { editor1.underlineSelection();        } else { editor2.underlineSelection(); } Event.stop(event); });
	strikethroughButton.on('click', function(event)    { if (isEditor1Focussed) { editor1.strikethroughSelection();    } else { editor2.strikethroughSelection(); } Event.stop(event); });
	numberedlistButton.on('click', function(event)     { if (isEditor1Focussed) { editor1.toggleOrderedList();         } else { editor2.toggleOrderedList(); } Event.stop(event); });
	bulletsButton.on('click', function(event)          { if (isEditor1Focussed) { editor1.toggleUnorderedList();       } else { editor2.toggleUnorderedList(); } Event.stop(event); });

	pButton.on('click', function(event)                { if (isEditor1Focussed) { editor1.pSelection();                } else { editor2.pSelection(); } Event.stop(event); });
	h1Button.on('click', function(event)               { if (isEditor1Focussed) { editor1.h1Selection();               } else { editor2.h1Selection(); } Event.stop(event); });
	h2Button.on('click', function(event)               { if (isEditor1Focussed) { editor1.h2Selection();               } else { editor2.h2Selection(); } Event.stop(event); });
}

function extract_title_from_description() {
  var h1_tags = $('job_description_editor').select('h1');
  if (h1_tags.length != 0) {
    $('job_title_preview').update();
    $('job_title_preview').insert(h1_tags[0].innerHTML.stripTags());
  } else {
    $('job_title_preview').update();
    $('job_title_preview').insert('<i>title not found, please format the job title with the H1 tag</i>');
  }
}
