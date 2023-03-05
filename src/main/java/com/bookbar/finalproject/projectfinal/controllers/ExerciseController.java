package com.bookbar.finalproject.projectfinal.controllers;

import com.bookbar.finalproject.projectfinal.models.Book;
import com.bookbar.finalproject.projectfinal.models.Comment;
import com.bookbar.finalproject.projectfinal.models.ExercisesForum;
import com.bookbar.finalproject.projectfinal.models.User;
import com.bookbar.finalproject.projectfinal.services.CommentsService;
import com.bookbar.finalproject.projectfinal.services.ExerciseService;
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
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class ExerciseController {
    @Autowired
    private ExerciseService exServ;
    @Autowired
    private UserService userServ;

    @Autowired
    private CommentsService coServ;

    @GetMapping("/forum")
    public String home(@ModelAttribute("comment") Comment comment,Model model, HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        model.addAttribute("exercise", exServ.all());
        model.addAttribute("user", userServ.findById((Long) session.getAttribute("userId")));


        return "forum";
    }
    @GetMapping("/exercise/{id}")
    public String showPage(Model model,
                           @ModelAttribute("comment") Comment comment,
                           @PathVariable("id") Long id, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        ExercisesForum exercise= exServ.findById(id);
        model.addAttribute("exercise", exercise);
        model.addAttribute("user", userServ.findById((Long) session.getAttribute("userId")));


        return "details";
    }
    @PostMapping("/forum/comment")
    public String comment(@ModelAttribute("comment") Comment comment){
        exServ.createComment(comment);
        return "redirect:/forum";
    }

//    private static String UPLOADED_FOLDER="src/main/resources/static/img";
    @GetMapping("/newPost")
    public String addPage(@ModelAttribute("exercise")ExercisesForum exercise, Model model, HttpSession session) {

        User user = userServ.findById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);

        return "newPost";
    }
//    @RequestParam("file") MultipartFile file,
//    @RequestParam("text") String text,@RequestParam("subject")
//    String subject,@RequestParam("thoughts") String thoughts,
    @PostMapping("/newPost")
    public String createBook(@Valid @ModelAttribute("exercise") ExercisesForum exercise,
                             @NotEmpty BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) {
//        Long userIds=(Long) session.getAttribute("userId");
//        User userId=userServ.findById(userIds);
        if (result.hasErrors()) {
            return "newPost";
        }
//        if (file.isEmpty()){
//            redirectAttributes.addFlashAttribute("massage","field not empty");
//        }
//        try {
//            byte[] bytes=file.getBytes();
//            Path path= Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
//            Files.write(path,bytes);
//            String fileUrl="/img/"+file.getOriginalFilename();
//            exServ.uploadF(text,subject,thoughts,userId,fileUrl);
//        }catch(IOException e){
//            e.printStackTrace();
//        }
        exServ.create(exercise);

        return "redirect:/forum";
    }

    @GetMapping("/editEx/{id}")
    public String edit(@PathVariable Long id, Model model) {
       ExercisesForum exercise= exServ.details(id);
        model.addAttribute("exercise", exercise);
        return "editEx";
    }

    @PutMapping("/updateEx/{id}")
    public String update(@PathVariable Long id, @Valid @ModelAttribute("exercise") ExercisesForum exercise, @NotNull BindingResult results) {
        if (results.hasErrors()) {
            return "editEx";
        }
        exServ.update(exercise);
        return "redirect:/forum";
    }

    @DeleteMapping("/deleteEx/{id}")
    public String delete(@PathVariable Long id) {
        exServ.delete(id);
        return "redirect:/forum";
    }
    @GetMapping("/like/{id}")
    public String like(HttpSession session,@PathVariable("id") Long id){
        User user = userServ.findById((Long) session.getAttribute("userId"));
        ExercisesForum exercise=exServ.findById(id);
        exServ.likePost(user,exercise);
        return "redirect:/forum";    }

    @GetMapping("/unlike/{id}")
    public String unlike(HttpSession session,@PathVariable("id") Long id){
        User user = userServ.findById((Long) session.getAttribute("userId"));
        ExercisesForum exercise=exServ.findById(id);
        exServ.unlikePost(user,exercise);
        return "redirect:/forum";    }


}
