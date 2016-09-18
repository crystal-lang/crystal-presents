// remove editor focus on esc to allow
// arrows to be used for slides navigation
CodeMirror.keyMap.macDefault["Esc"] = "blurEditor";
CodeMirror.keyMap.pcDefault["Esc"] = "blurEditor"
CodeMirror.commands.blurEditor = function(editor) {
  if (window.parent) {
    window.parent.focus();
  }
};
