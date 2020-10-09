package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.ExamsPaper;
import com.ruoyi.system.domain.ExamsPaperPart;
import com.ruoyi.system.domain.ExamsPartQuestion;
import com.ruoyi.system.mapper.ExamsPaperMapper;
import com.ruoyi.system.mapper.ExamsPaperPartMapper;
import com.ruoyi.system.mapper.ExamsPartMapper;
import com.ruoyi.system.mapper.ExamsPartQuestionMapper;
import com.ruoyi.system.service.IExamsPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 试卷Service业务层处理
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
    private ExamsPartMapper examsPartMapper;

    @Autowired
    private ExamsPartQuestionMapper examsPartQuestionMapper;


    /**
     * 查询试卷
     * 
     * @param id 试卷ID
     * @return 试卷
     */
    @Override
    public ExamsPaper selectExamsPaperById(String id)
    {
        ExamsPaper examsPaper = examsPaperMapper.selectExamsPaperById(id);
        ExamsPaperPart examsPaperPart = new ExamsPaperPart();
        examsPaperPart.setPaperId(id);
        List<ExamsPaperPart> examsPaperParts = examsPaperPartMapper.selectExamsPaperPartList(examsPaperPart);
        examsPaperParts.forEach(paperPart -> {
            ExamsPartQuestion examsPartQuestion = new ExamsPartQuestion();
            examsPartQuestion.setPartId(paperPart.getPartId());
            List<ExamsPartQuestion> examsPartQuestions = examsPartQuestionMapper.selectExamsPartQuestionList(examsPartQuestion);
            paperPart.getPart().setPartQuestions(examsPartQuestions);
        });
        examsPaper.setPaperParts(examsPaperParts);
        return examsPaper;
    }

    /**
     * 查询试卷列表
     * 
     * @param examsPaper 试卷
     * @return 试卷
     */
    @Override
    public List<ExamsPaper> selectExamsPaperList(ExamsPaper examsPaper)
    {
        return examsPaperMapper.selectExamsPaperList(examsPaper);
    }

    /**
     * 新增试卷
     * 
     * @param examsPaper 试卷
     * @return 结果
     */
    @Override
    @Transactional
    public int insertExamsPaper(ExamsPaper examsPaper)
    {
        String paperId = IdUtils.fastUUID();
        examsPaper.setId(paperId);
        examsPaper.setCreateTime(new Date());
        examsPaper.setCreateBy(SecurityUtils.getUsername());
        examsPaperMapper.insertExamsPaper(examsPaper);
        insertPaperInfo(examsPaper);
        return 1;
    }

    /**
     * 插入 paper_part part part_question中的数据
     * @param examsPaper
     */
    public void insertPaperInfo(ExamsPaper examsPaper) {
        //        paperPartList
        List<ExamsPaperPart> paperPartList = new ArrayList<>();
//        partQuestionList
        List<ExamsPartQuestion> partQuestionList = new ArrayList<>();
        examsPaper.getParts().forEach(part -> {
            String partId = IdUtils.fastUUID();
            part.setId(partId);
            ExamsPaperPart examsPaperPart = new ExamsPaperPart();
            examsPaperPart.setPaperId(examsPaper.getId());
            examsPaperPart.setPartId(partId);
            examsPaperPart.setSort(part.getSort());
            examsPaperPart.setPartScore(part.getPartScore());
            paperPartList.add(examsPaperPart);
            part.getQuestions().forEach(question -> {
                ExamsPartQuestion partQuestion = new ExamsPartQuestion();
                partQuestion.setPartId(partId);
                partQuestion.setQuestionId(question.getId());
                partQuestion.setSort(question.getSort());
                partQuestion.setQuestionScore(question.getQuestionScore());
                partQuestionList.add(partQuestion);
            });
        });
        if(examsPaper.getParts().size()>0)
            examsPartMapper.insertExamsPartBatch(examsPaper.getParts());
        if(paperPartList.size()>0)
            examsPaperPartMapper.insertExamsPaperPartBatch(paperPartList);
        if(partQuestionList.size()>0)
            examsPartQuestionMapper.insertExamsPartQuestionBatch(partQuestionList);
    }

    /**
     * 删除 paper_part part part_question中的数据（级联删除）
     * @param examsPaper
     */
    public void deletePaperInfo(ExamsPaper examsPaper) {
        ExamsPaperPart examsPaperPart = new ExamsPaperPart();
        examsPaperPart.setPaperId(examsPaper.getId());
        List<ExamsPaperPart> paperPartList = examsPaperPartMapper.selectExamsPaperPartList(examsPaperPart);
        List<String> partIds = paperPartList.stream().map(paperPart -> paperPart.getPartId()).collect(Collectors.toList());
        examsPartMapper.deleteExamsPartByIds(partIds.toArray(new String[partIds.size()]));
    }

    /**
     * 修改试卷
     * 
     * @param examsPaper 试卷
     * @return 结果
     */
    @Override
    @Transactional
    public int updateExamsPaper(ExamsPaper examsPaper)
    {
        deletePaperInfo(examsPaper);
        insertPaperInfo(examsPaper);
        examsPaper.setUpdateTime(new Date());
        examsPaper.setCreateBy(SecurityUtils.getUsername());
        examsPaperMapper.updateExamsPaper(examsPaper);
        return 1;
    }

    /**
     * 批量删除试卷
     * 
     * @param ids 需要删除的试卷ID
     * @return 结果
     */
    @Override
    public int deleteExamsPaperByIds(String[] ids)
    {
        return examsPaperMapper.deleteExamsPaperByIds(ids);
    }

    /**
     * 删除试卷信息
     * 
     * @param id 试卷ID
     * @return 结果
     */
    @Override
    public int deleteExamsPaperById(String id)
    {
        return examsPaperMapper.deleteExamsPaperById(id);
    }


}
