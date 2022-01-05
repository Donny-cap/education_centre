package com.education_centre;

public class Students_TookBook {
    int num;
    String first_name, last_name, author, book, date_of_took;

    public Students_TookBook(int num, String first_name, String last_name, String author, String book, String date_of_took) {
        this.num = num;
        this.first_name = first_name;
        this.last_name = last_name;
        this.author = author;
        this.book = book;
        this.date_of_took = date_of_took;
    }

    public int getNum() {
        return num;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getAuthor() {
        return author;
    }

    public String getBook() {
        return book;
    }

    public String getDate_of_took() {
        return date_of_took;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setBook(String book) {
        this.book = book;
    }

    public void setDate_of_took(String date_of_took) {
        this.date_of_took = date_of_took;
    }
}
