package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExamsPartQuestion;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public interface IExamsPartQuestionService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsPartQuestion selectExamsPartQuestionById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPartQuestion 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ExamsPartQuestion> selectExamsPartQuestionList(ExamsPartQuestion examsPartQuestion);

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPartQuestion 【请填写功能名称】
     * @return 结果
     */
    public int insertExamsPartQuestion(ExamsPartQuestion examsPartQuestion);

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPartQuestion 【请填写功能名称】
     * @return 结果
     */
    public int updateExamsPartQuestion(ExamsPartQuestion examsPartQuestion);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPartQuestionByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPartQuestionById(Long id);
}
