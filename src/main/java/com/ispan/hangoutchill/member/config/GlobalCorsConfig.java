package com.ispan.hangoutchill.member.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class GlobalCorsConfig {

    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        config.addAllowedOrigin("https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5");
        config.addAllowedOrigin("*");
        config.setAllowCredentials(true);
        config.addAllowedMethod("OPTIONS");
        config.addAllowedMethod("HEAD");
        config.addAllowedMethod("GET");
        config.addAllowedMethod("PUT");
        config.addAllowedMethod("POST");
        config.addAllowedMethod("DELETE");
        config.addAllowedMethod("PATCH");

        config.addAllowedHeader("*");
        UrlBasedCorsConfigurationSource configSource = new
                UrlBasedCorsConfigurationSource();
        configSource.registerCorsConfiguration("/**", config);
        return new CorsFilter(configSource);
    }
}
