/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;

  config.language = 'en';
  
  config.resize_enabled = false;
  config.toolbarCanCollapse = false;
  
  // works only with en, ru, uk languages
  config.extraPlugins = "autogrow";
  config.removePlugins = 'elementspath';
  config.removePlugins = 'resize';
  
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
    	['Bold','Italic','Underline','Strike','-',],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['HorizontalRule'],
        ['Undo','Redo'],
        ['Format','RemoveFormat']
    ];
  config.contentsCss = '/stylesheets/compiled/screen.css';
  config.bodyClass = 'content';
  config.format_tags = 'p;h1;h2';

  config.sharedSpaces = {
	top: "topSpace",
	bottom: "bottomSpace"
  }
};
