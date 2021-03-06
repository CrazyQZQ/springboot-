package com.ruoyi.system.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.system.domain.ExamsPaper;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public interface IExamsPaperService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ExamsPaper selectExamsPaperById(String id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param examsPaper 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ExamsPaper> selectExamsPaperList(ExamsPaper examsPaper);

    /**
     * 新增【请填写功能名称】
     * 
     * @param examsPaper 【请填写功能名称】
     * @return 结果
     */
    public int insertExamsPaper(ExamsPaper examsPaper);

    /**
     * 修改【请填写功能名称】
     * 
     * @param examsPaper 【请填写功能名称】
     * @return 结果
     */
    public int updateExamsPaper(ExamsPaper examsPaper);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPaperByIds(String[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteExamsPaperById(String id);
}
