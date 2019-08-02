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

@WebServlet(name = "UsersController", urlPatterns = {"/user_join", "/user_login", "/user_logout"})

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
			//session 객체에서 member 속성을 제거
			HttpSession session = req.getSession(); //session에 저장해야 함
			session.removeAttribute("users");
			
			//login.jsp 페이지로 이동
			RequestDispatcher rd = req.getRequestDispatcher("join/login.jsp");
			rd.forward(req, resp);
		}
	}
}