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
  
  config.height = '400px';
  config.width = '600px';
  
  //config.resize_enabled = true;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;
  
  //config.startupFocus = true;
  
  // works only with en, ru, uk languages
  config.extraPlugins = "autogrow";
  
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
    	['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize'],
        ['Undo','Redo','RemoveFormat'],
        ['Format'],
        ['Link','Unlink','Anchor'],
        ['HorizontalRule','SpecialChar']
    ];
  config.contentsCss = '/stylesheets/compiled/screen.css';
  config.bodyClass = 'content';
//  config.skin = 'itjobs';
  config.format_tags = 'p;h1;h2;h3';
};

