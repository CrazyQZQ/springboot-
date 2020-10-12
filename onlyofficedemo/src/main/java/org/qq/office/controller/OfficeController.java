package org.qq.office.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileTime;
import java.util.Random;
import java.util.UUID;

import org.qq.office.model.Document;
import org.qq.office.model.EditorConfig;
import org.qq.office.model.Office;
import org.qq.office.model.User;
import org.qq.office.service.OfficeService;
import org.qq.office.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/office")
public class OfficeController {
	
	@Value("${docServer.api-url}")
	private String apiUrl;

	@Value("${fileServer.view-url}")
    private String viewUrl;
	
	@Value("${fileServer.save-url}")
	private String saveUrl;
	
	@Value("${fileServer.root-path}")
	private String rootPath;

	@Autowired
	private OfficeService officeService;
	
	/**
	 * 
	 * @param filename			文件名
	 * @throws IOException 
	 */
	@RequestMapping
	public ModelAndView office(String filename){
		Path filePath = Paths.get(rootPath, filename);
		Office office = new Office();
		office.setId(UUID.randomUUID().toString());
		office.setUrl(filePath.toString());
		officeService.insertOffice(office);
		long lastModifyTime;
		try {
			FileTime fileTime = Files.getLastModifiedTime(filePath);
			lastModifyTime = fileTime.toMillis();
		} catch (IOException e) {
			lastModifyTime = System.currentTimeMillis();
		}
		Document doc = new Document();
		doc.setKey(lastModifyTime + "");
		doc.setFileType(FileUtils.getExtension(filename).replace(".", ""));
		doc.setTitle(filename);
		doc.setUrl(viewUrl + "/" + filename);
		
		EditorConfig editorConfig = new EditorConfig();
		editorConfig.setCallbackUrl(saveUrl + "/" + filename);
		editorConfig.setUser(new User(UUID.randomUUID().toString(),"user_" + new Random().nextInt(100)));
		
		ModelAndView mav = new ModelAndView("office");
		mav.addObject("doc", doc);
		mav.addObject("editorConfig", editorConfig);
		mav.addObject("apiUrl", apiUrl);
		mav.addObject("documentType", FileUtils.getFileType(filename));
		return mav;
	}
	
}
