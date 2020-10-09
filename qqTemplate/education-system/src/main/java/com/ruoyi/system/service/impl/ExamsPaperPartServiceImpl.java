package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExamsPaperPartMapper;
import com.ruoyi.system.domain.ExamsPaperPart;
import com.ruoyi.system.service.IExamsPaperPartService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
@Service
public class ExamsPaperPartServiceImpl implements IExamsPaperPartService 
{
    @Autowired
    private ExamsPaperPartMapper examsPaperPartMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ExamsPaperPart selectExamsPaperPartById(Long id)
    {
        return examsPaperPartMapper.selectExamsPaperPartById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPaperPart 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ExamsPaperPart> selectExamsPaperPartList(ExamsPaperPart examsPaperPart)
    {
        return examsPaperPartMapper.selectExamsPaperPartList(examsPaperPart);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPaperPart 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertExamsPaperPart(ExamsPaperPart examsPaperPart)
    {
        return examsPaperPartMapper.insertExamsPaperPart(examsPaperPart);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPaperPart 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateExamsPaperPart(ExamsPaperPart examsPaperPart)
    {
        return examsPaperPartMapper.updateExamsPaperPart(examsPaperPart);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPaperPartByIds(Long[] ids)
    {
        return examsPaperPartMapper.deleteExamsPaperPartByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteExamsPaperPartById(Long id)
    {
        return examsPaperPartMapper.deleteExamsPaperPartById(id);
    }
}
