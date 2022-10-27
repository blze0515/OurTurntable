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
		
		//��Ĺ ���� ��Ʈ ��� ��������
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		//���Ͼ��ε� ���� �����
		String attachPath = "/upload/";
		System.out.println("path=============================================" + rootPath + attachPath);
		File directory = new File(rootPath + attachPath);
		
		if(directory.exists() == false) {
			directory.mkdirs();
		}
		
		//���� �̸� ������
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		while(iterator.hasNext()) {
			//���� �̸����� ���� ��ü ������
			multipartFileList = multipartHttpServletRequest.getFiles(iterator.next());
			
			//�� �κ��� �� ��Ʈ�ѷ��� ���Ͼ��ε��ϴ� �޼ҵ忡�� ó�� 
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