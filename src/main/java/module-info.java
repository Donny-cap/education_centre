module com.example.education_centre {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.datatransfer;
    requires com.jfoenix;
    requires java.sql;


    opens com.education_centre to javafx.fxml;
    exports com.education_centre;
}