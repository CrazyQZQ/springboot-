package com.example.securitydb.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/10 14:40
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${CROS_ALLOWED_ORIGINS}")
    private String[] allowedOrigins;

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins(allowedOrigins)
                .allowedMethods("*")
                .allowedHeaders("*");
    }
}
