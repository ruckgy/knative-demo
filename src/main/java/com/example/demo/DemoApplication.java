package com.example.demo;

import io.cloudevents.spring.messaging.CloudEventMessageConverter;
import java.util.UUID;
import java.util.function.Function;
import lombok.extern.slf4j.Slf4j;
import org.springframework.aot.hint.annotation.RegisterReflectionForBinding;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.function.cloudevent.CloudEventMessageBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.Message;

@SpringBootApplication
@Slf4j
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
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

//	@Bean
//	public Function<Message<String>, Message<String>> uppercase() {
//		return message -> {
//			log.info("Input message:" + message);
//			Message<String> response = CloudEventMessageBuilder
//					.withData(message.getPayload().toUpperCase())
//					.setId(UUID.randomUUID().toString())
//					.build();
//			log.info("Output message:" + response);
//			return response;
//		};
//	}

}
