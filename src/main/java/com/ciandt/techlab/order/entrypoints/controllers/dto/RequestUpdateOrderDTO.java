package com.ciandt.techlab.order.entrypoints.controllers.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class RequestUpdateOrderDTO {

    @NotBlank
    private String operator;

    @NotBlank
    private String description;

    @DecimalMin(value = "0.00")
    @DecimalMax(value = "100000.00")
    private BigDecimal discount;
}
