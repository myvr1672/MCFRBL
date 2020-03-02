package common;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class AuthenticationInterceptor implements Interceptor {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void destroy() {
	}

    public void init() {
	}

    public String intercept(ActionInvocation actionInvocation) throws Exception {
		Map session = actionInvocation.getInvocationContext().getSession();
		//System.out.println("inside interceptor ");
		if (session.get("userid") == null) {
			System.out.println("returning error due to no user id found in session");
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			System.out.println("HttpServletResponse.SC_UNAUTHORIZED"+HttpServletResponse.SC_UNAUTHORIZED);
			return "authentication_error";
			
		}
		else {
			//System.out.println("forwarding to actual action as user id is found in session");
			return actionInvocation.invoke();
		}
	}
}