package com.ruoyi.system.service.impl;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.system.domain.ExamsPaperPart;
import com.ruoyi.system.domain.ExamsPartQuestion;
import com.ruoyi.system.mapper.ExamsPaperMapper;
import com.ruoyi.system.mapper.ExamsPaperPartMapper;
import com.ruoyi.system.mapper.ExamsPartQuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.ExamsPaper;
import com.ruoyi.system.service.IExamsPaperService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
@Service
public class ExamsPaperServiceImpl implements IExamsPaperService 
{
    @Autowired
    private ExamsPaperMapper examsPaperMapper;

    @Autowired
    private ExamsPaperPartMapper examsPaperPartMapper;

    @Autowired
    private ExamsPartQuestionMapper partQuestionMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ExamsPaper selectExamsPaperById(Long id)
    {
        ExamsPaper examsPaper = examsPaperMapper.selectExamsPaperById(id);
        ExamsPaperPart examsPaperPart = new ExamsPaperPart();
        examsPaperPart.setPaperId(id);
        List<ExamsPaperPart> examsPaperParts = examsPaperPartMapper.selectExamsPaperPartList(examsPaperPart);
        examsPaperParts.forEach(paperPart -> {
            ExamsPartQuestion examsPartQuestion = new ExamsPartQuestion();
            examsPartQuestion.setPartId(paperPart.getPartId());
            List<ExamsPartQuestion> examsPartQuestions = partQuestionMapper.selectExamsPartQuestionList(examsPartQuestion);
            paperPart.getPart().setQuestions(examsPartQuestions);
        });
        examsPaper.setParts(examsPaperParts);
        return examsPaper;
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPaper 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamsPaper> selectExamsPaperList(ExamsPaper examsPaper)
    {
        return examsPaperMapper.selectExamsPaperList(examsPaper);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPaper 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamsPaper(ExamsPaper examsPaper)
    {
        return examsPaperMapper.insertExamsPaper(examsPaper);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPaper 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamsPaper(ExamsPaper examsPaper)
    {
        return examsPaperMapper.updateExamsPaper(examsPaper);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPaperByIds(Long[] ids)
    {
        return examsPaperMapper.deleteExamsPaperByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPaperById(Long id)
    {
        return examsPaperMapper.deleteExamsPaperById(id);
    }


}
