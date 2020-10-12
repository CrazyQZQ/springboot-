package org.qq.office.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.qq.office.model.Office;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface OfficeMapper {
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
