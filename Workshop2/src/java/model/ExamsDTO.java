/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author huy25
 */
public class ExamsDTO {
    private int exam_id;
    private String exam_title;
    private String Subject;
    private int category_id;
    private int total_marks;
    private int Duration;

    public ExamsDTO() {
    }

    public ExamsDTO(int exam_id, String exam_title, String Subject, int category_id, int total_marks, int Duration) {
        this.exam_id = exam_id;
        this.exam_title = exam_title;
        this.Subject = Subject;
        this.category_id = category_id;
        this.total_marks = total_marks;
        this.Duration = Duration;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getExam_title() {
        return exam_title;
    }

    public void setExam_title(String exam_title) {
        this.exam_title = exam_title;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getTotal_marks() {
        return total_marks;
    }

    public void setTotal_marks(int total_marks) {
        this.total_marks = total_marks;
    }

    public int getDuration() {
        return Duration;
    }

    public void setDuration(int Duration) {
        this.Duration = Duration;
    }
    
}
