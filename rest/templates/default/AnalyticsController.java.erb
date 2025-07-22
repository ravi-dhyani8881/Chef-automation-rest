package com.spring.rest.controller;

import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.rest.service.EndpointStatsService;

@RestController
@RequestMapping("/analytics")
public class AnalyticsController {

    @Autowired
    private EndpointStatsService statsService;

//    @GetMapping("/endpoints")
//    public Map<String, Integer> getEndpointStats() {
//    	
//        Map<String, Integer> stats = statsService.getStats();
//
//    	
//        return statsService.getStats();
//    }
    
    
    @GetMapping(value = "/endpoints", produces = MediaType.TEXT_PLAIN_VALUE)
    public String getFormattedEndpointStats() {
        Map<String, Integer> stats = statsService.getStats();
        return stats.entrySet().stream()
                .map(entry -> entry.getKey() + ": " + entry.getValue())
                .collect(Collectors.joining("\n"));
    }
    
}
