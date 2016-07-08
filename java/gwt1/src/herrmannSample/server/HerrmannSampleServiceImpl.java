package herrmannSample.server;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;
import herrmannSample.client.HerrmannSampleService;

public class HerrmannSampleServiceImpl extends RemoteServiceServlet implements HerrmannSampleService {
    // Implementation of sample interface method
    public String getMessage(String msg) {
        return "Client said: \"" + msg + "\"<br>Server answered: \"Hi!\"";
    }
}