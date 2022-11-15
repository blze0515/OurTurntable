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
			//(첨부할 파일 이름 지정하는거라고 보면 맞나?)
			List<MultipartFile> list = multipartHttpServletRequest.getFiles(iterator.next());
			
			for(MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
					multipartFileList.add(multipartFile);
				}
			}
			
			//이 부분은 각 컨트롤러의 파일업로드하는 메소드에서 처리
			/*for(MultipartFile multipartFile : multipartFileList) {
				if(!multipartFile.isEmpty()) {
				//파일이 없을 때도 객체에 담겨오기 때문에 하나의 파일을 전송할 경우 isEmpty()로 파일이 넘어왔는지 확인 후 작업을 해야 한다.

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
//		 리네임과 동시에 파일객체 생성
//		 파일객체는 실제 경로로 지정해야 하기 때문에 realPath로 디렉토리를 설정하고, 두 번째 인자로 파일의 리네임을 정한다.
//		 단, 해당 디렉터리 경로가 없을 경우 자동적으로 생성하지 않기 때문에 없으면 mkdir()로 디렉터리부터 생성해야 한다.
		
		multipartFile.transferTo(file); //업로드 처리
	}
}
