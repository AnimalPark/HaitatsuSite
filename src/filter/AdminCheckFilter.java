package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AdminCheckFilter", urlPatterns = {"*.ad"})
public class AdminCheckFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession(false);
		int auth = (int) session.getAttribute("auth");
		boolean authority = false;

		if (session != null) {
			
			if (auth == 1) {
					authority = true;
			}
		}

		if (authority == true || auth != 0) {
			chain.doFilter(req, res);
		} else {
			
			int warning = 0;
			req.setAttribute("warning", warning);
			
			RequestDispatcher rd  = ((HttpServletRequest) req).getRequestDispatcher("index.jsp");
			rd.forward(req, ((HttpServletResponse) res));
		}
	}
}
