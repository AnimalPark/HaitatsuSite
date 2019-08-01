package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDAO;
import dao.RestaurantDAOImpl;
import model.Restaurant;

@WebServlet(name = "RestaurantController", urlPatterns = { "/admin_rtrt_list", "/admin_rtrt_search",
		"/admin_rtrt_detail", "/admin_rtrt_insert", "/admin_rtrt_update", "/admin_rtrt_delete" })
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
			RequestDispatcher rd = req.getRequestDispatcher("/retaurant/rtrt_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_search")) {

			RestaurantDAO dao = new RestaurantDAOImpl();
			String name = req.getParameter("rname");
			List<Restaurant> restaurant = dao.selectByName(name);

			req.setAttribute("restaurant", restaurant);
			RequestDispatcher rd = req.getRequestDispatcher("/retaurant/rtrt_list.jsp");
			rd.forward(req, resp);
		
		} else if (action.equals("admin_rtrt_detail")) {

			int rnum = Integer.parseInt(req.getParameter("rnum"));
			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = dao.selectByNum(rnum);

			req.setAttribute("restaurant", restaurant);
			RequestDispatcher rd = req.getRequestDispatcher("/retaurant/rtrt_detail.jsp");
			rd.forward(req, resp);
		
		}  else if (action.equals("admin_rtrt_insert")) {
			
			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = new Restaurant();
			
			restaurant.setrName(req.getParameter("rName"));
			restaurant.setrPhoneNum(req.getParameter("rPhoneNum"));
			restaurant.setcNum(Integer.parseInt(req.getParameter("cNum")));
			restaurant.setTownNum(Integer.parseInt(req.getParameter("townNum")));
			restaurant.setStarAvg(Integer.parseInt(req.getParameter("starAvg")));
			restaurant.setrAddr(req.getParameter("rAddr"));

			boolean result = dao.insertRestaurant(restaurant);
			
			RequestDispatcher rd = req.getRequestDispatcher("/retaurant/rtrt_list.jsp");
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
			
			RequestDispatcher rd = req.getRequestDispatcher("/retaurant/rtrt_list.jsp");
			rd.forward(req, resp);
		
		} else if (action.equals("admin_rtrt_delete")) {
			
			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = new Restaurant();
			
			restaurant.setrNum(Integer.parseInt(req.getParameter("rNum")));
			boolean result = dao.deleteRestaurant(Integer.parseInt(req.getParameter("no")));
			
			RequestDispatcher rd = req.getRequestDispatcher("/retaurant/rtrt_list.jsp");
			rd.forward(req, resp);
		
		}

	}

}
