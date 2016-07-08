import io =  std.stdio;
import dlangui.widgets.widget;
import dlangui.widgets.layouts;
import dlangui.widgets.controls;
import dlangui.dialogs.msgbox;
import dlangui.core.stdaction;
import dlangui;
mixin APP_ENTRY_POINT;
string dml = `
VerticalLayout {
  // margins: 7
  padding: 7
  layoutWidth: fill
  layoutHeight: fill
  // height: 100
  HorizontalLayout {
    layoutWidth: fill
    EditLine {
      layoutWidth: fill
      id: name
      minWidth: 250
      fontFace: Arial
    }
    Button {
      layoutWidth: fill
      id: submit
      text: "Profess Love?"
      fontFace: Arial
    }
  }
}`;

extern(C) int UIAppMain(string[] args) {
  Window mainwin = Platform.instance.createWindow("Alex Loves...", null, WindowFlag.Resizable, 400, 150);
  mainwin.mainWidget = parseML(dml);

  Button professor = mainwin.mainWidget.childById!Button("submit");
  EditLine name = mainwin.mainWidget.childById!EditLine("name");
  professor.click = (Widget w) {
    mainwin.showMessageBox("Love?", "name: " ~ name.text , [ACTION_CLOSE]);
    return true;
  };

  mainwin.show();
  return  Platform.instance.enterMessageLoop();
}
