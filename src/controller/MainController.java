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
import model.Selected_menu;
import model.Town;
import model.Users;

@WebServlet(name = "MainController", urlPatterns = { "/login_link", "/join_link", "/qa_board_link", "/event_board_link",
		"/home_link", "/search_link", "/addr_search", "/logout_link", "/admin_home_link", "/restaurant_detail",
		"/order_confirm", "/ordermenu_add", "/return_detail","/order_final","/confirm_orders","/myPage_link","/order_end"})

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

		} else if (action.equals("logout_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);

		} else if (action.equals("join_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/join.jsp");
			rd.forward(req, resp);

		} else if (action.equals("qa_board_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("board/qaboard.jsp");
			rd.forward(req, resp);

		} else if (action.equals("event_board_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("board/eventboard.jsp");
			rd.forward(req, resp);

		} else if (action.equals("home_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_home_link")) {

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

		} else if (action.equals("addr_search")) {
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
			int rno = Integer.parseInt(req.getParameter("rno"));
			Restaurant r = new Restaurant();
			
			List<Selected_menu> order_lists = new ArrayList<Selected_menu>();
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

		else if (action.equals("ordermenu_add")) {
			System.out.println("check");
			int menuNum = Integer.parseInt(req.getParameter("num"));
			int menuCnt = Integer.parseInt(req.getParameter("cnt"));
			boolean cnt_plus_chk = false;
			
			Selected_menu m = new Selected_menu();

			HttpSession session = req.getSession();
			ArrayList<Selected_menu> order_lists = (ArrayList<Selected_menu>) session.getAttribute("order_lists");
			int price = 0;
			
			for (int i = 0; i < order_lists.size(); i++) {
				if (menuNum == order_lists.get(i).getmNum()) {
					order_lists.get(i).setCount(order_lists.get(i).getCount() + menuCnt);
					cnt_plus_chk = true;
					break;
				}
			}
			if(cnt_plus_chk)
				;
			else {
				MenuDAOImpl impl = new MenuDAOImpl();
				m.setPrice(menuCnt*impl.priceOfMenu(menuNum));
				m.setmName(impl.MnumToMname(menuNum));
				m.setmNum(menuNum);
				m.setCount(menuCnt);
				order_lists.add(m);
			}

			for (Selected_menu mi : order_lists)
				price += mi.getPrice();
				
			System.out.println(menuNum + " " + menuCnt);
			session.setAttribute("total_price", price);
			session.setAttribute("order_lists", order_lists);

		} else if (action.equals("return_detail")) {

			RequestDispatcher rd = req.getRequestDispatcher("main/restaurant_detail.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("order_final")) {

			RequestDispatcher rd = req.getRequestDispatcher("order/order_confirm.jsp");
			rd.forward(req, resp);

		}
		else if(action.equals("confirm_orders")) {
			HttpSession session = req.getSession();
			
			int chk = Integer.parseInt(req.getParameter("delichk"));
			session.setAttribute("delivery_check", chk);
			
		}
		else if (action.equals("myPage_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/myPage.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("order_end")) {
			System.out.println("test");
			Mimpl = new MenuDAOImpl();
			HttpSession session = req.getSession();
			Users user = (Users) session.getAttribute("users");
			int chk = (int) session.getAttribute("delivery_check");
			ArrayList<Selected_menu> order_lists = (ArrayList<Selected_menu>) session.getAttribute("order_lists");
			
			System.out.println("========");
			System.out.println(user.getUserId());
			for(Selected_menu m: order_lists) {
				System.out.println(m.toString());
			}
			System.out.println("========");
			
			Mimpl.insertUserOrder(user.getUserId(), chk);
			
			int orderNumber = Mimpl.nowOrderOnum();
			
			for(int i = 0; i < order_lists.size(); i++) {
				Mimpl.insertOrderMenu(order_lists.get(i).getmNum(),orderNumber, order_lists.get(i).getCount());
			}
			
			RequestDispatcher rd = req.getRequestDispatcher("order/finish.jsp");
			rd.forward(req, resp);

		}
	}
}