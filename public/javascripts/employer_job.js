
/**
* Event.simulate(@element, eventName[, options]) -> Element
*
* - @element: element to fire event on
* - eventName: name of event to fire (only MouseEvents and HTMLEvents interfaces are supported)
* - options: optional object to fine-tune event properties - pointerX, pointerY, ctrlKey, etc.
*
* $('foo').simulate('click'); // => fires "click" event on an element with id=foo
*
**/
(function(){
  
  var eventMatchers = {
    'HTMLEvents': /^(?:load|unload|abort|error|select|change|submit|reset|focus|blur|resize|scroll)$/,
    'MouseEvents': /^(?:click|mouse(?:down|up|over|move|out))$/
  }
  var defaultOptions = {
    pointerX: 0,
    pointerY: 0,
    button: 0,
    ctrlKey: false,
    altKey: false,
    shiftKey: false,
    metaKey: false,
    bubbles: true,
    cancelable: true
  }
  
  Event.simulate = function(element, eventName) {
    var options = Object.extend(defaultOptions, arguments[2] || { });
    var oEvent, eventType = null;
    
    element = $(element);
    
    for (var name in eventMatchers) {
      if (eventMatchers[name].test(eventName)) { eventType = name; break; }
    }

    if (!eventType)
      throw new SyntaxError('Only HTMLEvents and MouseEvents interfaces are supported');

    if (document.createEvent) {
      oEvent = document.createEvent(eventType);
      if (eventType == 'HTMLEvents') {
        oEvent.initEvent(eventName, options.bubbles, options.cancelable);
      }
      else {
        oEvent.initMouseEvent(eventName, options.bubbles, options.cancelable, document.defaultView,
          options.button, options.pointerX, options.pointerY, options.pointerX, options.pointerY,
          options.ctrlKey, options.altKey, options.shiftKey, options.metaKey, options.button, element);
      }
      element.dispatchEvent(oEvent);
    }
    else {
      options.clientX = options.pointerX;
      options.clientY = options.pointerY;
      oEvent = Object.extend(document.createEventObject(), options);
      element.fireEvent('on' + eventName, oEvent);
    }
    return element;
  }
  
  Element.addMethods({ simulate: Event.simulate });
})()

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
		
	var editor1 = WysiHat.Editor.attach('job_description');
	var editor2 = WysiHat.Editor.attach('company_description');

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

});
