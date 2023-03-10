package com.bookbar.finalproject.projectfinal.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;


@Entity
@Table(name="users")
public class User  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Username is required!")
    @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
    private String username;

    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    private String password;

    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
    private String confirm;
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private List<ExercisesForum> exercises;


    @ManyToMany
    @JoinTable(
            name="likes",
            joinColumns = @JoinColumn(name="user_id"),
            inverseJoinColumns = @JoinColumn(name="exercise_id")
    )
    private List<ExercisesForum> postedLiked;

    @ManyToMany
    @JoinTable(
            name="saved",
            joinColumns = @JoinColumn(name="user_id"),
            inverseJoinColumns = @JoinColumn(name="book_id")
    )
    private List<Book> savedB;
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Book> books;

    @OneToMany(mappedBy = "userCo", fetch = FetchType.LAZY)
    private List<Comment> comments;


    public User() {

    }


    public User(Long id, String username, String email, String password, String confirm, Date createdAt, Date updatedAt, List<ExercisesForum> exercises, List<ExercisesForum> postedLiked, List<Book> savedB, List<Book> books, List<Comment> comments) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.confirm = confirm;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.exercises = exercises;
        this.postedLiked = postedLiked;
        this.savedB = savedB;
        this.books = books;
        this.comments = comments;
    }

    public List<Book> getSavedB() {
        return savedB;
    }

    public void setSavedB(List<Book> savedB) {
        this.savedB = savedB;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
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

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public List<ExercisesForum> getExercises() {
        return exercises;
    }

    public void setExercises(List<ExercisesForum> exercises) {
        this.exercises = exercises;
    }

    public List<ExercisesForum> getPostedLiked() {
        return postedLiked;
    }

    public void setPostedLiked(List<ExercisesForum> postedLiked) {
        this.postedLiked = postedLiked;
    }


    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}