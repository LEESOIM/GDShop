package com.shop.goodee.item;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	public int setAdd(ItemVO itemVO) throws Exception {
		int result = itemMapper.setAdd(itemVO);

		// 저장할 폴더의 정보를 가지는 자바 객체 생성
		File file = new File(path);

		// 폴더가 존재하지 않는다면 디렉토리를 만들어라
		if (!file.exists()) {
			file.mkdirs();
		}

		for (MultipartFile f : itemVO.getFiles()) {
			if(!f.isEmpty()) {
				log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡfileName : {}", f.getOriginalFilename()); // 파일이름을 String 값으로 반환
				String fileName = fileManager.saveFile(f, path);
				ItemFileVO itemFileVO = new ItemFileVO();
				itemFileVO.setFileName(fileName);
				itemFileVO.setOriName(f.getOriginalFilename());
				itemFileVO.setItemNum(itemVO.getItemNum());
				itemMapper.setAddFile(itemFileVO);
				log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡqnaFileVO : {}", itemFileVO);
			}
		}
		return result;
	}

	public List<ItemVO> getList() throws Exception {
		return itemMapper.getList();
	}
}
