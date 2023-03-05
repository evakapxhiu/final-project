package com.bookbar.finalproject.projectfinal.services;

import com.bookbar.finalproject.projectfinal.models.Book;
import com.bookbar.finalproject.projectfinal.models.ExercisesForum;
import com.bookbar.finalproject.projectfinal.models.SavedPosts;
import com.bookbar.finalproject.projectfinal.models.User;
import com.bookbar.finalproject.projectfinal.repositories.BookRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookRepo bookRepo;

    public Book findById(Long id) {

        return this.bookRepo.findById(id).orElse(null);
    }
public void upload( String title, String schoolName, String author, String notes, String priceDetails, double price,  String fileUpload,User user) {
        Book newBook=new Book(title,schoolName,author,notes,priceDetails,price,fileUpload,user);
        bookRepo.save(newBook);
}

    public List<Book> all() {
        return bookRepo.findAll();
    }

    public Book create(Book book) {
        return bookRepo.save(book);
    }

    public Book details(Long id) {
        return this.bookRepo.findById(id).orElse(null);
    }

    public Book update(Book book) {
        return bookRepo.save(book);
    }


    public void delete(Long id) {
        bookRepo.deleteById(id);
    }

    public void savePost(User user, Book book){
        List<User> savers=book.getSavers();
        savers.add(user);
        bookRepo.save(book);
    }
    public void unsavePost(User user,Book book){
        List<User> savers=  book.getSavers();
        savers.remove(user);
        bookRepo.save(book);
    }



}


