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
		
		//첨부파일 목록 꺼내오기(iterator로 파일 이름을 하나씩 꺼내온다)
		Iterator<String> iterator = multipartServletRequest.getFileNames();
		
		while(iterator.hasNext()) {
			//iterator로 첨부파일 순서대로 꺼내오기
			List<MultipartFile> list = multipartServletRequest.getFiles(iterator.next());
			
			//향상된 for문 / list(multipartFile타입)순서대로 가져온 파일들)를 하나씩 꺼내서 multipartFile에 쓴다
			for(MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
//					메서드 선언부에 있는 List의 타입인 Map을 아래에서 만든다. = fileMap이 사용자가 등록할 파일의 정보를 담고있다.
					Map<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("boardSeq", boardSeq);
					//화면에 표출할 때 사용
					fileMap.put("originalFileName", multipartFile.getOriginalFilename());
					//고유한 파일명 생성
					//실제 서버에 저장되는 파일명
					String uuid = UUID.randomUUID().toString();
					fileMap.put("fileName", uuid + multipartFile.getOriginalFilename());
					
					fileMap.put("filePath", attachPath);
					
//					fileList에 fileMap을 넣는다.(List에 순서대로 한 행마다 fileMap이 하나씩 들어간다.)
					fileList.add(fileMap);
					
					//파일 업로드 처리
					//경로 + random으로 생성된 이름(uuid) + 실제 파일(multipartFile)의 오리지널 이름
					File file = new File(attachPath + uuid + multipartFile.getOriginalFilename());
					
					//실제 파일(multipartFile)을 file로 보낸다?(transferTo(file))
					multipartFile.transferTo(file);
				}
			}
		}
		
		return fileList;
	}
}
