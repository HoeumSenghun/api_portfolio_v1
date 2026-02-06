package com.portfolio_v1.api_v1.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Profile {

    private UUID profileId;
    private String fullName;
    private String profileTitle;
    private String summary;
    private String email;
    private String githubUrl;
    private String linkedinUrl;
    private String websiteUrl;
}
