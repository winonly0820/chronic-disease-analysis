package com.chronic;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 慢性病分析系统启动类
 *
 * @author chronic
 */
@SpringBootApplication
@MapperScan("com.chronic.mapper")
public class ChronicDiseaseApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChronicDiseaseApplication.class, args);
        System.out.println("====================================");
        System.out.println("  慢性病分析系统启动成功！");
        System.out.println("  API文档地址: http://localhost:8080/doc.html");
        System.out.println("====================================");
    }
}
