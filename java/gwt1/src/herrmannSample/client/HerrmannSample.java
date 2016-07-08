package herrmannSample.client;

import com.google.gwt.cell.client.CheckboxCell;
import com.google.gwt.cell.client.FieldUpdater;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.cellview.client.CellTable;
import com.google.gwt.user.cellview.client.Column;
import com.google.gwt.user.cellview.client.TextColumn;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.*;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.view.client.ListDataProvider;

import java.util.ArrayList;
import java.util.List;

/**
 * Entry point classes define <code>onModuleLoad()</code>
 */
public class HerrmannSample implements EntryPoint {

    private final CellTable todoTable;
    private final VerticalPanel vertical;
    private final RootPanel todoPanel;
    private final HorizontalPanel fields;
    private final TextBox tbox;
    private final Button submit;


    final List<Todo> todos = new ArrayList<>();
    final private ListDataProvider<Todo> provider;

    private static class Todo {
        public int id;
        public String text;
        public boolean checked;

        public Todo(String text, boolean checked) {
            this.text = text;
            this.checked = checked;
        }
    }

    public HerrmannSample() {
        todoPanel = RootPanel.get("todo");
        vertical = new VerticalPanel();
        todoTable = new CellTable();


        fields = new HorizontalPanel();
        tbox = new TextBox();
        submit = new Button("Submit it <b>now!</b>");

        provider = new ListDataProvider<Todo>();
        provider.addDataDisplay(todoTable);
        provider.setList(this.todos);
    }

    /**
     * This is the entry point method.
     */
    public void onModuleLoad() {
        final Button button = new Button("Click me");
        final Label label = new Label();

        button.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                if (label.getText().equals("")) {
                    HerrmannSampleService.App.getInstance().getMessage("Hello, World!", new MyAsyncCallback(label));
                } else {
                    label.setText("");
                }
            }
        });
        RootPanel.get("slot1").add(button);
        RootPanel.get("slot2").add(label);

        initSubmit();

        // input fields
        {
            fields.add(tbox);
            fields.add(submit);
        }

        {
            vertical.add(todoTable);
            vertical.add(fields);
        }

        todoPanel.add(vertical);
        todoPanel.addStyleName("container");
        todoTable.addStyleName("table");

        TextColumn<Todo> textColumn = new TextColumn<Todo>() {
            public String getValue(Todo object) {
                return object.text;
            }
        };

        CheckboxCell cbox = new CheckboxCell();

        Column<Todo, Boolean> checkColumn = new Column<Todo, Boolean>(new CheckboxCell(true, true)) {
            public Boolean getValue(Todo object) {
                return object.checked;
            }
        };

        checkColumn.setFieldUpdater(new FieldUpdater<Todo, Boolean>() {
            public void update(int index, Todo object, Boolean value) {
                object.checked = value;
            }
        });

        todoTable.addColumn(textColumn, "Todo");
        todoTable.addColumn(checkColumn, "Checked");
    }

    private void initSubmit() {
        submit.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                final String text = tbox.getText();

                if (text.length() > 0) {
                    System.out.println("sdlkandlk");
                    provider.getList().add(new Todo(text, false));
                    provider.refresh();
                } else {
                    Window.alert("Please enter some text");
                }

                tbox.setText("");
            }
        });

        submit.addStyleName("btn");
//        submit.addStyleName("btn-sm");
    }

    private static class MyAsyncCallback implements AsyncCallback<String> {
        private Label label;

        public MyAsyncCallback(Label label) {
            this.label = label;
        }

        public void onSuccess(String result) {
            label.getElement().setInnerHTML(result);
        }

        public void onFailure(Throwable throwable) {
            label.setText("Failed to receive answer from server!");
        }
    }
}
