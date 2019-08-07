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
import model.City;
import model.Menu;
import model.Restaurant;
import model.Town;

@WebServlet(name = "MainController", urlPatterns = { "/login_link", "/join_link", "/qa_board_link", "/event_board_link", 
		"/home_link","/search_link","/addr_search", "/logout_link" ,"/admin_home_link","/restaurant_detail","/order_confirm",
		"/myPage_link"})


public class MainController extends HttpServlet {

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
		MenuDAOImpl Mimpl = null;
		
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		if (action.equals("login_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("logout_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("join_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/join.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("qa_board_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("board/qaboard.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("event_board_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("board/eventboard.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("home_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("admin_home_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("admin/adminScreen.jsp");
			rd.forward(req, resp);

		}
		
		else if (action.equals("search_link")) {
			Mimpl = new MenuDAOImpl();
			
			int category = Integer.parseInt(req.getParameter("category"));
			req.setAttribute("categ", category);
			List<Restaurant> lists = Mimpl.selectByCategory(category);
			req.setAttribute("lists", lists);
			
			List<City> citylists = Mimpl.selectAllCity();
			req.setAttribute("citylist", citylists);
			
			List<Town> townlists = Mimpl.selectAllTown();
			req.setAttribute("townlist", townlists);
			
			RequestDispatcher rd = req.getRequestDispatcher("main/search.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("addr_search")) {
			Mimpl = new MenuDAOImpl();
			String city = req.getParameter("selectCity");
			String town = req.getParameter("selectTown");
			String selctedCate = req.getParameter("catego");
			
			System.out.println(selctedCate);
			
			List<Restaurant> lists = Mimpl.selectByTownnum(city, town);
			
			req.setAttribute("lists", lists);
			RequestDispatcher rd = req.getRequestDispatcher("main/search.jsp");
			rd.forward(req, resp);

		}
		
		else if (action.equals("restaurant_detail")) {
			Mimpl = new MenuDAOImpl();
			Restaurant r = new Restaurant();
			int rno = Integer.parseInt(req.getParameter("rno"));
			List<Menu> order_lists = new ArrayList<Menu>();
			
			List<Menu> lists = Mimpl.menuSelectByRnum(rno);
			r = Mimpl.selectByRnum(rno);
			
			HttpSession session = req.getSession();
			session.setAttribute("detailR", r);
			session.setAttribute("lists", lists);
			session.setAttribute("order_lists", order_lists);

			RequestDispatcher rd = req.getRequestDispatcher("main/restaurant_detail.jsp");
			rd.forward(req, resp);
		}
		
		else if (action.equals("order_confirm")) {
			
			int mno = Integer.parseInt(req.getParameter("mnum"));
			req.setAttribute("mno", mno);
			
			RequestDispatcher rd = req.getRequestDispatcher("test2.jsp");
			rd.forward(req, resp);
		}
		else if (action.equals("myPage_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/myPage.jsp");
			rd.forward(req, resp);

		}
	}
}