package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExamsQuestion;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-09-07
 */
public interface IExamsQuestionService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsQuestion selectExamsQuestionById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsQuestion 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ExamsQuestion> selectExamsQuestionList(ExamsQuestion examsQuestion);

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsQuestion 【请填写功能名称】
     * @return 结果
     */
    public int insertExamsQuestion(ExamsQuestion examsQuestion);

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsQuestion 【请填写功能名称】
     * @return 结果
     */
    public int updateExamsQuestion(ExamsQuestion examsQuestion);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsQuestionByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsQuestionById(Long id);
}
