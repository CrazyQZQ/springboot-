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
    private String id;

    /** 题型 */
    @Excel(name = "题型")
    private Long questionType;

    /** 描述 */
    @Excel(name = "描述")
    private String discrib;

    private List<ExamsPartQuestion> partQuestions;

    private List<ExamsQuestion> questions;

    @Excel(name = "题型")
    private String typeName;

    private Integer sort;

    private Double partScore;

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<ExamsPartQuestion> getPartQuestions() {
        return partQuestions;
    }

    public void setPartQuestions(List<ExamsPartQuestion> partQuestions) {
        this.partQuestions = partQuestions;
    }

    public List<ExamsQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(List<ExamsQuestion> questions) {
        this.questions = questions;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Double getPartScore() {
        return partScore;
    }

    public void setPartScore(Double partScore) {
        this.partScore = partScore;
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
