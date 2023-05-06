package com.ispan.hangoutchill.xdaiox.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.json.JSONObject;

import com.ispan.hangoutchill.xdaiox.dao.DiscussionsRepository;
import com.ispan.hangoutchill.xdaiox.dao.ImagesRepository;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Images;

@RestController
@RequestMapping("/upload")
public class restUploadController {

    @Autowired
    private ImagesRepository imageRepository;
    
    @Autowired
    private DiscussionsRepository dssRepository;

    @PostMapping("/image")
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file, @RequestParam("data") String data) {
        try {
            // 解析前端傳送過來的 JSON 字串
            JSONObject jsonObject = new JSONObject(data);
            String title = jsonObject.getString("title");
            String content = jsonObject.getString("content");
            System.out.println("========================================================intoController////intoController////intoController////intoController========================================================");

            // 將圖片資料轉換成 byte 陣列
            byte[] bytes = file.getBytes();

            // 將資料存入資料庫中
            Discussions discussion = new Discussions();
            discussion.setTitle(title);
            discussion.setContents(content);
            dssRepository.save(discussion);
            
            Images image = new Images();
            image.setImg_data(bytes);
            imageRepository.save(image);
            System.out.println("========================================================saveImagesaveImagesaveImagesaveImagesaveImage========================================================");
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}

