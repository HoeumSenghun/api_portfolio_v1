package com.portfolio_v1.api_v1.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {

    private Integer projectId;
    private String projectTitle;
    private String projectShortDescription;
    private String projectDescription;
    private String techStack;
    private String projectUrl;
    private String projectGithubUrl;
    private String projectImgUrl;
}
