package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDao;
import book.BookData;
import book.BookOracle;

@WebServlet(name="Adress", urlPatterns="/book")
public class AdressBookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String action = request.getParameter("a");
		
		if ("form".equals(action)) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/adress/form.jsp");
			rd.forward(request, response);
		}	else if("delete".equals(action)) {
				Long no = Long.valueOf(request.getParameter("no"));
				
				BookDao dao = new BookOracle();
				dao.delete(no);
				
				response.sendRedirect(request.getContextPath() + "/book");
				
			
		}	else if ("search".equals(action)) {
			String keyword = request.getParameter("name");
			BookDao dao = new BookOracle();
			List<BookData>list = dao.search(keyword);
			request.setAttribute("list", list);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/adress/index.jsp");
			rd.forward(request, response);
			
		}	else {
				BookDao dao = new BookOracle();
				List<BookData>list = dao.getList();
				request.setAttribute("list", list);
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/adress/index.jsp");
				rd.forward(request, response);			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String action = request.getParameter("action");
		
		if("insert".equals(action)) {
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String tel = request.getParameter("tel");
			
			BookData data = new BookData();
			data.setName(name);
			data.setHp(hp);
			data.setTel(tel);
			
			BookDao dao = new BookOracle();
			dao.insert(data);
			
			response.sendRedirect(request.getContextPath() + "/book");
		}	else {
				doGet(request, response);
				
		}
		
		
	}

}
