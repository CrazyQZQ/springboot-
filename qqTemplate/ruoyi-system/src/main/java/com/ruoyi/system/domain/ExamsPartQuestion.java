package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 exams_part_question
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public class ExamsPartQuestion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 模块编号 */
    @Excel(name = "模块编号")
    private Long partId;

    /** 试题编号 */
    @Excel(name = "试题编号")
    private Long questionId;

    /** 试题排序 */
    @Excel(name = "试题排序")
    private Long sort;

    private ExamsQuestion question;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPartId(Long partId) 
    {
        this.partId = partId;
    }

    public Long getPartId() 
    {
        return partId;
    }
    public void setQuestionId(Long questionId) 
    {
        this.questionId = questionId;
    }

    public Long getQuestionId() 
    {
        return questionId;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    public ExamsQuestion getQuestion() {
        return question;
    }

    public void setQuestion(ExamsQuestion question) {
        this.question = question;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("partId", getPartId())
            .append("questionId", getQuestionId())
            .append("sort", getSort())
            .toString();
    }
}
