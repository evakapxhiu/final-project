package com.bookbar.finalproject.projectfinal.repositories;

import com.bookbar.finalproject.projectfinal.models.ExercisesForum;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExerciseRepo extends CrudRepository<ExercisesForum, Long> {

    List<ExercisesForum> findAll();

}