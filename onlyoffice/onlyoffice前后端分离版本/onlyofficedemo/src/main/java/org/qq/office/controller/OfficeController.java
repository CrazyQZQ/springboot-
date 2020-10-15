package org.qq.office.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileTime;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.qq.office.model.*;
import org.qq.office.service.OfficeService;
import org.qq.office.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.HttpResource;

@Api(tags = "office")
@RestController
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
     * 获取documentServer地址
     * @return
     */
    @GetMapping("/serverUrl")
    @ApiOperation("获取documentServer地址")
    public AjaxResult getDocumentServerUrl() {
        return new AjaxResult(HttpStatus.SUCCESS,"success",apiUrl);
    }

    /**
     * @param filename 文件名
     * @throws IOException
     */
    @GetMapping("/view")
    @ApiOperation("打开本地文件")
    @ApiImplicitParam(name = "filename", value = "文件名", required = false)
    public AjaxResult view(String filename) {
        Map<String, Object> stringObjectMap = officeService.openFile(filename, true, true);
        return new AjaxResult(HttpStatus.SUCCESS,"success",stringObjectMap);
    }

    /**
     * @param filename 文件名
     * @throws IOException
     */
    @GetMapping("/create")
    @ApiOperation("创建文件")
    @ApiImplicitParam(name = "filename", value = "文件名", required = false)
    public AjaxResult create(String filename) {
        filename = filename == null ? "new.docx" : filename;
        Map<String, Object> stringObjectMap = officeService.openFile(filename, true, true);
        return new AjaxResult(HttpStatus.SUCCESS,"success",stringObjectMap);
    }



}
