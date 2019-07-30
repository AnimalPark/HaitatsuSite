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

import dao.YbbsDAOImpl;
import dao.Ybbs_QADAO;
import model.Ybbs_QA;
import page.PageManager;
import sql.Sql;

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

			Ybbs_QA ybbs = new Ybbs_QA();
			ybbs.setQasubject(req.getParameter("qasubject"));
			ybbs.setQacomment(req.getParameter("qacomment"));
			ybbs.setUserid(req.getParameter("userid"));

			Ybbs_QADAO dao = new YbbsDAOImpl();
			dao.Insert(ybbs);
			
			req.setAttribute("ybbs", ybbs);
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);

		}else if (action.equals("ybbs_list")) {

			List<Ybbs_QA> ybbsList = new ArrayList<Ybbs_QA>();
			Ybbs_QADAO dao = new YbbsDAOImpl();
			ybbsList = dao.selectAll();

			req.setAttribute("ybbsList", ybbsList);// 자바에서 화면으로 보내기 requst.setAttribute();
			
			RequestDispatcher rd = req.getRequestDispatcher("boardList.jsp");
			rd.forward(req, resp);

		}else if (action.equals("ybbs_detail")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			int no = Integer.parseInt(req.getParameter("no"));
			
			Ybbs_QADAO dao = new YbbsDAOImpl();
			
			ybbs = dao.selectByNo(no);
			dao.updateVisited(no);
			
			req.setAttribute("ybbs", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_delete.do")) {
			Ybbs_QADAO dao = new YbbsDAOImpl();
			Ybbs_QA ybbs = new Ybbs_QA();

			ybbs.setQanumber(Integer.parseInt(req.getParameter("qanumber")));

			dao.delete(ybbs.getQanumber());

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);
		} else if (action.equals("ybbs_update.do")) {
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQanumber(Integer.parseInt(req.getParameter("qanumber")));
			ybbs.setQasubject(req.getParameter("qasubject"));
			ybbs.setQacomment(req.getParameter("qacomment"));
			
			Ybbs_QADAO dao = new YbbsDAOImpl();
			dao.update(ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_list");
			rd.forward(req, resp);
		}  else if (action.equals("ybbs_reply.do")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQasubject(req.getParameter("qasubject"));
			ybbs.setQacomment(req.getParameter("qacomment"));
			ybbs.setQagroup(Integer.parseInt(req.getParameter("qagroup")));
			ybbs.setUserid(req.getParameter("userid"));
			
			Ybbs_QADAO dao = new YbbsDAOImpl();
			
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

			Ybbs_QADAO dao = new YbbsDAOImpl();
			List<Ybbs_QA> ybbsList = new ArrayList<Ybbs_QA>();

			ybbsList = dao.selectAll(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());
			
			
			req.setAttribute("ybbsList", ybbsList);// 자바에서 화면으로 보내기 requst.setAttribute();
			req.setAttribute("pageGroupResult", pm.getPageGroupResult(Sql.YBBS_SELECT_ALL_COUNT));
			
			RequestDispatcher rd = req.getRequestDispatcher("boardList.jsp");
			rd.forward(req, resp);
		}
		
	}

}