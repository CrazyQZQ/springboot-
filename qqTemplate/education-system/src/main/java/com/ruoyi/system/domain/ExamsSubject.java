package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 exams_subject
 * 
 * @author ruoyi
 * @date 2020-09-07
 */
public class ExamsSubject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long subjectId;

    @Excel(name = "年级ID")
    private Long grandId;

    @Excel(name = "科目名称")
    private String subjectName;

    @Excel(name = "年级名称")
    private String grandName;

    public void setSubjectId(Long subjectId) 
    {
        this.subjectId = subjectId;
    }

    public Long getSubjectId() 
    {
        return subjectId;
    }
    public void setGrandId(Long grandId) 
    {
        this.grandId = grandId;
    }

    public Long getGrandId() 
    {
        return grandId;
    }
    public void setSubjectName(String subjectName) 
    {
        this.subjectName = subjectName;
    }

    public String getSubjectName() 
    {
        return subjectName;
    }

    public String getGrandName() {
        return grandName;
    }

    public void setGrandName(String grandName) {
        this.grandName = grandName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("subjectId", getSubjectId())
            .append("grandId", getGrandId())
            .append("subjectName", getSubjectName())
            .toString();
    }
}
