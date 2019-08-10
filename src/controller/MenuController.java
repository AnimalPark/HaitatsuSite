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

import dao.MenuDAO;
import dao.MenuDAOImpl;
import dao.RestaurantDAO;
import dao.RestaurantDAOImpl;
import model.Comments;
import model.Menu;
import model.Restaurant;

@WebServlet(name = "MenuController", urlPatterns = { "/admin_menu_list", "/admin_menu_detail", "/admin_menu_insert",
		"/admin_menu_update", "/admin_menu_delete", "/menu_add", "/menu_mode", "/comment_mode", "/comment_add","/comment_list","/deleteComment" })
public class MenuController extends HttpServlet {

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

		if (action.equals("admin_menu_list")) {

			MenuDAO dao = new MenuDAOImpl();
			List<Menu> menu = dao.selectAllMenu();

			req.setAttribute("menu", menu);
			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_detail")) {

			int mNum = Integer.parseInt(req.getParameter("mNum"));
			System.out.println(mNum);
			MenuDAO dao = new MenuDAOImpl();

			Menu menu = dao.menuSelectByMnum(mNum);

			req.setAttribute("menu", menu);
			RequestDispatcher rd = req.getRequestDispatcher("menu/menu_detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_insert")) {

			MenuDAO dao = new MenuDAOImpl();
			Menu menu = new Menu();

			menu.setrNum(Integer.parseInt(req.getParameter("rNum")));
			menu.setmName(req.getParameter("mName"));
			menu.setmPrice(Integer.parseInt(req.getParameter("mPrice")));
			// menu.setmSales(Integer.parseInt(req.getParameter("mSales")));

			boolean result = dao.insertMenu(menu);

			int rNum = Integer.parseInt(req.getParameter("rNum"));

			// RequestDispatcher rd =
			// req.getRequestDispatcher("admin_rtrt_detail?rNum="+rNum);
			// rd.forward(req, resp);
			resp.sendRedirect("admin_rtrt_detail?rNum=" + rNum);
		} else if (action.equals("admin_menu_update")) {

			MenuDAO dao = new MenuDAOImpl();
			Menu menu = new Menu();

			menu.setmNum(Integer.parseInt(req.getParameter("mNum")));
			menu.setrNum(Integer.parseInt(req.getParameter("rNum")));
			menu.setmName(req.getParameter("mName"));
			menu.setmPrice(Integer.parseInt(req.getParameter("mPrice")));
			// menu.setmSales(Integer.parseInt(req.getParameter("mSales")));

			boolean result = dao.insertMenu(menu);
			int rNum = Integer.parseInt(req.getParameter("rNum"));

			// RequestDispatcher rd =
			// req.getRequestDispatcher("admin_rtrt_detail?rNum="+rNum);
			// rd.forward(req, resp);
			resp.sendRedirect("admin_rtrt_detail?rNum=" + rNum);
		} else if (action.equals("admin_menu_delete")) {

			MenuDAO dao = new MenuDAOImpl();

			int rNum = Integer.parseInt(req.getParameter("rNum"));
			int mNum = Integer.parseInt(req.getParameter("mNum"));

			boolean result = dao.deleteMenu(Integer.parseInt(req.getParameter("mNum")));

			RequestDispatcher rd = req.getRequestDispatcher("admin_rtrt_detail?rNum=" + rNum);
			rd.forward(req, resp);

		} else if (action.equals("menu_add")) {

			int rNum = Integer.parseInt(req.getParameter("rNum"));
			RestaurantDAO dao = new RestaurantDAOImpl();
			MenuDAOImpl impl = new MenuDAOImpl();
			Restaurant restaurant = dao.selectByNum(rNum);
			List<Menu> menus = impl.menuDetailSelectByRnum(rNum);

			req.setAttribute("restaurant", restaurant);
			req.setAttribute("menu", menus);

			RequestDispatcher rd = req.getRequestDispatcher("menu/menu_form.jsp");
			rd.forward(req, resp);

		} else if (action.equals("menu_mode")) {

			RequestDispatcher rd = req.getRequestDispatcher("main/restaurant_detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("comment_mode")) {

			RequestDispatcher rd = req.getRequestDispatcher("main/restaurant_detail2.jsp");
			rd.forward(req, resp);

		}
		else if (action.equals("comment_add")) {
			MenuDAOImpl mimpl = new MenuDAOImpl();
			Comments comment = new Comments();
			Comments resultByComment = null;
			
			comment.setRnum(Integer.parseInt(req.getParameter("rn")));
			comment.setUserid(req.getParameter("userid"));
			comment.setCommcontents(req.getParameter("comment"));

			
			resultByComment = mimpl.insert(comment);
		

			if(resultByComment != null) {
				req.setAttribute("result", true);
				req.setAttribute("message", "댓글추가 성공");
				System.out.println("--"+resultByComment.toString()+"--");
			}
			else {
				req.setAttribute("result", false);
				req.setAttribute("message", "댓글추가 실패");
			}
			
			req.setAttribute("recentComment", resultByComment);
			RequestDispatcher rd = req.getRequestDispatcher("main/commentitem.jsp");
			rd.forward(req, resp);
		}
		else if (action.equals("comment_list")) {
			MenuDAOImpl Mimpl = new MenuDAOImpl();
			
			HttpSession session = req.getSession();
			Restaurant r = (Restaurant) session.getAttribute("detailR");
			System.out.println(r.getrNum());
			List<Comments> comments= Mimpl.selectByRnumComments(r.getrNum());
	
			req.setAttribute("comments", comments);

			RequestDispatcher rd = req.getRequestDispatcher("main/commentlist.jsp");
			rd.forward(req, resp);
		}
		else if (action.equals("deleteComment")) {
			MenuDAOImpl Mimpl = new MenuDAOImpl();
			int chk = Integer.parseInt(req.getParameter("commnum"));
			System.out.println("확인용 : " + chk);
			Mimpl.delete(Integer.parseInt(req.getParameter("commnum")));

			RequestDispatcher rd = req.getRequestDispatcher("comment_mode");
			rd.forward(req, resp);
		}

	}

}
