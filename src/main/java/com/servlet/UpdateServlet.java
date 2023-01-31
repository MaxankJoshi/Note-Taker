package com.servlet;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entities.Note;
import com.Helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int note_Id = Integer.parseInt(request.getParameter("note_id").trim());
			
			SessionFactory factory = FactoryProvider.getFactory();
			
			Session s = factory.openSession();
			
			Transaction tx = s.beginTransaction();
			
			Note note = s.get(Note.class, note_Id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
		} 
		
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
