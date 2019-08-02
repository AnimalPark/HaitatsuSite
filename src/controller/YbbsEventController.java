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

@WebServlet(name = "YbbsEventController", urlPatterns = { "/ybbs_eventList", "/ybbs_eventDetail.do", "/ybbs_delete_event",
		"/ybbs_go_to_insert_event.do", "/ybbs_insert_event", "/ybbs_event_update", "/ybbs_event_goTo_update" })

public class YbbsEventController extends HttpServlet {

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

		if (action.equals("ybbs_go_to_insert_event.do")) {

			RequestDispatcher rd = req.getRequestDispatcher("board/eventWritting.jsp");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_insert_event")) {

			Ybbs_Event ybbs = new Ybbs_Event();
			ybbs.setEvSubject(req.getParameter("evSubject"));
			ybbs.setEvComment(req.getParameter("evComment"));
			ybbs.setUserId(req.getParameter("userId"));

			Ybbs_EventDAO dao = new Ybbs_EventDAOImpl();
			dao.Insert(ybbs);

			req.setAttribute("ybbs", ybbs);
			RequestDispatcher rd = req.getRequestDispatcher("ybbs_eventList?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_eventList")) {

			List<Ybbs_Event> ybbsList = new ArrayList<Ybbs_Event>();
			Ybbs_EventDAO dao = new Ybbs_EventDAOImpl();

			int requestPage = Integer.parseInt(req.getParameter("reqPage"));

			PageManager pm = new PageManager(requestPage);

			ybbsList = dao.selectAllEvent(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());

			req.setAttribute("ybbsList", ybbsList);
			req.setAttribute("pageGroupResult", pm.getPageGroupResultEvent(Sql.YBBS_SELECT_ALL_EVENT_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("board/eventboard.jsp");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_eventDetail.do")) {

			Ybbs_Event ybbs = new Ybbs_Event();
			int evNumber = Integer.parseInt(req.getParameter("evNumber"));

			Ybbs_EventDAO dao = new Ybbs_EventDAOImpl();

			ybbs = dao.selectByNo(evNumber);
			dao.updateVisited(evNumber);

			req.setAttribute("ybbs", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("board/eventboardDetail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_delete_event")) {

			Ybbs_EventDAO dao = new Ybbs_EventDAOImpl();
			Ybbs_Event ybbs = new Ybbs_Event();
			ybbs.setEvNumber(Integer.parseInt(req.getParameter("evNumber")));

			int evNum = ybbs.getEvNumber();
			dao.delete(evNum);

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_eventList?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_event_update")) {

			Ybbs_Event ybbs = new Ybbs_Event();

			ybbs.setEvNumber(Integer.parseInt(req.getParameter("evNumber")));
			ybbs.setEvSubject(req.getParameter("evSubject"));
			ybbs.setEvComment(req.getParameter("evComment"));

			Ybbs_EventDAO dao = new Ybbs_EventDAOImpl();
			dao.update(ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("ybbs_eventList?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("ybbs_event_goTo_update")) {

			Ybbs_Event ybbs = new Ybbs_Event();
			int evNumber = Integer.parseInt(req.getParameter("evNumber"));
			Ybbs_EventDAO dao = new Ybbs_EventDAOImpl();

			ybbs = dao.selectByNo(evNumber);

			req.setAttribute("ybbs", ybbs);

			RequestDispatcher rd = req.getRequestDispatcher("board/eventboardUpdate.jsp");
			rd.forward(req, resp);

		}

	}
}