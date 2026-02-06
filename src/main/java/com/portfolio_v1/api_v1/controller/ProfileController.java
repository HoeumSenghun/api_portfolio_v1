package com.portfolio_v1.api_v1.controller;


import com.portfolio_v1.api_v1.dto.response.ApiResponse;
import com.portfolio_v1.api_v1.model.Profile;
import com.portfolio_v1.api_v1.service.ProfileService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/v1/profile")
public class ProfileController {

    //store
    private final ProfileService profileService;
    //inject from service
    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }
    //get profile
    @GetMapping
    public ResponseEntity<ApiResponse<List<Profile>>> getProfile() {
        ApiResponse<List<Profile>> response = ApiResponse.builder()
                .message("")
                .status(HttpStatus.OK)
                .success(true)
                .payload(profileService.getProfile())
                .timestamp(LocalDateTime.now())
                .build();
        return ResponseEntity.ok(response);
    }


}
