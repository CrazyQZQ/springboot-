package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExamsSubjectMapper;
import com.ruoyi.system.domain.ExamsSubject;
import com.ruoyi.system.service.IExamsSubjectService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-09-07
 */
@Service
public class ExamsSubjectServiceImpl implements IExamsSubjectService 
{
    @Autowired
    private ExamsSubjectMapper examsSubjectMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param subjectId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ExamsSubject selectExamsSubjectById(Long subjectId)
    {
        return examsSubjectMapper.selectExamsSubjectById(subjectId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsSubject 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamsSubject> selectExamsSubjectList(ExamsSubject examsSubject)
    {
        return examsSubjectMapper.selectExamsSubjectList(examsSubject);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsSubject 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamsSubject(ExamsSubject examsSubject)
    {
        return examsSubjectMapper.insertExamsSubject(examsSubject);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsSubject 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamsSubject(ExamsSubject examsSubject)
    {
        return examsSubjectMapper.updateExamsSubject(examsSubject);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param subjectIds 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsSubjectByIds(Long[] subjectIds)
    {
        return examsSubjectMapper.deleteExamsSubjectByIds(subjectIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param subjectId 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsSubjectById(Long subjectId)
    {
        return examsSubjectMapper.deleteExamsSubjectById(subjectId);
    }
}
