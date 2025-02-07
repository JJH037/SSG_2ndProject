package com.exam;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"com.dao", "com.exam.mapper"})  // 여러 패키지 지정
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        
        System.out.println("DemoApplication");
    }
}