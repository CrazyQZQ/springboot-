package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExamsQuestionMapper;
import com.ruoyi.system.domain.ExamsQuestion;
import com.ruoyi.system.service.IExamsQuestionService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-09-07
 */
@Service
public class ExamsQuestionServiceImpl implements IExamsQuestionService 
{
    @Autowired
    private ExamsQuestionMapper examsQuestionMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ExamsQuestion selectExamsQuestionById(Long id)
    {
        return examsQuestionMapper.selectExamsQuestionById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsQuestion 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamsQuestion> selectExamsQuestionList(ExamsQuestion examsQuestion)
    {
        return examsQuestionMapper.selectExamsQuestionList(examsQuestion);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsQuestion 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamsQuestion(ExamsQuestion examsQuestion)
    {
        examsQuestion.setCreateDate(new Date());
        return examsQuestionMapper.insertExamsQuestion(examsQuestion);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsQuestion 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamsQuestion(ExamsQuestion examsQuestion)
    {
        examsQuestion.setUpdateDate(new Date());
        return examsQuestionMapper.updateExamsQuestion(examsQuestion);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsQuestionByIds(Long[] ids)
    {
        return examsQuestionMapper.deleteExamsQuestionByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsQuestionById(Long id)
    {
        return examsQuestionMapper.deleteExamsQuestionById(id);
    }
}
