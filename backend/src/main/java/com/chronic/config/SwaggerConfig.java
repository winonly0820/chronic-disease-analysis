package com.chronic.config;

import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

/**
 * Swagger配置类
 *
 * @author chronic
 */
@Configuration
@EnableSwagger2WebMvc
public class SwaggerConfig {

    // Knife4j自动配置，无需额外配置
}
