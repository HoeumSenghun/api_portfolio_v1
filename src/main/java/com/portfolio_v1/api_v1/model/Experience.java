package com.portfolio_v1.api_v1.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Experience {

    private UUID experienceId;
    private String companyName;
    private String position;
    private String location;
    private String description;
    private String startDate;
    private String endDate;
    private boolean isCurrent;
    private Integer shortOrder;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
