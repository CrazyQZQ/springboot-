package org.qq.office.service;

import org.qq.office.model.Office;

import java.util.List;

public interface OfficeService {
    /**
     * 根据id查询
     * @return
     */
    public Office selectById(String id);

    /**
     * 查询全部
     * @return
     */
    public List<Office> selectAll();

    /**
     * 新增
     * @param office
     * @return
     */
    public int insertOffice(Office office);
}
