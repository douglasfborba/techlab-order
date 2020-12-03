package com.ciandt.techlab.order.entrypoints.controllers;

import com.ciandt.techlab.order.configurations.MqttPushClient;
import com.ciandt.techlab.order.entrypoints.controllers.dto.RequestMqttDTO;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/mqtt")
public class MqttController {

    private final static String MQTT_TOPIC = "techlab_sapphire_cd_2020";
    private final MqttPushClient mqttPushClient;

    @PostMapping("/alive")
    public ResponseEntity<String> isAlive(@RequestBody final RequestMqttDTO requestMqttDTO) {
        mqttPushClient.publish(0, false, MQTT_TOPIC, requestMqttDTO.getMessage());
        return ResponseEntity.status(HttpStatus.OK).body("ok");
    }
}
