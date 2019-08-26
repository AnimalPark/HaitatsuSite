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

import dao.UsersDAO;
import dao.UsersDAOImpl;
import dao.Ybbs_QADAO;
import dao.Ybbs_QADAOImpl;
import model.Users;

@WebServlet(name = "UsersController", urlPatterns = { "/user_join", "/user_login", "/user_logout", "/find_userId",
		"/findId_link", "/findPwd_link", "/find_uPwd", "/change_uPwd", "/id_check", "/orderList_link",
		"/usersInfo_link", "/users_delete", "/users_update", "/update_link", "/updateuPwd_link", "/delete_link",
		"/check_uPwd", "/updateInfo_link", "/change_uPwd2" })

public class UsersController extends HttpServlet {
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

		if (action.equals("user_join")) {

			req.setCharacterEncoding("utf-8");

			int i = 0;
			try {
				i = Integer.parseInt(req.getParameter("chkid")); 
			} catch (Exception e) {
				i = 0;
			}
			System.out.println(i);

			if (i == 0) {

				RequestDispatcher rd = req.getRequestDispatcher("join/join.jsp");
				rd.forward(req, resp);

			} else {

				UsersDAO dao = new UsersDAOImpl();
				Users users = new Users();

				users.setUserId(req.getParameter("userId"));
				users.setuPwd(req.getParameter("uPwd"));
				users.setuName(req.getParameter("uName"));
				String[] uAddrs = {req.getParameter("roadAddress"), req.getParameter("detailAddress") };
				String addr = uAddrs[0] + "|" + uAddrs[1];
				users.setuAddr(addr);
				users.setuPhonenum(req.getParameter("uPhonenum"));

				boolean result = dao.insert(users);

				RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
				rd.forward(req, resp);
			}

		} else if (action.equals("user_login")) {

			req.setCharacterEncoding("utf-8");

			String userId = req.getParameter("userId");
			String uPwd = req.getParameter("uPwd");

			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByUserIdPwd(userId, uPwd);
			int auth = dao.selectAuthorityByUserId(userId);

			if (users != null) {

				HttpSession session = req.getSession();
				session.setAttribute("users", users);
				session.setAttribute("auth", auth);
				String preUrl = (String) session.getAttribute("caller");

				if (preUrl != null) {

					RequestDispatcher rd = req.getRequestDispatcher(preUrl);
					rd.forward(req, resp);

				} else {

					RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
					rd.forward(req, resp);
				}
			} else {

				req.setAttribute("message", "유효하지 않은 아이디이거나 비밀번호가 일치하지 않습니다.");

				RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
				rd.forward(req, resp);
			}
		} else if (action.equals("user_logout")) {

			HttpSession session = req.getSession();
			session.removeAttribute("users");

			String preUrl = (String) session.getAttribute("caller");

			if (preUrl != null) {

				RequestDispatcher rd = req.getRequestDispatcher(preUrl);
				rd.forward(req, resp);

			} else {

				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}
		} else if (action.equals("findId_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/findUserId.jsp");
			rd.forward(req, resp);

		} else if (action.equals("find_userId")) {

			String uName = req.getParameter("uName");
			String uPhonenum = req.getParameter("uPhonenum");

			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByuNameuPhonenum(uName, uPhonenum);

			req.setAttribute("users", users);

			if (users != null) {

				req.setAttribute("message", "회원님의 아이디는 다음과 같습니다.");

				RequestDispatcher rd = req.getRequestDispatcher("join/findUserId.jsp");
				rd.forward(req, resp);

			} else {

				req.setAttribute("message", "입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");

				RequestDispatcher rd = req.getRequestDispatcher("join/findUserId.jsp");
				rd.forward(req, resp);
			}
		} else if (action.equals("findPwd_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/finduPwd.jsp");
			rd.forward(req, resp);

		} else if (action.equals("find_uPwd")) {

			String userId = req.getParameter("userId");
			String uName = req.getParameter("uName");
			String uPhonenum = req.getParameter("uPhonenum");

			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByuserIduNameuPhonenum(userId, uName, uPhonenum);

			req.setAttribute("users", users);

			if (users != null) {

				req.setAttribute("userId", userId);

				RequestDispatcher rd = req.getRequestDispatcher("join/changeuPwd.jsp");
				rd.forward(req, resp);

			} else {

				req.setAttribute("message", "입력하신 정보로 가입 된 회원 정보가 존재하지 않습니다.");

				RequestDispatcher rd = req.getRequestDispatcher("join/finduPwd.jsp");
				rd.forward(req, resp);
			}
		} else if (action.equals("change_uPwd")) {

			Users users = new Users();

			users.setuPwd(req.getParameter("uPwd"));
			users.setUserId(req.getParameter("userId"));

			UsersDAO dao = new UsersDAOImpl();
			boolean result = dao.update_pwd(users);

			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);

		} else if (action.equals("id_check")) {

			UsersDAOImpl impl = new UsersDAOImpl();
			String chkId = req.getParameter("id");
			boolean chk = impl.check_userId(chkId);

			if (!chk) {
				req.setAttribute("chkid", 1);
				req.setAttribute("msg", "사용할 수 있는 아이디입니다.");
				RequestDispatcher rd = req.getRequestDispatcher("join/result.jsp");
				rd.forward(req, resp);

			} else {
				req.setAttribute("chkid", 0);
				req.setAttribute("msg", "사용할 수 없는 아이디입니다.");

				RequestDispatcher rd = req.getRequestDispatcher("join/result.jsp");
				rd.forward(req, resp);
			}
		} else if (action.equals("orderList_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("");
			rd.forward(req, resp);

		} else if (action.equals("usersInfo_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/usersInfo.jsp");
			rd.forward(req, resp);

		} else if (action.equals("users_delete")) {

			String userId = req.getParameter("userId");
			UsersDAO dao = new UsersDAOImpl();
			Ybbs_QADAO dao1 = new Ybbs_QADAOImpl();

			List<Integer> gNum = dao1.selectById(userId);
			dao1.deleteByGroup(gNum);
			boolean result = dao.deleteByUserId(userId);

			HttpSession session = req.getSession();
			session.removeAttribute("users");
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);

		} else if (action.equals("users_update")) {

			Users users = new Users();
			UsersDAO dao = new UsersDAOImpl();

			users.setuName(req.getParameter("uName"));
			String[] uAddrs = {req.getParameter("roadAddress"), req.getParameter("detailAddress") };
			String addr = uAddrs[0] + "|" + uAddrs[1];
			users.setuAddr(addr);
			users.setuPhonenum(req.getParameter("uPhonenum"));
			users.setUserId(req.getParameter("userId"));

			boolean result = dao.update(users);

			HttpSession session = req.getSession();
			session.setAttribute("users", users);

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);

		} else if (action.equals("update_link")) {
			HttpSession session = req.getSession();
			int t = Integer.parseInt(req.getParameter("type"));
			session.setAttribute("type", t);
			
			RequestDispatcher rd = req.getRequestDispatcher("join/checkuPwd.jsp");
			rd.forward(req, resp);

		} else if (action.equals("delete_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/checkuPwd_delete.jsp");
			rd.forward(req, resp);

		} else if (action.equals("check_uPwd")) {
			HttpSession session = req.getSession();
			int t = (int) session.getAttribute("type");
			UsersDAO dao = new UsersDAOImpl();

			String userId = req.getParameter("userId");
			String uPwd = req.getParameter("uPwd");

			boolean result = dao.confirmuPwd(userId, uPwd);

			req.setAttribute("result", result);

			if (result == false) {

				req.setAttribute("message", "비밀번호가 일치하지 않습니다.");

				RequestDispatcher rd = req.getRequestDispatcher("join/checkuPwd.jsp");
				rd.forward(req, resp);

			} else {
				if (t == 1) {
					RequestDispatcher rd = req.getRequestDispatcher("join/usersInfo.jsp");
					rd.forward(req, resp);
				}
				else if (t == 2) {
					Users user = (Users) session.getAttribute("users");
					String[] addrToken = user.getuAddr().split("\\|");
					req.setAttribute("roadAddr", addrToken[0]);
					req.setAttribute("detailAddr", addrToken[1]);
					RequestDispatcher rd = req.getRequestDispatcher("join/updatePage.jsp");
					rd.forward(req, resp);
				}
				else if (t == 3) {
					RequestDispatcher rd = req.getRequestDispatcher("join/changeuPwd2.jsp");
					rd.forward(req, resp);
				}
			}
		} else if (action.equals("updateuPwd_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/changeuPwd2.jsp");
			rd.forward(req, resp);

		} else if (action.equals("change_uPwd2")) {

			Users users = new Users();

			users.setuPwd(req.getParameter("uPwd"));
			users.setUserId(req.getParameter("userId"));

			UsersDAO dao = new UsersDAOImpl();
			boolean result = dao.update_pwd(users);

			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);

		} else if (action.equals("updateInfo_link")) {

			RequestDispatcher rd = req.getRequestDispatcher("join/updatePage.jsp");
			rd.forward(req, resp);

		}
	}
}