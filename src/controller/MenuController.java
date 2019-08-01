package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MenuDAO;
import dao.MenuDAOImpl;
import model.Menu;

@WebServlet(name = "MenuController", urlPatterns = {"/admin_menu_list", "/admin_menu_search", "/admin_menu_detail",
		"/admin_menu_insert", "/admin_menu_update", "/admin_menu_delete" })
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
			
			req.setAttribute("admin_menu", menu);
			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_search")) {

			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_detail")) {

			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_insert")) {

			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_update")) {

			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("admin_menu_delete")) {

			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		}

	}

}
