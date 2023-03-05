package com.bookbar.finalproject.projectfinal.services;

import com.bookbar.finalproject.projectfinal.models.Book;
import com.bookbar.finalproject.projectfinal.models.Comment;
import com.bookbar.finalproject.projectfinal.models.ExercisesForum;
import com.bookbar.finalproject.projectfinal.models.User;
import com.bookbar.finalproject.projectfinal.repositories.CommentsRepo;
import com.bookbar.finalproject.projectfinal.repositories.ExerciseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciseService {

    @Autowired
    private ExerciseRepo exerciseRepo;
    @Autowired
    private CommentsRepo coRepo;

//    public void uploadF(String text, String subject, String thoughts, User user,String fileUrl){
//        ExercisesForum exercises=new ExercisesForum(text,subject,thoughts,user,fileUrl);
//    }
    public ExercisesForum findById(Long id) {

        return this.exerciseRepo.findById(id).orElse(null);
    }

    public List<ExercisesForum> all() {
        return exerciseRepo.findAll();
    }

    public ExercisesForum create(ExercisesForum exercises) {
        return exerciseRepo.save(exercises);
    }

    public ExercisesForum details(Long id) {
        return this.exerciseRepo.findById(id).orElse(null);
    }

    public ExercisesForum update(ExercisesForum exircises) {
        return exerciseRepo.save(exircises);
    }

    public void delete(Long id) {
        exerciseRepo.deleteById(id);
    }

    public void likePost(User user,ExercisesForum exercise){
        List<User> userwhoLiked=exercise.getLikers();
        userwhoLiked.add(user);
        exerciseRepo.save(exercise);
    }
    public void unlikePost(User user,ExercisesForum exercise){
        List<User> userwhoLiked=exercise.getLikers();
        userwhoLiked.remove(user);
        exerciseRepo.save(exercise);
    }

    public Comment createComment(Comment comment) {
        return coRepo.save(comment);
    }

    public void uploadF( String text, String subject, String thoughts, User user,String fileUrl) {
        ExercisesForum newExercise=new ExercisesForum(text,subject,thoughts,user,fileUrl);
        exerciseRepo.save(newExercise);
    }


}
