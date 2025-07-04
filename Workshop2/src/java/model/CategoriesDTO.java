/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author huy25
 */
import java.util.List;
public class CategoriesDTO {
    private int category_id;
    private String category_name;
    private String description;
    private List<ExamsDTO> examList;

    public CategoriesDTO() {
    }

    public CategoriesDTO(int category_id, String category_name, String description) {
        this.category_id = category_id;
        this.category_name = category_name;
        this.description = description;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<ExamsDTO> getExamList() {
        return examList;
    }

    public void setExamList(List<ExamsDTO> examList) {
        this.examList = examList;
    }
    
}
