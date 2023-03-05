package com.bookbar.finalproject.projectfinal.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Title required")
    @Size(min = 3, max = 25)
    @Column(unique = true)
    private String title;

    @Size(min = 5, max = 50)
    @Column(unique = true)
    private String schoolName;

    @NotBlank(message = "Author required")
    private String author;

    @NotBlank(message = "Notes required")
    private String notes;

    @NotBlank(message = "price details required")
    private String priceDetails;
    private double price;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
            name="saved",
            joinColumns = @JoinColumn(name="book_id"),
            inverseJoinColumns = @JoinColumn(name="user_id")
    )
    private List<User> savers;


    public Book() {

    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public Book(Long id, String title, String schoolName, String author, String notes, String priceDetails, double price, Date createdAt, Date updatedAt, User user, List<User> savers, String fileUpload) {
        this.id = id;
        this.title = title;
        this.schoolName = schoolName;
        this.author = author;
        this.notes = notes;
        this.priceDetails = priceDetails;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.user = user;
        this.savers = savers;
        this.fileUpload = fileUpload;
    }

    public List<User> getSavers() {
        return savers;
    }

    public void setSavers(List<User> savers) {
        this.savers = savers;
    }

    private String fileUpload= "";


    //For file/photo uploads.
    public Book(String title, String schoolName, String author, String notes, String priceDetails, double price, String fileUpload, User user){
        this.title = title;
        this.schoolName = schoolName;
        this.author = author;
        this.notes = notes;
        this.priceDetails = priceDetails;
        this.price = price;
        this.fileUpload = fileUpload;
        this.user=user;
}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(String fileUpload) {
        this.fileUpload = fileUpload;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getPriceDetails() {
        return priceDetails;
    }

    public void setPriceDetails(String priceDetails) {
        this.priceDetails = priceDetails;
    }

}
