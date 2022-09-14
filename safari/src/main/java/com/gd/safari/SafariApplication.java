package com.gd.safari;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class SafariApplication {

	public static void main(String[] args) {
		SpringApplication.run(SafariApplication.class, args);
	}

}
