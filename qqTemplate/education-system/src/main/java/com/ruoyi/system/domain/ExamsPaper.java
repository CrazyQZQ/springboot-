package com.ruoyi.system.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 exams_paper
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public class ExamsPaper extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** 试卷名 */
    @Excel(name = "试卷名")
    private String name;

    /** 学校编号 */
    @Excel(name = "学校编号")
    private Long schoolId;

    @Excel(name = "学校")
    private String schoolName;

    /** 年级编号 */
    @Excel(name = "年级编号")
    private Long grandId;

    @Excel(name = "年级")
    private String grandName;

    /** 科目编号 */
    @Excel(name = "科目编号")
    private Long subjectId;

    @Excel(name = "科目")
    private String subjectName;


    private List<ExamsPaperPart> paperParts;

    private List<ExamsPart> parts;

    @Excel(name = "总分")
    private Integer paperScore;

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSchoolId(Long schoolId) 
    {
        this.schoolId = schoolId;
    }

    public Long getSchoolId() 
    {
        return schoolId;
    }
    public void setGrandId(Long grandId) 
    {
        this.grandId = grandId;
    }

    public Long getGrandId() 
    {
        return grandId;
    }
    public void setSubjectId(Long subjectId) 
    {
        this.subjectId = subjectId;
    }

    public Long getSubjectId() 
    {
        return subjectId;
    }

    public List<ExamsPaperPart> getPaperParts() {
        return paperParts;
    }

    public void setPaperParts(List<ExamsPaperPart> paperParts) {
        this.paperParts = paperParts;
    }

    public List<ExamsPart> getParts() {
        return parts;
    }

    public void setParts(List<ExamsPart> parts) {
        this.parts = parts;
    }

    public Integer getPaperScore() {
        return paperScore;
    }

    public void setPaperScore(Integer paperScore) {
        this.paperScore = paperScore;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getGrandName() {
        return grandName;
    }

    public void setGrandName(String grandName) {
        this.grandName = grandName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("schoolId", getSchoolId())
            .append("grandId", getGrandId())
            .append("subjectId", getSubjectId())
            .toString();
    }
}
