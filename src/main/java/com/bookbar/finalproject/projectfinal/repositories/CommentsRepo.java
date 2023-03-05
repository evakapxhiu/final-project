package com.bookbar.finalproject.projectfinal.repositories;

import com.bookbar.finalproject.projectfinal.models.Comment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentsRepo extends CrudRepository<Comment,Long> {

List<Comment> findAll();
}
