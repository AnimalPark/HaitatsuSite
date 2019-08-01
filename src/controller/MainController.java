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

import dao.MenuDAOImpl;
import model.City;
import model.Restaurant;
import model.Town;

@WebServlet(name = "MainController", urlPatterns = { "/login_link", "/sign_link", "/qa_board_link", "/event_board_link", 
		"/home_link","/search_link","/addr_search","/idcheck"})

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

			RequestDispatcher rd = req.getRequestDispatcher("test.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("sign_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("test.jsp");
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

			r = Mimpl.selectByRnum(rno);
			req.setAttribute("detailR", r);
			RequestDispatcher rd = req.getRequestDispatcher("jsp/detail/memDetail.jsp");
			rd.forward(req, resp);

		}
		
		/*else if (action.equals("idcheck")) {

			boolean chk = true;
			if(chk) {
				System.out.println("check");
				req.setAttribute("msg", "사용할 수 있는 아이디입니다.");
			}
			else {
				req.setAttribute("msg", "사용할 수 없는 아이디입니다.");
			}
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);

		}*/
		
	}
}