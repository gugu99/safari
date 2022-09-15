package com.gd.safari;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@ServletComponentScan
@PropertySource("classpath:my.properties")
public class SafariApplication {

	public static void main(String[] args) {
		SpringApplication.run(SafariApplication.class, args);
	}

}