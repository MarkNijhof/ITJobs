/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'en';
  //config.uiColor = '#FFFFFF';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ; 
  
  //config.height = '400px';
  //config.width = '100%';
  
  config.resize_enabled = false;
  config.toolbarCanCollapse = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;
  
  //config.startupFocus = true;
  
  // works only with en, ru, uk languages
  config.extraPlugins = "autogrow";
  config.removePlugins = 'elementspath';
  config.removePlugins = 'resize';
  
  config.toolbar = 'Easy';
  //config.editor.mode = 'wysiwyg';
  
  config.toolbar_Easy =
    [
    	['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Undo','Redo','RemoveFormat'],
        ['Format'],
        ['Link','Unlink','Anchor'],
        ['HorizontalRule','SpecialChar']
    ];
  config.contentsCss = '/stylesheets/compiled/screen.css';
  config.bodyClass = 'content';
//  config.skin = 'itjobs';
  config.format_tags = 'p;h1;h2;h3';
  config.sharedSpaces = {
	top: "topSpace",
	bottom: "bottomSpace"
  }
};

  
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
