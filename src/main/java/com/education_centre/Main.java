package com.education_centre;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;

import java.util.Objects;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("sample.fxml")));
        primaryStage.setTitle("Educational Center");
        primaryStage.setScene(new Scene(root));
        primaryStage.show();
//        Image image = new Image("/sample/assets/logo.png");
//        primaryStage.getIcons().add(image);

    }


    public static void main(String[] args) {
        launch(args);
    }
}
