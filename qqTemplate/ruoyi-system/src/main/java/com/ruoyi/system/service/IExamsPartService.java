package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExamsPart;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public interface IExamsPartService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsPart selectExamsPartById(String id);

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
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPartByIds(String[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPartById(String id);
}
