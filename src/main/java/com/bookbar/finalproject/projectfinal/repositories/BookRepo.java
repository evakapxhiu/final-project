package com.bookbar.finalproject.projectfinal.repositories;

import com.bookbar.finalproject.projectfinal.models.Book;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepo extends CrudRepository<Book, Long> {

    List<Book> findAll();

}