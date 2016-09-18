$(function(){
  // select the name of the snippet that the playground should start hidden for
  // until the presenter press Cmd+Enter or Ctrl+Enter
  if (window.location.href.endsWith("snippet-050-compiled-vs-interpreted")) {
    var firstRow = $(".row.row-narrow");
    var secondRow = firstRow.next();
    var rightPanel = firstRow.children().last();
    rightPanel.css("display", "none");
    secondRow.css("display", "none");

    CodeMirror.commands.runCode = function(editor) {
      if (editor._playgroundSession) {
        rightPanel.show("slow");
        secondRow.show("slow");
        editor._playgroundSession.run();
      }
    };
  }
});
