package com.ruoyi.web.controller.exams.questions;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ExamsQuestion;
import com.ruoyi.system.service.IExamsQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 试题Controller
 *
 * @author qq
 * @date 2020-09-07
 */
@RestController
@RequestMapping("/exams/question")
public class QuestionController extends BaseController {
    @Autowired
    private IExamsQuestionService examsQuestionService;

    /**
     * 查询试题列表
     */
    @PreAuthorize("@ss.hasPermi('exams:question:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamsQuestion examsQuestion)
    {
        startPage();
        List<ExamsQuestion> list = examsQuestionService.selectExamsQuestionList(examsQuestion);
        return getDataTable(list);
    }

    /**
     * 导出试题列表
     */
    @PreAuthorize("@ss.hasPermi('exams:question:export')")
    @Log(title = "试题", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamsQuestion examsQuestion)
    {
        List<ExamsQuestion> list = examsQuestionService.selectExamsQuestionList(examsQuestion);
        ExcelUtil<ExamsQuestion> util = new ExcelUtil<ExamsQuestion>(ExamsQuestion.class);
        return util.exportExcel(list, "question");
    }

    /**
     * 获取试题详细信息
     */
    @PreAuthorize("@ss.hasPermi('exams:question:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examsQuestionService.selectExamsQuestionById(id));
    }

    /**
     * 新增试题
     */
    @PreAuthorize("@ss.hasPermi('exams:question:add')")
    @Log(title = "试题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamsQuestion examsQuestion)
    {
        return toAjax(examsQuestionService.insertExamsQuestion(examsQuestion));
    }

    /**
     * 修改试题
     */
    @PreAuthorize("@ss.hasPermi('exams:question:edit')")
    @Log(title = "试题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamsQuestion examsQuestion)
    {
        return toAjax(examsQuestionService.updateExamsQuestion(examsQuestion));
    }

    /**
     * 删除试题
     */
    @PreAuthorize("@ss.hasPermi('exams:question:remove')")
    @Log(title = "试题", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examsQuestionService.deleteExamsQuestionByIds(ids));
    }
}
