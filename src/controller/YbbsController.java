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

import dao.Ybbs_EventDAO;
import dao.Ybbs_EventDAOImpl;
import dao.Ybbs_QADAO;
import dao.Ybbs_QADAOImpl;
import model.Ybbs_Event;
import model.Ybbs_QA;
import page.PageManager;
import sql.Sql;

@WebServlet(name = "YbbsController", urlPatterns = {"/ybbs_go_to_insert","/ybbs_insert","/ybbs_detail","/ybbs_delete","/ybbs_update","/ybbs_reply","/ybbs_reply_form",
		"/ybbs_req_list"})

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

		if (action.equals("ybbs_go_to_insert")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardwriting.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_insert")) {

			Ybbs_QA ybbs = new Ybbs_QA();
			ybbs.setQasubject(req.getParameter("qasubject"));
			ybbs.setQacomment(req.getParameter("qacomment"));
			ybbs.setUserid(req.getParameter("userid"));

			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			dao.Insert(ybbs);
			
			req.setAttribute("ybbs", ybbs);
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_req_list?reqPage=1");
			rd.forward(req, resp);

		}else if (action.equals("ybbs_detail")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			int qanumber = Integer.parseInt(req.getParameter("qanumber"));
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			
			ybbs = dao.selectByNo(qanumber);
			dao.updateVisited(qanumber);
			
			req.setAttribute("ybbs", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardDetail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_delete")) {
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			Ybbs_QA ybbs = new Ybbs_QA();
			ybbs.setQanumber(Integer.parseInt(req.getParameter("qanumber")));
			
			dao.delete(ybbs.getQanumber());

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_req_list?reqPage=1");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_update")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQanumber(Integer.parseInt(req.getParameter("qanumber")));
			ybbs.setQasubject(req.getParameter("qasubject"));
			ybbs.setQacomment(req.getParameter("qacomment"));
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			dao.update(ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_req_list?reqPage=1");
			rd.forward(req, resp);
			
		}  else if (action.equals("ybbs_reply")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQasubject(req.getParameter("qasubject"));
			ybbs.setQacomment(req.getParameter("qacomment"));
			ybbs.setQagroup(Integer.parseInt(req.getParameter("qagroup")));
			ybbs.setUserid(req.getParameter("userid"));
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			
			dao.insertReply(ybbs);
			
			
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_req_list?reqPage=1");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_reply_form")) {
			
			int num = Integer.parseInt(req.getParameter("qanumber"));
			String id = req.getParameter("userid");
			
			req.setAttribute("num", num);
			req.setAttribute("userid", id);
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardReply.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_req_list")) {
			
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			PageManager pm = new PageManager(requestPage);

			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			
			List<Ybbs_QA> ybbsList = new ArrayList<Ybbs_QA>();

			ybbsList = dao.selectAll(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());
			
			req.setAttribute("ybbsList", ybbsList);
			req.setAttribute("pageGroupResult", pm.getPageGroupResult(Sql.YBBS_SELECT_ALL_COUNT));
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboard.jsp");
			rd.forward(req, resp);
		
		}
	}
}