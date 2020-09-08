package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 【请填写功能名称】对象 exams_part
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public class ExamsPart extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 题型 */
    @Excel(name = "题型")
    private Long questionType;

    /** 描述 */
    @Excel(name = "描述")
    private String discrib;

    private List<ExamsPartQuestion> questions;

    @Excel(name = "题型")
    private String typeName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setQuestionType(Long questionType) 
    {
        this.questionType = questionType;
    }

    public Long getQuestionType() 
    {
        return questionType;
    }
    public void setDiscrib(String discrib) 
    {
        this.discrib = discrib;
    }

    public String getDiscrib() 
    {
        return discrib;
    }

    public List<ExamsPartQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(List<ExamsPartQuestion> questions) {
        this.questions = questions;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionType", getQuestionType())
            .append("discrib", getDiscrib())
            .toString();
    }
}
