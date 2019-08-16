package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MenuDAO;
import dao.MenuDAOImpl;
import dao.RestaurantDAO;
import dao.RestaurantDAOImpl;
import model.Menu;
import model.Restaurant;

@WebServlet(name = "RestaurantController", urlPatterns = { "/admin_rtrt_list", "/admin_rtrt_search",
		"/admin_rtrt_detail", "/admin_rtrt_update", "/admin_rtrt_delete", "/admin_rtrt_save", "/admin_rtrt_insert",
		"/restaurant_add", "/admin_rtrt_mdf", "/admin_rtrt_go_detail" })
@MultipartConfig
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
			
			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_detail")) {
			
			RestaurantDAO dao = new RestaurantDAOImpl();

			int rnum = Integer.parseInt(req.getParameter("rNum"));
			MenuDAOImpl impl = new MenuDAOImpl();
			Restaurant restaurant = dao.selectByNum(rnum);
			List<Menu> menus = impl.menuDetailSelectByRnum(rnum);

			req.setAttribute("restaurant", restaurant);
			req.setAttribute("menulist", menus);

			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_go_detail");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_insert")) {
			System.out.println("==============");
			
			Part part = req.getPart("filename");

			/* get NewfileName */
			String rfileName = getFilename(part);
			//System.out.println(fileName);
			
			/* file save */
			if (rfileName != null && !rfileName.isEmpty()) {
				part.write(getServletContext().getRealPath("/WEB-INF") + "/" + rfileName);
			}

			RestaurantDAO dao = new RestaurantDAOImpl();
			Restaurant restaurant = new Restaurant();
			restaurant.setrName(req.getParameter("rName"));
			restaurant.setrPhoneNum(req.getParameter("rPhoneNum"));
			restaurant.setcNum(Integer.parseInt(req.getParameter("cNum")));
			restaurant.setTownNum(Integer.parseInt(req.getParameter("townNum")));
			restaurant.setStarAvg(Integer.parseInt(req.getParameter("starAvg")));
			restaurant.setrAddr(req.getParameter("rAddr"));
			restaurant.setrFileName(rfileName);

			boolean result = dao.insertRestaurant(restaurant);

			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_list");
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
			int rNum = Integer.parseInt(req.getParameter("rNum"));
			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_detail?rNum=" + rNum);
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

		} else if (action.equals("admin_rtrt_go_detail")) {

			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_rtrt_mdf")) {

			int rnum = Integer.parseInt(req.getParameter("rNum"));
			RestaurantDAO dao = new RestaurantDAOImpl();
			MenuDAOImpl impl = new MenuDAOImpl();
			Restaurant restaurant = dao.selectByNum(rnum);
			List<Menu> menus = impl.menuDetailSelectByRnum(rnum);

			req.setAttribute("restaurant", restaurant);
			req.setAttribute("menulist", menus);

			RequestDispatcher rd = req.getRequestDispatcher("/restaurant/rtrt_modify.jsp");
			rd.forward(req, resp);

		}

	}
	/* return unique filename */
	private String getFilename(Part part) {

		String contentDispositionHeader = part.getHeader("content-disposition");

		String[] elements = contentDispositionHeader.split(";");

		for (String element : elements) {
			if (element.trim().startsWith("filename")) {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSS");
				Date date = new Date();

				String filename = sdf.format(date);
				String extension = element.substring(element.indexOf('.'), element.length() - 1).trim();

				return filename + extension;
			}
		}
		return null;
	}

}