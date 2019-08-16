package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MenuDAOImpl;
import model.Restaurant;
import model.Selected_menu;
import model.Users;


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
			MenuDAOImpl Mimpl = new MenuDAOImpl();
			
			HttpSession session = req.getSession();
			Restaurant r = (Restaurant) session.getAttribute("detailR");
			String s = r.getrAddr();
			try {
				Users user = (Users) session.getAttribute("users");
				int chk = (int) session.getAttribute("delivery_check");
				ArrayList<Selected_menu> order_lists = (ArrayList<Selected_menu>) session.getAttribute("order_lists");

				Mimpl.insertUserOrder(user.getUserId(), chk);

				int orderNumber = Mimpl.nowOrderOnum();

				for (int i = 0; i < order_lists.size(); i++) {
					Mimpl.insertOrderMenu(order_lists.get(i).getmNum(), orderNumber, order_lists.get(i).getCount());
				}
				req.setAttribute("juso", s);
				session.removeAttribute("total_price");
				session.removeAttribute("order_lists");
				RequestDispatcher rd = req.getRequestDispatcher("map/mapTest2.jsp");
				rd.forward(req, resp);
			}
			catch(Exception e){
				RequestDispatcher rd = req.getRequestDispatcher("login_link");
				rd.forward(req, resp);;
			}
		}
	}
}