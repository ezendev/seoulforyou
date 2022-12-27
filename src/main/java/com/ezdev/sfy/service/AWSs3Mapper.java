package com.ezdev.sfy.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.UUID;

import org.omg.CORBA.portable.InputStream;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;

@Service
public class AWSs3Mapper {
	public String AccessKey ="AKIAWCQHWP4YGA7V3TDU";//accessKey
	public String SecretKey ="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";//secretKey
	public String bucket_name = "ezdev-sfy"; //bucket_name
	
	
	AWSCredentials credentials = new BasicAWSCredentials(AccessKey, SecretKey);
	AmazonS3 s3 = new AmazonS3Client(credentials);
	
	public void uploadFile(String file_name, File target) {
        try {
        	// 파일 업로드 부분 파일 이름과 경로를 동시에 넣어줌.
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucket_name, file_name, target);
            putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // URL 접근시 권한 읽을수 있도록 설정.
            s3.putObject(putObjectRequest);
            System.out.println("Uploadinf OK");
   
            
       } catch (AmazonServiceException ase) {
           ase.printStackTrace();
       } catch (AmazonClientException ace) {
           ace.printStackTrace();
       }
	}
	
	public void deleteFile(String file_name) {
		try {
			s3.deleteObject(bucket_name, file_name);
		} catch (AmazonServiceException ase) {
	           ase.printStackTrace();
	    } catch (AmazonClientException ace) {
	           ace.printStackTrace();
	    }
	}
	
	
}

