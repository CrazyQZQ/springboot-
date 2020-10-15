package org.qq.office.service;

import org.qq.office.model.Office;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

public interface OfficeService {
    /**
     * 根据id查询
     *
     * @return
     */
    public Office selectById(String id);

    /**
     * 查询全部
     *
     * @return
     */
    public List<Office> selectAll();

    /**
     * 新增
     *
     * @param office
     * @return
     */
    public int insertOffice(Office office);

    /**
     * 打开文件
     *
     * @param fileName
     * @return
     */
    public Map<String,Object> openFile(String fileName, boolean createNew, boolean sample);
}
