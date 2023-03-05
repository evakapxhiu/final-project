package com.bookbar.finalproject.projectfinal;

import com.bookbar.finalproject.projectfinal.services.FileService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import javax.annotation.Resource;

@SpringBootApplication
public class ProjectFinalApplication implements CommandLineRunner {
    @Resource
    private FileService filesService;
    public static void main(String[] args) {
        SpringApplication.run(ProjectFinalApplication.class, args);
    }

    @Bean
    public FileService fileService() {
        return new FileService();
    }




    @Override
    public void run (String... arg) throws Exception{
        filesService.init();
    }


}
