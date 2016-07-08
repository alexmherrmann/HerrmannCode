package herrmannSample.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

@RemoteServiceRelativePath("HerrmannSampleService")
public interface HerrmannSampleService extends RemoteService {
    // Sample interface method of remote interface
    String getMessage(String msg);

    /**
     * Utility/Convenience class.
     * Use HerrmannSampleService.App.getInstance() to access static instance of HerrmannSampleServiceAsync
     */
    public static class App {
        private static HerrmannSampleServiceAsync ourInstance = GWT.create(HerrmannSampleService.class);

        public static synchronized HerrmannSampleServiceAsync getInstance() {
            return ourInstance;
        }
    }
}
