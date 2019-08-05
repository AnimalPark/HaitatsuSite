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

import dao.UsersDAO;
import dao.UsersDAOImpl;
import dao.Ybbs_QADAO;
import dao.Ybbs_QADAOImpl;
import model.Users;
import model.Ybbs_QA;
import page.PageManager;
import sql.Sql;

@WebServlet(name = "UsersController", urlPatterns = {"/user_join", "/user_login", "/user_logout", "/find_userId", "/findId_link",
		"/findPwd_link", "/find_uPwd", "/change_uPwd", "/check_userId"})

public class UsersController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		if (action.equals("user_join"))
		{	
			req.setCharacterEncoding("utf-8");
			
			UsersDAO dao = new UsersDAOImpl();
			Users users = new Users();
			
			users.setUserId(req.getParameter("userId"));
			users.setuPwd(req.getParameter("uPwd"));
			users.setuName(req.getParameter("uName"));
			String[] uAddrs = {req.getParameter("postcode"),req.getParameter("roadAddress"),req.getParameter("detailAddress")};
			String addr = uAddrs[0]+" "+uAddrs[1]+" "+uAddrs[2];
			users.setuAddr(addr);
			users.setuPhonenum(req.getParameter("uPhonenum"));
			
			boolean result = dao.insert(users);
			
			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("user_login"))
		{
			req.setCharacterEncoding("utf-8");
			
			String userId = req.getParameter("userId");
			String uPwd = req.getParameter("uPwd");
			
			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByUserIdPwd(userId, uPwd);
			
			if(users != null)
			{
				HttpSession session = req.getSession();
				session.setAttribute("users", users);
				
				RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("message", "유효하지 않은 아이디이거나 비밀번호가 일치하지 않습니다.");
				
				RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
				rd.forward(req, resp);
			}
		}
		else if(action.equals("user_logout"))
		{
			HttpSession session = req.getSession();
			session.removeAttribute("users");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}
		else if (action.equals("findId_link")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("join/findUserId.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("find_userId"))
		{
			String uName = req.getParameter("uName");
			String uPhonenum = req.getParameter("uPhonenum");

			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByuNameuPhonenum(uName, uPhonenum);
			
			req.setAttribute("users", users);
			
			if(users != null)
			{
				req.setAttribute("message", "회원님의 아이디는 다음과 같습니다.");
				
				RequestDispatcher rd = req.getRequestDispatcher("join/findUserId.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("message", "입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
				
				RequestDispatcher rd = req.getRequestDispatcher("join/findUserId.jsp");
				rd.forward(req, resp);
			}
		}
		else if (action.equals("findPwd_link")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("join/finduPwd.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("find_uPwd"))
		{
			String userId = req.getParameter("userId");
			String uName = req.getParameter("uName");
			String uPhonenum = req.getParameter("uPhonenum");

			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByuserIduNameuPhonenum(userId, uName, uPhonenum);
			
			req.setAttribute("users", users);
			
			if(users != null)
			{
				req.setAttribute("userId", userId);
				
				RequestDispatcher rd = req.getRequestDispatcher("join/changeuPwd.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("message", "입력하신 정보로 가입 된 회원 정보가 존재하지 않습니다.");
				
				RequestDispatcher rd = req.getRequestDispatcher("join/finduPwd.jsp");
				rd.forward(req, resp);
			}
		}
		else if(action.equals("change_uPwd"))
		{
			Users users = new Users();
			
			users.setuPwd(req.getParameter("uPwd"));
			users.setUserId(req.getParameter("userId"));
			
			UsersDAO dao = new UsersDAOImpl();
			boolean result = dao.update(users);
			
			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("check_userId"))
		{
			String userId = req.getParameter("userId");//화면단 userId 가져옴

			UsersDAO dao = new UsersDAOImpl();
			Users users = dao.selectByUserId(userId);
			
			req.setAttribute("users", users);
			
			if(users != null)
			{
				req.setAttribute("message", "사용 가능한 아이디입니다.");
				
				RequestDispatcher rd = req.getRequestDispatcher("join/join.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("message", "이미 사용중인 아이디입니다.");
				
				RequestDispatcher rd = req.getRequestDispatcher("join/join.jsp");
				rd.forward(req, resp);
			}
		}
	}
}