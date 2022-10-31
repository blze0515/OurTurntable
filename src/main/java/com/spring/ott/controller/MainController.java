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
	public String about(MultipartHttpServletRequest multipartHttpServletRequest,
			HttpServletRequest request) throws IOException {
		//FileUpload �삁�젣
		FileUtils fileUtils = new FileUtils();
		
		//�떎�젣 硫��떚�뙆�듃 �뙆�씪 由ъ뒪�듃
		List<MultipartFile> multipartFileList = fileUtils.parseFileInfo(multipartHttpServletRequest);
		
		//DB�뿉 ���옣�맆 �뙆�씪�젙蹂� 由ъ뒪�듃
//		List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();
		
		for(MultipartFile multipartFile : multipartFileList) {
			if(!multipartFile.isEmpty()) {
//				BoardFileVO boardFile = new BoardFileVO();
//				
//				boardFile.setBoardSeq(boardSeq);
//				boardFile.setOriginalFileName(multipartFile.getOriginalFilename());
//				String uuid = UUID.randomUUID().toString();
//				boardFile.setFileName(uuid + multipartFile.getOriginalFilename());
//				boardFile.setFilePath(rootPath + attachPath);
//				
//				boardFileList.add(boardFile);
				
				//�뙆�씪 �뾽濡쒕뱶 泥섎━�뒗 FileUtils�쓽 uploadFile硫붿냼�뱶 �궗�슜
				fileUtils.uploadFile(multipartFile, request);
			}
		}
		
		return "/WEB-INF/views/services";
	}


	
	
//	readBoardRankingList (�넫�뿭釉� �뒄 獄쏆룇   �땾  �삻 沅� /  �쟿 �뵠 �뱜  猷� �젎  �삻 沅�)
//	*  �삂 萸�( �쁽 �삂野껊슣�뻻 �솇) 筌�癒��쑎   肉�  踰� 鈺곌퀬�돳
//	* �빊遺우퓝 �삢 �꺖(�빊遺우퓝野껊슣�뻻 �솇) 筌�癒��쑎   肉�  踰� 鈺곌퀬�돳
}
   