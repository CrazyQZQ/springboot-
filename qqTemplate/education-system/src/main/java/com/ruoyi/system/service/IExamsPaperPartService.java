package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExamsPaperPart;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public interface IExamsPaperPartService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsPaperPart selectExamsPaperPartById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPaperPart 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ExamsPaperPart> selectExamsPaperPartList(ExamsPaperPart examsPaperPart);

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPaperPart 【请填写功能名称】
     * @return 结果
     */
    public int insertExamsPaperPart(ExamsPaperPart examsPaperPart);

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPaperPart 【请填写功能名称】
     * @return 结果
     */
    public int updateExamsPaperPart(ExamsPaperPart examsPaperPart);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPaperPartByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPaperPartById(Long id);
}
