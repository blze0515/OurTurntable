package com.spring.ott.controller;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ott.service.board.BoardService;
import com.spring.ott.service.main.MainService;
import com.spring.ott.utils.FileUtils;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired MainService mainService;
	@Autowired BoardService boardService;
	
	@RequestMapping("/main.do")
	public String main() {
		return "/index";
	}
	
	@RequestMapping("/about.do")
	public String about(int boardSeq,MultipartHttpServletRequest multipartHttpServletRequest,
			HttpServletRequest request) throws IOException {
		//FileUpload 예제
		//FileUtils fileUtils = new FileUtils();
		
		//실제 멀티파트 파일 리스트
	///	List<MultipartFile> multipartFileList = fileUtils.parseFileInfo(boardSeq, request, multipartHttpServletRequest);
		
		//DB에 저장될 파일정보 리스트
//		List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();
		
//		for(MultipartFile multipartFile : multipartFileList) {
//			if(!multipartFile.isEmpty()) {
////				BoardFileVO boardFile = new BoardFileVO();
////				
////				boardFile.setBoardSeq(boardSeq);
////				boardFile.setOriginalFileName(multipartFile.getOriginalFilename());
////				String uuid = UUID.randomUUID().toString();
////				boardFile.setFileName(uuid + multipartFile.getOriginalFilename());
////				boardFile.setFilePath(rootPath + attachPath);
////				
////				boardFileList.add(boardFile);
//				
//				//파일 업로드 처리는 FileUtils의 uploadFile메소드 사용
//				///fileUtils.uploadFile(multipartFile, request);
//			}
//		}
		
		return "/WEB-INF/views/services";
	}


	
	
//	readBoardRankingList (醫뗭븘 슂 諛쏆   닔  옲 궧 /  젅 씠 듃  룊 젏  옲 궧)
//	*  옉 뭹( 옄 옉寃뚯떆 뙋) 罹먮윭   뿉  벝 議고쉶
//	* 異붿쿇 옣 냼(異붿쿇寃뚯떆 뙋) 罹먮윭   뿉  벝 議고쉶
}
   