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
import java.util.Date;

public class ProjectDAO {

    private static final String GET_ALL_PROJECT = "SELECT project_id, project_name, Description, Status, estimated_launch FROM tblStartupProjects";
    private static final String GET_PROJECT_BY_ID = "SELECT project_id, project_name, Description, Status, estimated_launch FROM tblStartupProjects WHERE project_id = ?";
    private static final String CREATE_PROJECT = "INSERT INTO tblStartupProjects(project_name, Description, Status, estimated_launch) VALUES(?, ?, ?, ?)";
    private static final String UPDATE_PROJECT = "UPDATE tblStartupProjects SET project_name = ?, Description=?, Status=?, estimated_launch=? WHERE project_id = ?";

    public List<ProjectDTO> getAll() {
        List<ProjectDTO> projects = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(GET_ALL_PROJECT);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProjectDTO project = new ProjectDTO();
                project.setProjectId(rs.getInt("project_id"));
                project.setProjectName(rs.getString("project_name"));
                project.setDescription(rs.getString("Description"));
                project.setStatus(rs.getString("Status"));
                project.setEstimatedLaunch(rs.getDate("estimated_launch"));

                projects.add(project);
            }
        } catch (Exception e) {
            System.out.println("Error in getAll(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResource(conn, ps, rs);
        }
        return projects;
    }

    public ProjectDTO getProjectByID(String id) {
        ProjectDTO project = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(GET_PROJECT_BY_ID);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                project = new ProjectDTO();
                project.setProjectId(rs.getInt("project_id"));
                project.setProjectName(rs.getString("project_name"));
                project.setDescription(rs.getString("Description"));
                project.setStatus(rs.getString("Status"));
                project.setEstimatedLaunch(rs.getDate("estimated_launch"));
            }

        } catch (Exception e) {
            System.err.println("Error in getProjectByID(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResource(conn, ps, rs);
        }
        return project;
    }

    public boolean isProjectExists(String id) {
        return getProjectByID(id) != null;
    }

    public boolean isEstimatedLaunchValid(Date estimatedLaunch) {
        Date today = new Date();
        return !estimatedLaunch.before(today); 
    }

    public boolean create(ProjectDTO project) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;
        try {
            conn = DbUtils.getConnection();
            ps = conn.prepareStatement(CREATE_PROJECT);
            ps.setString(1, project.getProjectName());
            ps.setString(2, project.getDescription());
            ps.setString(3, project.getStatus());
            java.sql.Date sqlDate = new java.sql.Date(project.getEstimatedLaunch().getTime());
            ps.setDate(4, sqlDate);

            success = ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println("Error in create(): " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResource(conn, ps, null);
        }
        return success;
    }

    private void closeResource(Connection conn, PreparedStatement ps, ResultSet rs) {
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
} 


