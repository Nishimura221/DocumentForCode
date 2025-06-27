/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProjectDAO;
import model.ProjectDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProjectController", urlPatterns = {"/ProjectController"})
public class ProjectController extends HttpServlet {

    ProjectDAO dao = new ProjectDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "welcome2.jsp"; // ✅ Đổi file giao diện đúng

        try {
            String action = request.getParameter("action");
            if (action == null || action.isEmpty()) {
                action = "listProject";
            }
            if ("listProject".equals(action)) {
                url = handleListProjects(request);
            } else if ("addProject".equals(action)) {
                url = handleAddProject(request, response);
            }
        } catch (Exception e) {
        } finally {
            if (url != null) {
                request.getRequestDispatcher(url).forward(request, response);
            }
        }
    }

    private String handleListProjects(HttpServletRequest request) {
        List<ProjectDTO> list = dao.getAll();
        request.setAttribute("projectList", list);
        return "welcome2.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Project Controller";
    }

    private String handleAddProject(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String projectName = request.getParameter("projectName");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String estimatedLaunchStr = request.getParameter("estimatedLaunch");

        try {
            java.sql.Date estimatedLaunch = java.sql.Date.valueOf(estimatedLaunchStr);

            if (!dao.isEstimatedLaunchValid(estimatedLaunch)) {
                request.setAttribute("error", "Estimated launch date must be today or in the future!");
                return "projectForm.jsp";
            }

            ProjectDTO newProject = new ProjectDTO(0, projectName, description, status, estimatedLaunch);
            boolean success = dao.create(newProject);

            if (success) {
                
                response.sendRedirect("ProjectController?action=listProject");
                return null;
            } else {
                request.setAttribute("error", "Failed to create project. Please try again.");
                return "projectForm.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid data format or system error.");
            return "projectForm.jsp";
        }
    }

}
