package com.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entities.Note;
import com.Helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int note_Id = Integer.parseInt(request.getParameter("note_id").trim());
			
			SessionFactory factory = FactoryProvider.getFactory();
			
			Session s = factory.openSession();
			
			Note note =  s.get(Note.class, note_Id);
			
			Transaction tx = s.beginTransaction();
			s.delete(note);
			
			tx.commit();
			
			s.close();
			
			response.sendRedirect("all_notes.jsp");
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
