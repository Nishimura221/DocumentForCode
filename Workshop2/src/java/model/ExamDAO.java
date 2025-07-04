/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DbUtils;

public class ExamDAO {

    private static final String GET_ALL_EXAM = "SELECT category_id, exam_title, subject, total_marks, duration FROM tblExams";
    private static final String GET_EXAM_BY_ID = "SELECT category_id, exam_title, subject, total_marks, duration FROM tblExams WHERE category_id = ?";
    

    private void closeResourses(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        } catch (Exception e) {
            System.err.println("Error closing resources: " + e.getMessage());
            e.printStackTrace();
        }

    }

    public List<ExamsDTO> getExamByCategories(int id){
        List<ExamsDTO> exams = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(GET_EXAM_BY_ID);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ExamsDTO exam = new ExamsDTO();
                exam.setCategory_id(rs.getInt("category_id"));
                exam.setExam_title(rs.getString("exam_title"));
                exam.setSubject(rs.getString("subject"));
                exam.setTotal_marks(rs.getInt("total_marks"));
                exam.setDuration(rs.getInt("duration"));

                exams.add(exam);
            }

        } catch (Exception e) {
            System.err.println("Error in getAll(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResourses(conn, ps, rs);
        }
        return exams;
    }



}
