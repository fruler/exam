

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class filter2
 */
public class filter2 implements Filter {

    /**
     * Default constructor. 
     */
    public filter2() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest arg0=(HttpServletRequest)request;
		HttpServletResponse arg1=(HttpServletResponse)response;
		HttpSession session=arg0.getSession();
      System.out.println(arg0.getServletPath());
		// pass the request along the filter chain
		if(session.getAttribute("username")!=null)
		{chain.doFilter(request, response);}
		else
			arg0.getRequestDispatcher("index.jsp").forward(arg0, arg1);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
