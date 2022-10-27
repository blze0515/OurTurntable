package com.spring.ott.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtils<T> {
	public List<MultipartFile> parseFileInfo(int boardSeq, HttpServletRequest request,
			MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {
		List<MultipartFile> multipartFileList = new ArrayList<MultipartFile>();
		
		//톰캣 서버 루트 경로 가져오기
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		//파일업로드 폴더 만들기
		String attachPath = "/upload/";
		System.out.println("path=============================================" + rootPath + attachPath);
		File directory = new File(rootPath + attachPath);
		
		if(directory.exists() == false) {
			directory.mkdirs();
		}
		
		//파일 이름 꺼내기
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		while(iterator.hasNext()) {
			//파일 이름으로 파일 객체 꺼내기
			multipartFileList = multipartHttpServletRequest.getFiles(iterator.next());
			
			//이 부분은 각 컨트롤러의 파일업로드하는 메소드에서 처리 
			/*for(MultipartFile multipartFile : multipartFileList) {
				if(!multipartFile.isEmpty()) {
					BoardFileVO boardFile = new BoardFileVO();
					
					boardFile.setBoardSeq(boardSeq);
					boardFile.setOriginalFileName(multipartFile.getOriginalFilename());
					String uuid = UUID.randomUUID().toString();
					boardFile.setFileName(uuid + multipartFile.getOriginalFilename());
					boardFile.setFilePath(rootPath + attachPath);
					
					fileList.add(boardFile);
					
					File file = new File(rootPath + attachPath + uuid + multipartFile.getOriginalFilename());
					
					multipartFile.transferTo(file);
				}
			}*/
		}
		return multipartFileList;
	}
}
