/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

/*CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};*/
CKEDITOR.editorConfig = function( config ) {
	config.language = 'fr';
	config.uiColor = '#dddddd';
	config.toolbarGroups = [
		'/',
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'selection', 'spellchecker', 'find', 'editing' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'paragraph', groups: [ 'indent', 'list', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'about', groups: [ 'about' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] }
	];

	config.removeButtons = 'Source,Save,HiddenField,ImageButton,CreateDiv,Blockquote,Unlink,Link,Anchor,Image,Flash,Iframe,ShowBlocks,About,Form,Checkbox,Radio,TextField,Textarea,Select,Button,Replace,PasteText,PasteFromWord,Templates,NewPage,BulletedList,NumberedList,Styles';
};