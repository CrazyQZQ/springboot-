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
     * @param filename 文件名
     * @throws IOException
     */
    @RequestMapping("/view")
    public ModelAndView view(String filename) {
        return officeService.openFile(filename, false, false);
    }

    /**
     * @param filename 文件名
     * @throws IOException
     */
    @RequestMapping("/create")
    public ModelAndView create(String filename) {
        filename = filename == null ? "new.docx" : filename;
        return officeService.openFile(filename, true, true);
    }

}
