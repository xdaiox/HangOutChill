package com.ispan.hangoutchill.xdaiox.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonRawValue;
import com.ispan.hangoutchill.xdaiox.dao.DiscussionsRepository;
import com.ispan.hangoutchill.xdaiox.dao.ImagesRepository;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Images;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;

@RestController
@RequestMapping("/upload/image")
public class RestImageController {

    @Autowired
    private ImagesRepository imageRepository;
    
    @Autowired
    private DiscussionsRepository dssRepository;
    
//    @Autowired
//    private DiscussionsService dService;
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file) {
        try {

            // 將圖片資料轉換成 byte 陣列
            byte[] bytes = file.getBytes();

            // 將圖片存入資料庫中
            Images image = new Images();
            image.setImg_data(bytes);
            Images Map = imageRepository.save(image);
            
            String imageUrl = "http://localhost:8080/hangoutchill/discussion/upload/image/" + Map.getI_id();
            
            Map<String,String> response = new HashMap<>();
            response.put("url", imageUrl);
            return ResponseEntity.ok().body(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    

}

