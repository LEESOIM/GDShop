package com.shop.goodee.item;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.goodee.member.MemberVO;
import com.shop.goodee.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ItemService {

	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private FileManager fileManager;

	@Value("${app.item}") // C:/gdshop/item/
	private String path;
	
	//상품요청 승인,거절
	public int setDelRequest(ItemVO itemVO)throws Exception{
		return itemMapper.setDelRequest(itemVO);
	}
	
	public int setRequest(ItemVO itemVO)throws Exception{
		return itemMapper.setRequest(itemVO);
	}
	

	// 상품등록
	public int setAdd(ItemVO itemVO) throws Exception {
		int result = itemMapper.setAdd(itemVO);

//		String realPath = session.getServletContext().getRealPath("/static/upload/qna/");

		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}

		for (MultipartFile f : itemVO.getFiles()) {
			log.info("getFiles()ㅡㅡㅡㅡ : {}", f);
			if (!f.isEmpty()) {
				log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡfileName : {}", f.getOriginalFilename());
				String fileName = fileManager.saveFile(f, path);
				ItemFileVO itemFileVO = new ItemFileVO();
				itemFileVO.setFileName(fileName);
				itemFileVO.setOriName(f.getOriginalFilename());
				itemFileVO.setItemNum(itemVO.getItemNum());
				itemMapper.setAddFile(itemFileVO);
			}
		}
		return result;
	}

	// 상품수정
	public int setUpdate(ItemVO itemVO) throws Exception {
		int result = itemMapper.setUpdate(itemVO);

		if (result < 1) {
			return result;
		}

		if (itemVO.getFiles() != null) {
			for (MultipartFile f : itemVO.getFiles()) {
				if (!f.isEmpty()) {
					String fileName = fileManager.saveFile(f, path);
					ItemFileVO itemFileVO = new ItemFileVO();
					itemFileVO.setFileName(fileName);
					itemFileVO.setOriName(f.getOriginalFilename());
					itemFileVO.setItemNum(itemVO.getItemNum());
					itemMapper.setAddFile(itemFileVO);
				}
			}
		}
		return result;
	}

	// 상품수정시 파일삭제
	public int setFileDelete(ItemFileVO itemFileVO) throws Exception {
		// 우선 파일정보를 가져온다
		itemFileVO = itemMapper.getFileDetail(itemFileVO);
		// db 먼저 삭제
		int result = itemMapper.setFileDelete(itemFileVO);
		// db 삭제 후 hdd 파일 삭제
		if (result > 0) {
			File file = new File(path, itemFileVO.getFileName());
			file.delete();
		}
		return result;
	}

	// 상품삭제요청
	public int setStatusDel(ItemVO itemVO) throws Exception {
		return itemMapper.setStatusDel(itemVO);
	}

	public ItemVO getDetail(ItemVO itemVO) throws Exception {
		return itemMapper.getDetail(itemVO);
	}

	public List<ItemVO> getList() throws Exception {
		return itemMapper.getList();
	}

	public List<ItemVO> getListHit() throws Exception {
		return itemMapper.getListHit();
	}

	public List<ItemVO> getListVIP() throws Exception {
		return itemMapper.getListVIP();
	}
	
	public List<ItemVO> getListSuccess() throws Exception {
		return itemMapper.getListSuccess();
	}

	public List<ItemVO> getList1() throws Exception {
		return itemMapper.getList1();
	}

	public List<ItemVO> getList2() throws Exception {
		return itemMapper.getList2();
	}

	public List<ItemVO> getList3() throws Exception {
		return itemMapper.getList3();
	}

	public List<ItemVO> getList4() throws Exception {
		return itemMapper.getList4();
	}
}
