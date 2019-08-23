[
    {
        "key": "ctrl+b",
        "command": "formatBold",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+i",
        "command": "formatItalic",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+u",
        "command": "markdownExtended.toggleUnderLine",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+u",
        "command": "markdownExtended.toggleUnderLine",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+a",
        "command": "editor.action.selectHighlights",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+m u",
        "command": "markdownExtended.toggleUList",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m o",
        "command": "markdownExtended.toggleOList",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+s",
        "command": "insertSnippet",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+M ctrl+D",
        "command": "-insertSnippet",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+>",
        "command": "insertSnippet",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m",
        "command": "-editor.action.toggleTabFocusMode"
    },
    {
        "key": "ctrl+m i",
        "command": "markdown-preview-enhanced.openImageHelper",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+shift+c",
        "command": "markdown-preview-enhanced.customizeCss",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m l",
        "command": "",
        "when": "editorTextFocus && markdownShortcuts:enabled"
    },
    {
        "key": "ctrl+m ctrl+-",
        "command": "markdownExtended.toggleSubscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+l",
        "command": "-markdownExtended.toggleSubscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+=",
        "command": "markdownExtended.toggleSuperscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+u",
        "command": "-markdownExtended.toggleSuperscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m `",
        "command": "markdownExtended.toggleCodeInline",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+t",
        "command": "markdownExtended.pasteAsTable",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+t ctrl+shift+p",
        "command": "-markdownExtended.pasteAsTable",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m q",
        "command": "markdownExtended.toggleBlockQuote",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+q",
        "command": "-markdownExtended.toggleBlockQuote",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "alt+`",
        "command": "-markdownExtended.toggleCodeInline",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+v",
        "command": "telesoho.MarkdownPaste",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+alt+v",
        "command": "-telesoho.MarkdownPaste",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m c",
        "command": "",
        "when": "editorTextFocus && markdownShortcuts:enabled"
    },
    {
        "key": "ctrl+m ctrl+r",
        "command": "markdown-preview-enhanced.runAllCodeChunks",
        "when": "editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+enter",
        "command": "-markdown-preview-enhanced.runAllCodeChunks",
        "when": "editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+p",
        "command": "markdown-preview-enhanced.openPreview",
        "when": "editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+M p",
        "command": "markdown-preview-enhanced.openPreviewToTheSide",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+m",
        "command": "-markdown-preview-enhanced.openPreview",
        "when": "editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m `",
        "command": "markdownExtended.toggleCodeBlock",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    }
    /*
    Name	Description	Keyboard Shortcuts	Menu Contexts
markdown-preview-enhanced.openPreviewToTheSide	Markdown Preview Enhanced: Open Preview to the Side	
editor/contexteditor/title
markdown-preview-enhanced.openPreview	Markdown Preview Enhanced: Open Preview	
markdown-preview-enhanced.toggleScrollSync	Markdown Preview Enhanced: Toggle Scroll Sync		
markdown-preview-enhanced.toggleLiveUpdate	Markdown Preview Enhanced: Toggle Live Update		
markdown-preview-enhanced.toggleBreakOnSingleNewLine	Markdown Preview Enhanced: Toggle Break On Single New Line		
markdown-preview-enhanced.openImageHelper	Markdown Preview Enhanced: Image Helper		
markdown-preview-enhanced.runAllCodeChunks	Markdown Preview Enhanced: Run All Code Chunks	
markdown-preview-enhanced.runCodeChunk	Markdown Preview Enhanced: Run Code Chunk	
markdown-preview-enhanced.syncPreview	Markdown Preview Enhanced: Sync Preview	
markdown-preview-enhanced.customizeCss	Markdown Preview Enhanced: Customize CSS		
markdown-preview-enhanced.insertNewSlide	Markdown Preview Enhanced: Insert New Slide		
markdown-preview-enhanced.insertTable	Markdown Preview Enhanced: Insert Table		
markdown-preview-enhanced.insertPagebreak	Markdown Preview Enhanced: Insert Page Break		
markdown-preview-enhanced.createTOC	Markdown Preview Enhanced: Create TOC		
markdown-preview-enhanced.openMermaidConfig	Markdown Preview Enhanced: Open Mermaid Config		
markdown-preview-enhanced.openMathJaxConfig	Markdown Preview Enhanced: Open MathJax Config		
markdown-preview-enhanced.openPhantomJSConfig	Markdown Preview Enhanced: Open PhantomJS Config		
markdown-preview-enhanced.extendParser	Markdown Preview Enhanced: Extend Parser		
markdown-preview-enhanced.showUploadedImages	Markdown Preview Enhanced: Show Uploaded Images
 

markdownExtended.export	%markdownExtended.exportCurrent%		editor/context
markdownExtended.exportWorkspace	%markdownExtended.exportWorkspace%		explorer/context
markdownExtended.copy	%markdownExtended.copy%		editor/context
markdownExtended.copyWithStyle	%markdownExtended.copyWithStyle%		editor/context
markdownExtended.pasteAsTable	%markdownExtended.pasteAsTable%	
markdownExtended.formateTable	%markdownExtended.formateTable%	
markdownExtended.toggleBold	%markdownExtended.toggleBold%	
markdownExtended.toggleCodeBlock	%markdownExtended.toggleCodeBlock%	
markdownExtended.toggleBlockQuote	%markdownExtended.toggleBlockQuote%	
// markdownExtended.toggleCodeInline	
markdownExtended.toggleItalics	%markdownExtended.toggleItalics%	
markdownExtended.toggleSubscript	%markdownExtended.toggleSubscript%	
markdownExtended.toggleOList	%markdownExtended.toggleOList%	
markdownExtended.toggleStrikethrough	%markdownExtended.toggleStrikethrough%	
markdownExtended.toggleUList	%markdownExtended.toggleUList%	
markdownExtended.toggleUnderLine	%markdownExtended.toggleUnderLine%	
markdownExtended.toggleMark	%markdownExtended.toggleMark%	
markdownExtended.toggleSuperscript	%markdownExtended.toggleSuperscript%	
markdownExtended.addColumnRight	%markdownExtended.addColumnRight%	
markdownExtended.addColumnLeft	%markdownExtended.addColumnLeft%	
markdownExtended.addRowBelow	%markdownExtended.addRowBelow%	
markdownExtended.addRowAbove	%markdownExtended.addRowAbove%	
markdownExtended.DeleteColumn	%markdownExtended.DeleteColumn%	
markdownExtended.DeleteRow	%markdownExtended.DeleteRow%	
markdownExtended.MoveColumnLeft	%markdownExtended.MoveColumnLeft%	
markdownExtended.MoveColumnRight	%markdownExtended.MoveColumnRight%	

telesoho.MarkdownDownload	Markdown Download	

telesoho.MarkdownPaste	Markdown Paste	

telesoho.MarkdownRuby	Markdown Ruby	

telesoho.insertMathSymbol	Insert latex math symbol	

    */
]