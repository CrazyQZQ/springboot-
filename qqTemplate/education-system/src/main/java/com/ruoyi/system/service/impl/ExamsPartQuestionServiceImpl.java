package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExamsPartQuestionMapper;
import com.ruoyi.system.domain.ExamsPartQuestion;
import com.ruoyi.system.service.IExamsPartQuestionService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author qq
 * @date 2020-09-08
 */
@Service
public class ExamsPartQuestionServiceImpl implements IExamsPartQuestionService 
{
    @Autowired
    private ExamsPartQuestionMapper examsPartQuestionMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ExamsPartQuestion selectExamsPartQuestionById(Long id)
    {
        return examsPartQuestionMapper.selectExamsPartQuestionById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPartQuestion 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamsPartQuestion> selectExamsPartQuestionList(ExamsPartQuestion examsPartQuestion)
    {
        return examsPartQuestionMapper.selectExamsPartQuestionList(examsPartQuestion);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPartQuestion 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamsPartQuestion(ExamsPartQuestion examsPartQuestion)
    {
        return examsPartQuestionMapper.insertExamsPartQuestion(examsPartQuestion);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPartQuestion 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamsPartQuestion(ExamsPartQuestion examsPartQuestion)
    {
        return examsPartQuestionMapper.updateExamsPartQuestion(examsPartQuestion);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPartQuestionByIds(Long[] ids)
    {
        return examsPartQuestionMapper.deleteExamsPartQuestionByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPartQuestionById(Long id)
    {
        return examsPartQuestionMapper.deleteExamsPartQuestionById(id);
    }
}
