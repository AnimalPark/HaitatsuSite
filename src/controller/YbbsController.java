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

import dao.Ybbs_QADAO;
import dao.Ybbs_QADAOImpl;
import model.Ybbs_QA;
import page.PageManager;
import sql.Sql;

@WebServlet(name = "YbbsController", urlPatterns = {"/ybbs_go_to_insert.do","/ybbs_insert","/ybbs_detail.do","/ybbs_delete","/ybbs_update",
		"/ybbs_reply.ad","/ybbs_reply_form.ad","/ybbs_QaList", "/ybbs_goTo_update", "/ybbs_delete_reply"})

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
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		if (action.equals("ybbs_go_to_insert.do")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardwriting.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_insert")) {

			Ybbs_QA ybbs = new Ybbs_QA();
			ybbs.setQaSubject(req.getParameter("qaSubject"));
			ybbs.setQaComment(req.getParameter("qaComment"));
			ybbs.setUserId(req.getParameter("userId"));

			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			dao.Insert(ybbs);
	
			resp.sendRedirect("ybbs_QaList?reqPage=1");

		}else if (action.equals("ybbs_detail.do")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			int qaNumber = Integer.parseInt(req.getParameter("qaNumber"));

			ybbs = dao.selectByNo(qaNumber);
			dao.updateVisited(qaNumber);		
			String ybbsId = dao.validChk(qaNumber);
			
			req.setAttribute("ybbs", ybbs);
			req.setAttribute("ybbsId", ybbsId);
			
			System.out.println(ybbsId);
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardDetail.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_delete")) {
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQaGroup(Integer.parseInt(req.getParameter("qaGroup")));
			
			dao.delete(ybbs.getQaGroup());
			
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_QaList?reqPage=1");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_delete_reply")) {
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQaNumber(Integer.parseInt(req.getParameter("qaNumber")));
			
			dao.deleteReply(ybbs.getQaNumber());
			
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_QaList?reqPage=1");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_update")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQaNumber(Integer.parseInt(req.getParameter("qaNumber")));
			ybbs.setQaSubject(req.getParameter("qaSubject"));
			ybbs.setQaComment(req.getParameter("qaComment"));
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			dao.update(ybbs);

			resp.sendRedirect("ybbs_QaList?reqPage=1");
			
		}  else if (action.equals("ybbs_reply.ad")) {
			
			Ybbs_QA ybbs = new Ybbs_QA();
			
			ybbs.setQaSubject(req.getParameter("qaSubject"));
			ybbs.setQaComment(req.getParameter("qaComment"));
			ybbs.setQaGroup(Integer.parseInt(req.getParameter("qaGroup")));
			ybbs.setUserId(req.getParameter("userId"));
			
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			
			dao.insertReply(ybbs);
			
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_QaList?reqPage=1");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_reply_form.ad")) {
			
			int qaNumber = Integer.parseInt(req.getParameter("qaNumber"));
			
			req.setAttribute("num", qaNumber);
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardReply.jsp");
			rd.forward(req, resp);
			
		} else if (action.equals("ybbs_QaList")) {
			
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			PageManager pm = new PageManager(requestPage);

			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			
			List<Ybbs_QA> ybbsList = new ArrayList<Ybbs_QA>();

			ybbsList = dao.selectAll(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());
			
			session.setAttribute("caller", "/ybbs_QaList?reqPage=1");
			req.setAttribute("ybbsList", ybbsList);
			req.setAttribute("pageGroupResult", pm.getPageGroupResult(Sql.YBBS_SELECT_ALL_COUNT));
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboard.jsp");
			rd.forward(req, resp);
		
		}else if (action.equals("ybbs_goTo_update")) {
			
			int num = Integer.parseInt(req.getParameter("qaNumber"));
			
			Ybbs_QA ybbs = new Ybbs_QA();
			Ybbs_QADAO dao = new Ybbs_QADAOImpl();
			
			ybbs = dao.selectByNo(num);
			
			req.setAttribute("ybbs", ybbs);
			
			RequestDispatcher rd = req.getRequestDispatcher("board/qaboardUpdate.jsp");
			rd.forward(req, resp);
		
		} 	
	}
}