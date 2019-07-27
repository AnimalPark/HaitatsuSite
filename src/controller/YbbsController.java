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

import dao.YbbsDAO;
import dao.YbbsDAOImpl;

import model.Ybbs;
import page.PageManager;
import page.PageSQL;

@WebServlet(name = "YbbsController", urlPatterns = { "/ybbs_insert.do", "/ybbs_content","/ybbs_list","/ybbs_detail","/ybbs_delete.do","/ybbs_update.do","/ybbs_reply.do","/ybbs_reply_form.do","/ybbs_req_list"})

public class YbbsController extends HttpServlet {

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

		if (action.equals("ybbs_insert.do")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboard.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_content")) {

			Ybbs ybbs = new Ybbs();
			ybbs.setSubject(req.getParameter("subject"));
			ybbs.setContent(req.getParameter("content"));
			ybbs.setId(req.getParameter("id"));

			YbbsDAO dao = new YbbsDAOImpl();
			dao.Insert(ybbs);
			
			req.setAttribute("ybbs", ybbs);
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);

		}else if (action.equals("ybbs_list")) {

			List<Ybbs> ybbsList = new ArrayList<Ybbs>();
			YbbsDAO dao = new YbbsDAOImpl();
			ybbsList = dao.selectAll();

			req.setAttribute("ybbsList", ybbsList);// 자바에서 화면으로 보내기 requst.setAttribute();
			
			RequestDispatcher rd = req.getRequestDispatcher("boardList.jsp");
			rd.forward(req, resp);

		}else if (action.equals("ybbs_detail")) {
			
			Ybbs ybbs = new Ybbs();
			int no = Integer.parseInt(req.getParameter("no"));
			
			YbbsDAO dao = new YbbsDAOImpl();
			
			ybbs = dao.selectByNo(no);
			dao.updateVisited(no);
			
			req.setAttribute("ybbs", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_delete.do")) {
			YbbsDAO dao = new YbbsDAOImpl();
			Ybbs ybbs = new Ybbs();

			ybbs.setNo(Integer.parseInt(req.getParameter("no")));

			dao.delete(ybbs.getNo());

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_update.do")) {
			Ybbs ybbs = new Ybbs();
			
			ybbs.setNo(Integer.parseInt(req.getParameter("no")));
			ybbs.setSubject(req.getParameter("subject"));
			ybbs.setContent(req.getParameter("content"));
			
			YbbsDAO dao = new YbbsDAOImpl();
			dao.update(ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);
		}  else if (action.equals("ybbs_reply.do")) {
			
			Ybbs ybbs = new Ybbs();
			
			ybbs.setSubject(req.getParameter("subject"));
			ybbs.setContent(req.getParameter("content"));
			ybbs.setGrp(Integer.parseInt(req.getParameter("grp")));
			ybbs.setId(req.getParameter("id"));
			
			YbbsDAO dao = new YbbsDAOImpl();
			
			dao.insertReply(ybbs);
			
			
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_reply_form.do")) {
			
			int num = Integer.parseInt(req.getParameter("no"));
			
			req.setAttribute("num", num);
			RequestDispatcher rd = req.getRequestDispatcher("boardReply.jsp");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_req_list")) {
			
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			
			PageManager pm = new PageManager(requestPage);

			YbbsDAO dao = new YbbsDAOImpl();
			List<Ybbs> ybbsList = new ArrayList<Ybbs>();

			ybbsList = dao.selectAll(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());
			
			
			req.setAttribute("ybbsList", ybbsList);// 자바에서 화면으로 보내기 requst.setAttribute();
			req.setAttribute("pageGroupResult", pm.getPageGroupResult(PageSQL.YBBS_SELECT_ALL_COUNT));
			
			RequestDispatcher rd = req.getRequestDispatcher("boardList.jsp");
			rd.forward(req, resp);
		}
		
	}

}