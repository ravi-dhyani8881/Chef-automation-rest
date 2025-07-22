package com.spring.rest;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.spring.rest.service.EndpointStatsService;

@Component
public class ApiAnalyticsFilter extends OncePerRequestFilter {

    @Autowired
    private EndpointStatsService endpointStatsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String uri = request.getRequestURI();
        String method = request.getMethod();

        endpointStatsService.recordCall(uri, method);

        filterChain.doFilter(request, response);
    }
}