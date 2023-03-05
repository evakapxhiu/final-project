package com.bookbar.finalproject.projectfinal.models;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="exercises")
public class ExercisesForum {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "text required")
    @Size(min = 3, max = 500)
    @Column(unique = true)
    private String text;

    @Size(min = 3, max = 500)
    @NotBlank(message = "Subject required")
    private String subject;

    @Size(min = 3, max = 500)
    @NotBlank(message = "Thoughts required")
    private String thoughts;

    @Column(updatable = false)
    private Date createdAt;
    private Date updatedAt;

    private String fileUrl;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    @OneToMany(cascade=CascadeType.REMOVE, mappedBy="exerciseCo", fetch = FetchType.LAZY)
    private List<Comment> comments;
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
            name="likes",
            joinColumns = @JoinColumn(name="exercise_id"),
            inverseJoinColumns = @JoinColumn(name="user_id")
    )
    private List<User> likers;
    public ExercisesForum(){

    }


    public ExercisesForum(Long id, String text, String subject, String thoughts, Date createdAt, Date updatedAt,  User user, String fileUrl,List<Comment> comments, List<User> likers) {
        this.id = id;
        this.text = text;
        this.subject = subject;
        this.thoughts = thoughts;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.user = user;
        this.fileUrl = fileUrl;
        this.comments = comments;
        this.likers = likers;
    }

    public ExercisesForum(String text, String subject, String thoughts, User user, String fileUrl) {
        this.text = text;
        this.subject = subject;
        this.thoughts = thoughts;
        this.user = user;
        this.fileUrl=fileUrl;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getThoughts() {
        return thoughts;
    }

    public void setThoughts(String thoughts) {
        this.thoughts = thoughts;
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

    public List<User> getLikers() {
        return likers;
    }

    public void setLikers(List<User> likers) {
        this.likers = likers;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
