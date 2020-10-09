package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExamsSubject;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-09-07
 */
public interface IExamsSubjectService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param subjectId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsSubject selectExamsSubjectById(Long subjectId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsSubject 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ExamsSubject> selectExamsSubjectList(ExamsSubject examsSubject);

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsSubject 【请填写功能名称】
     * @return 结果
     */
    public int insertExamsSubject(ExamsSubject examsSubject);

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsSubject 【请填写功能名称】
     * @return 结果
     */
    public int updateExamsSubject(ExamsSubject examsSubject);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param subjectIds 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsSubjectByIds(Long[] subjectIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param subjectId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsSubjectById(Long subjectId);
}
