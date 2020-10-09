package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ExamsSubject;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-09-07
 */
public interface ExamsSubjectMapper 
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
     * 删除【请填写功能名称】
     * 
     * @param subjectId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsSubjectById(Long subjectId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param subjectIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteExamsSubjectByIds(Long[] subjectIds);
}
