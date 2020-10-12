package org.qq.office.service.impl;

import org.qq.office.mapper.OfficeMapper;
import org.qq.office.model.Document;
import org.qq.office.model.EditorConfig;
import org.qq.office.model.Office;
import org.qq.office.model.User;
import org.qq.office.service.OfficeService;
import org.qq.office.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileTime;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Service
public class OfficeServerImpl implements OfficeService {
    @Value("${docServer.api-url}")
    private String apiUrl;

    @Value("${fileServer.view-url}")
    private String viewUrl;

    @Value("${fileServer.save-url}")
    private String saveUrl;

    @Value("${fileServer.root-path}")
    private String rootPath;

    @Autowired
    private OfficeMapper officeMapper;

    @Override
    public Office selectById(String id) {
        return officeMapper.selectById(id);
    }

    @Override
    public List<Office> selectAll() {
        return officeMapper.selectAll();
    }

    @Override
    public int insertOffice(Office office) {
        return officeMapper.insertOffice(office);
    }

    @Override
    public ModelAndView openFile(String fileName, boolean createNew, boolean sample) {
        String fileExt = FileUtils.getExtension(fileName).replace(".", "");
        Path filePath = null;
        if (createNew) {
            try {
                fileName = createNewFile(fileExt, sample);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        filePath = Paths.get(rootPath, fileName);
        Office office = new Office();
        office.setId(UUID.randomUUID().toString());
        office.setUrl(filePath.toString());
        officeMapper.insertOffice(office);
        long lastModifyTime;
        try {
            FileTime fileTime = Files.getLastModifiedTime(filePath);
            lastModifyTime = fileTime.toMillis();
        } catch (IOException e) {
            lastModifyTime = System.currentTimeMillis();
        }
        Document doc = new Document();
        doc.setKey(lastModifyTime + "");
        doc.setFileType(fileExt);
        doc.setTitle(fileName);
        doc.setUrl(viewUrl + "/" + fileName);

        EditorConfig editorConfig = new EditorConfig();
        editorConfig.setCallbackUrl(saveUrl + "/" + fileName);
        editorConfig.setUser(new User(UUID.randomUUID().toString(), "user_" + new Random().nextInt(100)));
        ModelAndView mav = new ModelAndView("office");
        mav.addObject("doc", doc);
        mav.addObject("editorConfig", editorConfig);
        mav.addObject("apiUrl", apiUrl);
        mav.addObject("documentType", FileUtils.getFileType(fileName));
        return mav;
    }

    public String createNewFile(String fileExt, boolean sample) throws Exception {
        String demoName = (sample ? "sample." : "new.") + fileExt;
        String fileName = UUID.randomUUID().toString() + "." + fileExt;
        ClassPathResource classPathResource = new ClassPathResource("files/"+demoName);
        InputStream inputStream =classPathResource.getInputStream();
        InputStream stream = Thread.currentThread().getContextClassLoader().getResourceAsStream(demoName);
        File file = new File(rootPath, fileName);
        try (FileOutputStream out = new FileOutputStream(file)) {
            int read;
            final byte[] bytes = new byte[1024];
            while ((read = stream.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            out.flush();
        }
        return fileName;
    }
}
