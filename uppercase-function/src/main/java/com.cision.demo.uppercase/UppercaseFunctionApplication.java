package com.cision.demo.uppercase;

import java.util.UUID;
import java.util.function.Function;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.function.cloudevent.CloudEventMessageBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.Message;

@SpringBootApplication
@Slf4j
public class UppercaseFunctionApplication {

	public static void main(String[] args) {
		SpringApplication.run(UppercaseFunctionApplication.class, args);
	}

	@Bean
	public Function<Message<String>, Message<String>> uppercase() {
		return message -> {
			log.info("Input message:" + message);
			Message<String> response = CloudEventMessageBuilder
					.withData(message.getPayload().toUpperCase())
					.setId(UUID.randomUUID().toString())
					.setType("sometype")
					.build();
			log.info("Output message:" + response);
			return response;
		};
	}

}
