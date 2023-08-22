package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.db.Quizs;

import com.db.Questions;

public class CreateDao {

    public static boolean insertQuiz(Quizs quiz) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO quiz (id,title, category) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, quiz.getId());
            pst.setString(2, quiz.getQuizTitle());
            pst.setString(3, quiz.getCategory());
            
            int val = pst.executeUpdate();
            if (val > 0) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    

    public static ArrayList<Quizs> getAllQuizzes() {
        ArrayList<Quizs> quizzesList = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM quiz";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Quizs quiz = new Quizs();
                quiz.setId(rs.getInt("id"));
                quiz.setQuizTitle(rs.getString("title"));
                quiz.setCategory(rs.getString("category"));
                quizzesList.add(quiz);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quizzesList;
    }
    

    public static int updateQuiz(int OriginalId, int newId,String title,String category) {
    	int status = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE quiz SET title=?, category=? where id=?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, newId);
        pst.setString(2, title);
        pst.setString(3, category);
        
        

        int val = pst.executeUpdate();
		if(val > 0)
		{
			status = 1;
		}
		else
		{
			status = -1;
		}
		}
		catch(Exception f)
		{
			status = 2;
			f.printStackTrace();
		}
		
	    
		return status;
}
    public static int deleteQuiz(Quizs q) {
    	int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM quiz WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, q.getId());

            int val = pst.executeUpdate();
    	    if(val > 0)
    	    {
    	    	status =1;
    	    }
    	    else
    	    {
    	    	status = 0;
    	    }
    		
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    		
    		return status;
    }
    public static Quizs getQuizById(int quizId) {
        Quizs quiz = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM quiz WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, quizId);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                quiz = new Quizs();
                quiz.setId(rs.getInt("id"));
                quiz.setQuizTitle(rs.getString("title"));
                quiz.setCategory(rs.getString("category"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quiz;
    }

    // Method to get questions for a specific quiz based on its ID
    public static ArrayList<Questions> getQuestionsByQuizId(int quizId) {
        ArrayList<Questions> questionsList = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM questiontable WHERE question=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, quizId);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Questions question = new Questions();
               
                question.setQuestion(rs.getString("question"));
                question.setA(rs.getString("A"));
                question.setB(rs.getString("B"));
                question.setC(rs.getString("C"));
                question.setD(rs.getString("D"));
                question.setAnswer(rs.getString("answer"));
                questionsList.add(question);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questionsList;
    }
}


    

    // Other methods for updating and deleting questions can be added as needed.

