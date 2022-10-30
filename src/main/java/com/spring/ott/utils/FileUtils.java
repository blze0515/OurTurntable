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

public class FileUtils {
	//서브밋된 폼에서 MultipartFile목록을 받아와서 List<MultipartFile>형태로 리턴하는 함수
	public List<MultipartFile> parseFileInfo(MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {
		List<MultipartFile> multipartFileList = new ArrayList<MultipartFile>();
		
		//톰캣 서버 루트 경로 가져오기
		//String rootPath = request.getSession().getServletContext().getRealPath("/");
		//파일업로드 폴더 만들기
		//String attachPath = "/upload/";
		
		//File directory = new File(rootPath + attachPath);
		
		//if(directory.exists() == false) {
		//	directory.mkdirs();
		//}
		
		//파일 이름 꺼내기
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		while(iterator.hasNext()) {
			//파일 이름으로 파일 객체 꺼내기
			List<MultipartFile> list = multipartHttpServletRequest.getFiles(iterator.next());
			
			for(MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
					multipartFileList.add(multipartFile);
				}
			}
			
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
	
	//파일 업로드 처리해주는 메소드
	public void uploadFile(MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		//톰캣 서버 루트 경로 가져오기
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		//파일업로드 폴더 만들기
		String attachPath = rootPath + "/upload/";
		
		File directory = new File(attachPath);
		
		if(directory.exists() == false) {
			directory.mkdirs();
		}
		
		String fileName = UUID.randomUUID().toString() + multipartFile.getOriginalFilename();
		
		File file = new File(attachPath + fileName);
		
		multipartFile.transferTo(file);
	}
}
