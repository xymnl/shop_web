package com.example.shop.lib;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

public class ApiInfo {

	public ResponseEntity getRest(String url, Map<String, Object> params) throws Exception {
		StringBuilder builder = new StringBuilder();

		for (String value : params.keySet()) {
			if (builder.length() != 0)
				builder.append('&');
			builder.append(value + "=" + (String) params.get(value));
		}
		ResponseEntity response = new RestTemplate().getForEntity(url + "?" + builder, Object.class);
		return response;
	}


	public ResponseEntity postRest(String url, Map<String, Object> params) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();


		for (String value : params.keySet()) {
			if (value.equals("passwd")) {
				map.add(value, (String) params.get(value));
			} else {
				map.add(value, (String) params.get(value));
			}
		}

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		ResponseEntity response = new RestTemplate().postForEntity(url, request, Object.class);

		return response;
	}

}
