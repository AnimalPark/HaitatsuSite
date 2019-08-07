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

import dao.MenuDAO;
import dao.MenuDAOImpl;
import dao.RestaurantDAO;
import dao.RestaurantDAOImpl;
import model.Menu;
import model.Restaurant;

@WebServlet(name = "RestaurantController", urlPatterns = { "/admin_rtrt_list", "/admin_rtrt_search",
		"/admin_rtrt_detail", "/admin_rtrt_update", "/admin_rtrt_delete", "/admin_rtrt_save", "/admin_rtrt_insert",
		"/restaurant_add"})
public class RestaurantController extends HttpServlet {

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
	
		if (action.equals("admin_rtrt_list")) {

			RestaurantDAO dao = new RestaurantDAOImpl();
			List<Restaurant> restaurant = dao.selectAll();

			req.setAttribute("restaurant", restaurant);
			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_search")) {

			RestaurantDAO dao = new RestaurantDAOImpl();
			String rName = req.getParameter("rName");
			List<Restaurant> restaurant = dao.selectByName(rName);

			req.setAttribute("restaurant", restaurant);
			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_list");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_detail")) {

			int rnum = Integer.parseInt(req.getParameter("rNum"));
			RestaurantDAO dao = new RestaurantDAOImpl();
			MenuDAOImpl impl = new MenuDAOImpl();
			Restaurant restaurant = dao.selectByNum(rnum);
			List<Menu> menus = impl.menuDetailSelectByRnum(rnum);
		
			req.setAttribute("restaurant", restaurant);
			req.setAttribute("menulist", menus);
			
			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_insert")) {
			System.out.println("==============");
			
			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = new Restaurant();
			restaurant.setrName(req.getParameter("rName"));
			restaurant.setrPhoneNum(req.getParameter("rPhoneNum"));
			restaurant.setcNum(Integer.parseInt(req.getParameter("cNum")));
			restaurant.setTownNum(Integer.parseInt(req.getParameter("townNum")));
			restaurant.setStarAvg(Integer.parseInt(req.getParameter("starAvg")));
			restaurant.setrAddr(req.getParameter("rAddr"));

			boolean result = dao.insertRestaurant(restaurant);

			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_form.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_update")) {

			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = new Restaurant();

			restaurant.setrNum(Integer.parseInt(req.getParameter("rNum")));
			restaurant.setrName(req.getParameter("rName"));
			restaurant.setrPhoneNum(req.getParameter("rPhoneNum"));
			restaurant.setcNum(Integer.parseInt(req.getParameter("cNum")));
			restaurant.setTownNum(Integer.parseInt(req.getParameter("townNum")));
			restaurant.setStarAvg(Integer.parseInt(req.getParameter("starAvg")));
			restaurant.setrAddr(req.getParameter("rAddr"));

			boolean result = dao.updateRestaurant(restaurant);

			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_list");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_delete")) {

			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = new Restaurant();

			restaurant.setrNum(Integer.parseInt(req.getParameter("rNum")));
			boolean result = dao.deleteRestaurant(Integer.parseInt(req.getParameter("rNum")));

			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_list");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_save")) {

			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_form.jsp");
			rd.forward(req, resp);

		} else if (action.equals("restaurant_add")) {

			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_form.jsp");
			rd.forward(req, resp);

		} 
		

	}

}