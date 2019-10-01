package com.ejo.petwalk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class AwsS3Service {

    private String bucketName = "scitpet";

    @Autowired
	AmazonS3 s3Client;
	
	public void uploadObject(MultipartFile multipartFile, String file_sav) {

		ObjectMetadata omd = new ObjectMetadata();
		omd.setContentType(multipartFile.getContentType());
		omd.setContentLength(multipartFile.getSize());
		omd.setHeader("filename", multipartFile.getOriginalFilename());
		
		try {
			s3Client.putObject(new PutObjectRequest(bucketName, file_sav,
					multipartFile.getInputStream(), omd));
		
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}

	
	public void deleteObject(String foldername, String file_sav){
		s3Client.deleteObject(new DeleteObjectRequest(bucketName + "/" + foldername, file_sav));
	}
//
//	public Resource getObject(String date, String storedFileName) throws IOException {
//		S3Object o = s3Client.getObject(new GetObjectRequest(bucketName + "/" + date, storedFileName));
//		S3ObjectInputStream objectInputStream = o.getObjectContent();
//		byte[] bytes = IOUtils.toByteArray(objectInputStream);
//		
//		Resource resource = new ByteArrayResource(bytes);
//		return resource;
//	}
	
}