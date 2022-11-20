package com.spring.ott.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//실제 서버에 파일 업로드 처리를 해주는 클래스
public class FileUtils {
	public List<Map<String, Object>> parseFileInfo(int boardSeq, HttpServletRequest request,
			MultipartHttpServletRequest multipartServletRequest) throws IOException {
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		
		//서버의 루트 경로 가져오기
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = rootPath + "/upload/";
		
		File directory = new File(attachPath);
		
		if(directory.exists() == false) {
			//서버 루트 경로에 upload 폴더 만들기
			directory.mkdir();
		}
		
		//첨부파일 목록 꺼내오기
		Iterator<String> iterator = multipartServletRequest.getFileNames();
		
		while(iterator.hasNext()) {
			//iterator에 담겨있는 파일이름들로 첨부파일 꺼내오기
			List<MultipartFile> list = multipartServletRequest.getFiles(iterator.next());
			
			for(MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
					Map<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("boardSeq", boardSeq);
					//화면에 표출할 때 사용
					fileMap.put("originalFileName", multipartFile.getOriginalFilename());
					
					//고유한 파일명 생성
					//실제 서버에 저장되는 파일명
					String uuid = UUID.randomUUID().toString();
					fileMap.put("fileName", uuid + multipartFile.getOriginalFilename());
					
					fileMap.put("filePath", attachPath);
					
					fileList.add(fileMap);
					
					//파일 업로드 처리
					File file = new File(attachPath + uuid + multipartFile.getOriginalFilename());
					
					multipartFile.transferTo(file);
				}
			}
		}
		
		return fileList;
	}
}
