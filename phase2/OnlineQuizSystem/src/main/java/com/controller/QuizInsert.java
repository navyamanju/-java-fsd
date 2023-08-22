package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.db.Quizs;
import com.model.CreateDao;

/**
 * Servlet implementation class QuizInsert
 */
@WebServlet("/QuizInsert")
public class QuizInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 int quizId = Integer.parseInt(request.getParameter("quizId"));
		String quizTitle = request.getParameter("quizTitle");
	        String category = request.getParameter("category");

	        // Create a new Quizs object and set its properties
	        Quizs quiz = new Quizs();
	        quiz.setId(quizId);
	        quiz.setQuizTitle(quizTitle);
	        quiz.setCategory(category);

	        // Save the quiz details to the database using CreateDao
	        if (CreateDao.insertQuiz(quiz))
	        {
	        	
	            response.sendRedirect("quizinsert.jsp?status=success");
	        } 
	        else 
	        {
	            response.sendRedirect("quizinsert.jsp?status=fail");
            }
            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
