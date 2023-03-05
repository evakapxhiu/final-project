package com.bookbar.finalproject.projectfinal.controllers;

import com.bookbar.finalproject.projectfinal.models.*;
import com.bookbar.finalproject.projectfinal.services.BookService;
import com.bookbar.finalproject.projectfinal.services.FileService;
import com.bookbar.finalproject.projectfinal.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class BookController {
    @Autowired
    private UserService users;
    @Autowired
    private BookService books;


    @Autowired
    private FileService filesService;

    @GetMapping("/")
    public String home() {
        return "welcome";
    }

    @GetMapping("/aboutus")
    public String aboutus() {
        return "aboutus";
    }

    @GetMapping("/index")
    public String index(@ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin") User newLogin, Model model) {

        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, @NotNull BindingResult result, HttpSession session, Model model) {

        users.userRegister(newUser, result);

        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index";
        }

        session.setAttribute("userId", newUser.getId());

        return "redirect:/home";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
                        BindingResult result, Model model, HttpSession session) {

        User user = users.login(newLogin, result);

        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index";
        }
        session.setAttribute("userId", user.getId());

        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(Model model, HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        model.addAttribute("bookss", books.all());
        model.addAttribute("user", users.findById((Long) session.getAttribute("userId")));
        return "home";
    }
private static String UPLOADED_FOLDER="src/main/resources/static/img";
    @GetMapping("/addPage")
    public String addPage(@ModelAttribute("book") Book book, Model model, HttpSession session) {

        User user = users.findById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);

        return "addPage";
    }
//    @RequestParam("file")MultipartFile fileUpload
    @PostMapping("/books")
    public String createBook(@Valid @ModelAttribute("book") Book book, @RequestParam("file")MultipartFile file, @RequestParam("title") @Min(1) @Max(10) String title,
                             @RequestParam("schoolName") @Min(1) @Max(10) String schoolName,@RequestParam("author")  @Min(1) @Max(10) String author,@RequestParam("notes")  @Min(1) @Max(10)String notes,
                             @RequestParam("priceDetails")@NotNull String priceDetails,@RequestParam("price") double price,
                             @NotEmpty BindingResult result, RedirectAttributes redirectAttributes,HttpSession session,Model model) {
        Long userIds=(Long) session.getAttribute("userId");
        User userId=users.findById(userIds);
        if (result.hasErrors()) {
            return "addPage";
        }
        if (file.isEmpty()){
            redirectAttributes.addFlashAttribute("massage","field not empty");
            return "addPage";
        }
        try {
            byte[] bytes=file.getBytes();
            Path path= Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path,bytes);
            String fileUpload="/img/"+file.getOriginalFilename();
            books.upload(title,schoolName,author,notes,priceDetails,price,fileUpload,userId);

        }catch(IOException e){
            e.printStackTrace();
        }
//        book.setFileUpload(this.filesService.save(file));
//            books.create(book);
            return "redirect:/home";

    }



    @GetMapping("/books/{id}")
    public String showPage(Model model, @PathVariable("id") Long id, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        Book book = books.findById(id);
        model.addAttribute("book", book);
        model.addAttribute("user", users.findById((Long) session.getAttribute("userId")));


        return "book";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Book book = books.details(id);
        model.addAttribute("book", book);
        return "edit";
    }

    @PutMapping("/update/{id}")
    public String update(@Valid @ModelAttribute("book") Book book,@NotEmpty BindingResult result) {
//        Long userIds=(Long) session.getAttribute("userId");
//        User userId=users.findById(userIds);
        if (result.hasErrors()) {
            return "edit";
        }
//        if (file.isEmpty()){
//            redirectAttributes.addFlashAttribute("massage","field not empty");
//        }
//        try {
//            byte[] bytes=file.getBytes();
//            Path path= Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
//            Files.write(path,bytes);
//            String fileUpload="/img/"+file.getOriginalFilename();
//            books.upload(title,schoolName,author,notes,priceDetails,price,fileUpload,userId);
//                books.update(book);
//
//        }catch(IOException e){
//            e.printStackTrace();
//        }
        books.update(book);
        return "redirect:/books/{id}";
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        books.delete(id);
        return "redirect:/home";
    }

    @GetMapping("/save/{id}")
    public String save(HttpSession session,@PathVariable("id") Long id){
        User user = users.findById((Long) session.getAttribute("userId"));
        Book book=books.findById(id);
        books.savePost(user,book);
        return "redirect:/home";    }

    @GetMapping("/unsave/{id}")
    public String unlike(HttpSession session,@PathVariable("id") Long id){
        User user = users.findById((Long) session.getAttribute("userId"));
        Book book=books.findById(id);
        books.unsavePost(user,book);
        return "redirect:/home";    }

    @GetMapping("/savedBooks")
    public String savedB(Model model, HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        model.addAttribute("books", books.all());
        model.addAttribute("user", users.findById((Long) session.getAttribute("userId")));
        return "savedBooks";
    }

}
