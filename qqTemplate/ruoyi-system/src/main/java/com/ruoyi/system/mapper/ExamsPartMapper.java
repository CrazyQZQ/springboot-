package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ExamsPart;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public interface ExamsPartMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsPart selectExamsPartById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPart 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ExamsPart> selectExamsPartList(ExamsPart examsPart);

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPart 【请填写功能名称】
     * @return 结果
     */
    public int insertExamsPart(ExamsPart examsPart);

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPart 【请填写功能名称】
     * @return 结果
     */
    public int updateExamsPart(ExamsPart examsPart);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPartById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteExamsPartByIds(Long[] ids);
}
