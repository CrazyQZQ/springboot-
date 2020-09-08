package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.ExamsPartQuestion;
import com.ruoyi.system.mapper.ExamsPartQuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExamsPartMapper;
import com.ruoyi.system.domain.ExamsPart;
import com.ruoyi.system.service.IExamsPartService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
@Service
public class ExamsPartServiceImpl implements IExamsPartService 
{
    @Autowired
    private ExamsPartMapper examsPartMapper;

    @Autowired
    private ExamsPartQuestionMapper examsPartQuestionMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ExamsPart selectExamsPartById(Long id)
    {
        ExamsPart examsPart = examsPartMapper.selectExamsPartById(id);
        ExamsPartQuestion examsPartQuestion = new ExamsPartQuestion();
        examsPartQuestion.setPartId(id);
        List<ExamsPartQuestion> examsPartQuestions = examsPartQuestionMapper.selectExamsPartQuestionList(examsPartQuestion);
        examsPart.setQuestions(examsPartQuestions);
        return examsPart;
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPart 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamsPart> selectExamsPartList(ExamsPart examsPart)
    {
        return examsPartMapper.selectExamsPartList(examsPart);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPart 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamsPart(ExamsPart examsPart)
    {
        return examsPartMapper.insertExamsPart(examsPart);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPart 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamsPart(ExamsPart examsPart)
    {
        return examsPartMapper.updateExamsPart(examsPart);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPartByIds(Long[] ids)
    {
        return examsPartMapper.deleteExamsPartByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPartById(Long id)
    {
        return examsPartMapper.deleteExamsPartById(id);
    }
}
