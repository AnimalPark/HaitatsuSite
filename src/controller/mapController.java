package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Restaurant;


@WebServlet(name = "mapController", urlPatterns = { "/searchJuso","/mapMove"})

public class mapController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		if (action.equals("searchJuso")) {
			RequestDispatcher rd = req.getRequestDispatcher("getJuso.jsp");
			rd.forward(req, resp);
		}
		
		else if (action.equals("mapMove")) {
			HttpSession session = req.getSession();

			Restaurant r = (Restaurant) session.getAttribute("detailR");
			String s = r.getrAddr();
			req.setAttribute("juso", s);
			
			session.removeAttribute("total_price");
			session.removeAttribute("order_lists");
			RequestDispatcher rd = req.getRequestDispatcher("map/mapTest2.jsp");
			rd.forward(req, resp);
		}
	}
}