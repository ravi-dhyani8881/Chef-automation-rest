package com.spring.rest.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

@Service
public class EndpointStatsService {

    private final Map<String, AtomicInteger> endpointCallCount = new ConcurrentHashMap<>();

    public void recordCall(String uri, String method) {
        String key = method + " " + uri;
        endpointCallCount.putIfAbsent(key, new AtomicInteger(0));
        endpointCallCount.get(key).incrementAndGet();
    }

    public Map<String, Integer> getStats() {
        return endpointCallCount.entrySet().stream()
                .collect(Collectors.toMap(Map.Entry::getKey, e -> e.getValue().get()));
    }
}
