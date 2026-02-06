package com.portfolio_v1.api_v1.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Education {

    private UUID educationId;
    private String institution;
    private String degree;
    private UUID field;
    private String startYear;
    private String endYear;
    private String description;
    private Integer shortOrder;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
