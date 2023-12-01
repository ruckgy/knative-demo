package com.cision.demo.reverse;

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
public class ReverseFunctionApplication {
	public static void main(String[] args) {
		SpringApplication.run(ReverseFunctionApplication.class, args);
	}
	@Bean
	public Function<Message<String>, Message<String>> reverse() {
		return message -> {
			log.info("Input message:" + message);
			String input = message.getPayload();
			String reversed = new StringBuilder(input).reverse().toString();
			Message<String> response = CloudEventMessageBuilder
					.withData(reversed)
					.setType("uppercase")
					.setId(UUID.randomUUID().toString())
					.build();
			log.info("Output message:" + response);
			return response;
		};
	}

}
