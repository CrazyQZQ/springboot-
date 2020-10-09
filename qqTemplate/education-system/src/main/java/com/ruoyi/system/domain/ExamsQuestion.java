package com.ruoyi.system.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 exams_question
 *
 * @author ruoyi
 * @date 2020-09-07
 */
public class ExamsQuestion extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 课程名称
     */
    @Excel(name = "课程名称")
    private Long subjectId;

    /**
     * 答案
     */
    @Excel(name = "答案")
    private String answer;

    /**
     * 试题内容
     */
    @Excel(name = "试题内容")
    private String content;

    private String questionType;

    /**
     * 试题类型
     */
    @Excel(name = "试题类型")
    private String typeName;

    /**
     * 试题选项（多个以逗号隔开）
     */
    @Excel(name = "试题选项", readConverterExp = "多=个以逗号隔开")
    private String options;

    /**
     * 试题解析内容
     */
    @Excel(name = "试题解析内容")
    private String analysis;

    /**
     * 总结升华
     */
    @Excel(name = "总结升华")
    private String summarize;

    /**
     * $column.columnComment
     */
    @Excel(name = "总结升华")
    private Long languagePointsId;

    /**
     * 标题
     */
    @Excel(name = "标题")
    private String title;

    @Excel(name = "课程")
    private String subjectName;

    @Excel(name = "年级")
    private String grandName;

    private Long sort;

    private Double questionScore;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    public Long getSubjectId() {
        return subjectId;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setOptions(String options) {
        this.options = options;
    }

    public String getOptions() {
        return options;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setSummarize(String summarize) {
        this.summarize = summarize;
    }

    public String getSummarize() {
        return summarize;
    }

    public void setLanguagePointsId(Long languagePointsId) {
        this.languagePointsId = languagePointsId;
    }

    public Long getLanguagePointsId() {
        return languagePointsId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getGrandName() {
        return grandName;
    }

    public void setGrandName(String grandName) {
        this.grandName = grandName;
    }

    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    public Double getQuestionScore() {
        return questionScore;
    }

    public void setQuestionScore(Double questionScore) {
        this.questionScore = questionScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("subjectId", getSubjectId())
                .append("answer", getAnswer())
                .append("content", getContent())
                .append("questionType", getQuestionType())
                .append("options", getOptions())
                .append("analysis", getAnalysis())
                .append("summarize", getSummarize())
                .append("languagePointsId", getLanguagePointsId())
                .toString();
    }
}
