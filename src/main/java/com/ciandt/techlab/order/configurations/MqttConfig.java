package com.ciandt.techlab.order.configurations;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties("mqtt")
@Setter
@Getter
public class MqttConfig {

    @Autowired
    private MqttPushClient mqttPushClient;

    /**
     * Connection address
     */
    private String hostUrl;

    /**
     * Default connection topic
     */
    private String defaultTopic;

    /**
     * Default connection topic
     */
    private String clientId;

    @Bean
    public MqttPushClient getMqttPushClient() {
        mqttPushClient.connect(hostUrl, clientId, "", "", 0, 0);
        mqttPushClient.subscribe(defaultTopic, 0);
        return mqttPushClient;
    }
}