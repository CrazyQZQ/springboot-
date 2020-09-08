package com.ruoyi.web.controller.exams.paper;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ExamsPaper;
import com.ruoyi.system.domain.ExamsPart;
import com.ruoyi.system.domain.ExamsPartQuestion;
import com.ruoyi.system.service.IExamsPaperService;
import com.ruoyi.system.service.IExamsPartQuestionService;
import com.ruoyi.system.service.IExamsPartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 试卷Controller
 *
 * @author qq
 * @date 2020-09-08
 */
@RestController
@RequestMapping("/exams/paper")
public class PaperController extends BaseController {
    @Autowired
    private IExamsPaperService examsPaperService;

    @Autowired
    private IExamsPartService examsPartService;

    @Autowired
    private IExamsPartQuestionService examsPartQuestionService;

    /**
     * 查询试卷列表
     */
    @PreAuthorize("@ss.hasPermi('system:paper:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamsPaper examsPaper)
    {
        startPage();
        List<ExamsPaper> list = examsPaperService.selectExamsPaperList(examsPaper);
        return getDataTable(list);
    }

    /**
     * 导出试卷列表
     */
    @PreAuthorize("@ss.hasPermi('system:paper:export')")
    @Log(title = "试卷", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamsPaper examsPaper)
    {
        List<ExamsPaper> list = examsPaperService.selectExamsPaperList(examsPaper);
        ExcelUtil<ExamsPaper> util = new ExcelUtil<ExamsPaper>(ExamsPaper.class);
        return util.exportExcel(list, "paper");
    }

    /**
     * 获取试卷详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:paper:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(examsPaperService.selectExamsPaperById(id));
    }

    /**
     * 新增试卷
     */
    @PreAuthorize("@ss.hasPermi('system:paper:add')")
    @Log(title = "试卷", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamsPaper examsPaper)
    {
        return toAjax(examsPaperService.insertExamsPaper(examsPaper));
    }

    /**
     * 修改试卷
     */
    @PreAuthorize("@ss.hasPermi('system:paper:edit')")
    @Log(title = "试卷", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamsPaper examsPaper)
    {
        return toAjax(examsPaperService.updateExamsPaper(examsPaper));
    }

    /**
     * 删除试卷
     */
    @PreAuthorize("@ss.hasPermi('system:paper:remove')")
    @Log(title = "试卷", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examsPaperService.deleteExamsPaperByIds(ids));
    }
}
