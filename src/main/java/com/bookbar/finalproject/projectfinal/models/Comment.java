package com.bookbar.finalproject.projectfinal.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Table(name="comments")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Comment required")
    private String content;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User userCo;


    // Many Reviews to One Show
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="exercise_id")
    private ExercisesForum exerciseCo;
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    public Comment(){

    }

    public Comment(Long id, String content, User userCo, ExercisesForum exerciseCo, Date createdAt, Date updatedAt) {
        this.id = id;
        this.content = content;
        this.userCo = userCo;
        this.exerciseCo = exerciseCo;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public User getUserCo() {
        return userCo;
    }

    public void setUserCo(User userCo) {
        this.userCo = userCo;
    }

    public ExercisesForum getExerciseCo() {
        return exerciseCo;
    }

    public void setExerciseCo(ExercisesForum exerciseCo) {
        this.exerciseCo = exerciseCo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
