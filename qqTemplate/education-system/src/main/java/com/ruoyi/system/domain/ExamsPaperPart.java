package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 exams_paper_part
 * 
 * @author ruoyi
 * @date 2020-09-08
 */
public class ExamsPaperPart extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 试卷编号 */
    @Excel(name = "试卷编号")
    private String paperId;

    /** 模块编号 */
    @Excel(name = "模块编号")
    private String partId;

    /** 模块排序 */
    @Excel(name = "模块排序")
    private Integer sort;

    private ExamsPart part;

    /** 模块总分 */
    @Excel(name = "模块总分")
    private Double partScore;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPaperId(String paperId)
    {
        this.paperId = paperId;
    }

    public String getPaperId()
    {
        return paperId;
    }
    public void setPartId(String partId)
    {
        this.partId = partId;
    }

    public String getPartId()
    {
        return partId;
    }
    public void setSort(Integer sort) 
    {
        this.sort = sort;
    }

    public Integer getSort() 
    {
        return sort;
    }

    public ExamsPart getPart() {
        return part;
    }

    public void setPart(ExamsPart part) {
        this.part = part;
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
            .append("paperId", getPaperId())
            .append("partId", getPartId())
            .append("sort", getSort())
            .toString();
    }
}
