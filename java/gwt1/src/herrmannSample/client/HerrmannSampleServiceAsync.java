package herrmannSample.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

public interface HerrmannSampleServiceAsync {
    void getMessage(String msg, AsyncCallback<String> async);
}
