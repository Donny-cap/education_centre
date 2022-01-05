package com.education_centre;

import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Objects;
import java.util.ResourceBundle;

public class LibrarianController11 implements Initializable {

    @FXML
    private AnchorPane background;

    @FXML
    private Button exit;

    @FXML
    private AnchorPane info;

    @FXML
    private TextField search_stud;

    @FXML
    private TextField search_teach;

    @FXML
    private TableColumn<Students_TookBook, String> stud_author;

    @FXML
    private TableColumn<Students_TookBook, String> stud_author1;

    @FXML
    private TableColumn<Students_TookBook, String> stud_book;

    @FXML
    private TableColumn<Students_TookBook, String> stud_book1;

    @FXML
    private TableColumn<Students_TookBook, String> stud_date;

    @FXML
    private TableColumn<Students_TookBook, String> stud_date1;

    @FXML
    private TableColumn<Students_TookBook, String> stud_lname;

    @FXML
    private TableColumn<Students_TookBook, String> stud_lname1;

    @FXML
    private TableColumn<Students_TookBook, String> stud_name;

    @FXML
    private TableColumn<Students_TookBook, String> stud_name1;

    @FXML
    private TableColumn<Students_TookBook, String> stud_num;

    @FXML
    private TableColumn<Students_TookBook, String> stud_num1;

    @FXML
    private AnchorPane students_anch;

    @FXML
    private AnchorPane studentsbooks;

    @FXML
    private TableView<Students_TookBook> table_studets;

    @FXML
    private TableView<Students_TookBook> table_studets_search;

    @FXML
    private TableView<Teachers_TookBook> table_teachers;

    @FXML
    private TableView<Teachers_TookBook> table_teachers_search;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_author;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_author1;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_book;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_book1;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_fname;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_fname1;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_lname;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_lname1;

    @FXML
    private TableColumn<Teachers_TookBook, Integer> teach_num;

    @FXML
    private TableColumn<Teachers_TookBook, Integer> teach_num1;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_orderdate;

    @FXML
    private TableColumn<Teachers_TookBook, String> teach_orderdate1;

    @FXML
    private AnchorPane teachers_anch;

    @FXML
    private AnchorPane teachersbooks;

    @FXML
    void StudentsBooks(ActionEvent event) {
        background.setVisible(false);
        students_anch.setVisible(false);
        teachersbooks.setVisible(false);
        teachers_anch.setVisible(false);
        info.setVisible(false);
        studentsbooks.setVisible(true);
    }

    @FXML
    void TeachersBook(ActionEvent event) {
        background.setVisible(false);
        students_anch.setVisible(false);
        studentsbooks.setVisible(false);
        teachers_anch.setVisible(false);
        info.setVisible(false);
        teachersbooks.setVisible(true);

    }

    @FXML
    void getSelected_teacher(MouseEvent event) {

    }

    @FXML
    void info(ActionEvent event) {
        background.setVisible(false);
        students_anch.setVisible(false);
        studentsbooks.setVisible(false);
        teachersbooks.setVisible(false);
        teachers_anch.setVisible(false);
        info.setVisible(true);
    }

    @FXML
    void showStudents(ActionEvent event) {
        background.setVisible(false);
        studentsbooks.setVisible(false);
        teachersbooks.setVisible(false);
        teachers_anch.setVisible(false);
        info.setVisible(false);
        students_anch.setVisible(true);

        try {
            UpdateTableStudents();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void showTeachers(ActionEvent event) {
        background.setVisible(false);
        students_anch.setVisible(false);
        studentsbooks.setVisible(false);
        teachersbooks.setVisible(false);
        info.setVisible(false);
        teachers_anch.setVisible(true);

        try {
            UpdateTableTeachers();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void changeScene(ActionEvent event) throws IOException {
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("sample.fxml")));
        Stage stage = new Stage();
        Scene scene = new Scene(root);
        stage.setTitle("Educational Center");
        stage.setScene(scene);
        stage.show();
        exit.getScene().getWindow().hide();
    }


    ObservableList<Students_TookBook> listS;
    ObservableList<Teachers_TookBook> listT;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            search_student();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            search_teacher();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void UpdateTableStudents() throws Exception {
        stud_num.setCellValueFactory(new PropertyValueFactory<>("num"));
        stud_name.setCellValueFactory(new PropertyValueFactory<>("first_name"));
        stud_lname.setCellValueFactory(new PropertyValueFactory<>("last_name"));
        stud_author.setCellValueFactory(new PropertyValueFactory<>("author"));
        stud_book.setCellValueFactory(new PropertyValueFactory<>("book"));
        stud_date.setCellValueFactory(new PropertyValueFactory<>("date_of_took"));


        listS = DataBaseHandler.getDataStudents();
        table_studets.setItems(listS);
    }

    public void UpdateTableTeachers() throws Exception {
        teach_num.setCellValueFactory(new PropertyValueFactory<>("num"));
        teach_fname.setCellValueFactory(new PropertyValueFactory<>("first_name"));
        teach_lname.setCellValueFactory(new PropertyValueFactory<>("last_name"));
        teach_author.setCellValueFactory(new PropertyValueFactory<>("author"));
        teach_book.setCellValueFactory(new PropertyValueFactory<>("book"));
        teach_orderdate.setCellValueFactory(new PropertyValueFactory<>("date_of_took"));


        listT = DataBaseHandler.getDataTeachers();
        table_teachers.setItems(listT);
    }

    @FXML
    void search_student() throws SQLException {
        stud_num1.setCellValueFactory(new PropertyValueFactory<>("num"));
        stud_name1.setCellValueFactory(new PropertyValueFactory<>("first_name"));
        stud_lname1.setCellValueFactory(new PropertyValueFactory<>("last_name"));
        stud_author1.setCellValueFactory(new PropertyValueFactory<>("author"));
        stud_book1.setCellValueFactory(new PropertyValueFactory<>("book"));
        stud_date1.setCellValueFactory(new PropertyValueFactory<>("date_of_took"));


        listS = DataBaseHandler.getDataStudents();
        table_studets_search.setItems(listS);

        FilteredList<Students_TookBook> filteredData = new FilteredList<>(listS, b -> true);
        search_stud.textProperty().addListener((observable, oldValue, newValue) -> filteredData.setPredicate(Students_TookBook -> {
            if (newValue == null || newValue.isEmpty()) {
                return true;
            }
            String lowerCaseFilter = newValue.toLowerCase();

            if (String.valueOf(Students_TookBook.getNum()).contains(lowerCaseFilter)) {
                return true;
            } else if (Students_TookBook.getFirst_name().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else if (Students_TookBook.getLast_name().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else if (Students_TookBook.getAuthor().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else if (Students_TookBook.getBook().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else return Students_TookBook.getDate_of_took().toLowerCase().contains(lowerCaseFilter);
        }));
        SortedList<Students_TookBook> sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(table_studets_search.comparatorProperty());
        table_studets_search.setItems(sortedData);
    }

    @FXML
    void search_teacher() throws SQLException {
        teach_num1.setCellValueFactory(new PropertyValueFactory<>("num"));
        teach_fname1.setCellValueFactory(new PropertyValueFactory<>("first_name"));
        teach_lname1.setCellValueFactory(new PropertyValueFactory<>("last_name"));
        teach_author1.setCellValueFactory(new PropertyValueFactory<>("author"));
        teach_book1.setCellValueFactory(new PropertyValueFactory<>("book"));
        teach_orderdate1.setCellValueFactory(new PropertyValueFactory<>("date_of_took"));


        listT = DataBaseHandler.getDataTeachers();
        table_teachers_search.setItems(listT);

        FilteredList<Teachers_TookBook> filteredData1 = new FilteredList<>(listT, b -> true);
        search_teach.textProperty().addListener((observable, oldValue, newValue) -> filteredData1.setPredicate(Teachers_TookBook -> {
            if (newValue == null || newValue.isEmpty()) {
                return true;
            }
            String lowerCaseFilter = newValue.toLowerCase();

            if (String.valueOf(Teachers_TookBook.getNum()).contains(lowerCaseFilter)) {
                return true;
            } else if (Teachers_TookBook.getFirst_name().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else if (Teachers_TookBook.getLast_name().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else if (Teachers_TookBook.getAuthor().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else if (Teachers_TookBook.getBook().toLowerCase().contains(lowerCaseFilter)) {
                return true;
            } else return Teachers_TookBook.getDate_of_took().toLowerCase().contains(lowerCaseFilter);
        }));
        SortedList<Teachers_TookBook> sortedData1 = new SortedList<>(filteredData1);
        sortedData1.comparatorProperty().bind(table_teachers_search.comparatorProperty());
        table_teachers_search.setItems(sortedData1);
    }

}
