package interceptor;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor {
	private static final long serialVersionUID = 1L;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
//		Map<String, Object> sessionAttributes = invocation
//				.getInvocationContext().getSession();

		
		
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		if (username== null) {
			return "login";
		} else 
		{
			if (!username.equals(null)) 
					{
				return invocation.invoke();
			} else {
				return "login";
			}
		}

	}

}
