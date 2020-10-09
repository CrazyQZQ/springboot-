package com.ruoyi.web.controller.exams.subject;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.ExamsSubject;
import com.ruoyi.system.service.IExamsSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户信息
 *
 * @author qq
 */
@RestController
@RequestMapping("/exams/subject")
public class SubjectController extends BaseController {
    @Autowired
    private IExamsSubjectService examsSubjectService;

    /**
     * 查询科目列表
     */
    @PreAuthorize("@ss.hasPermi('exams:question:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamsSubject examsSubject)
    {
        startPage();
        List<ExamsSubject> list = examsSubjectService.selectExamsSubjectList(examsSubject);
        return getDataTable(list);
    }

    /**
     * 导出科目列表
     */
    @PreAuthorize("@ss.hasPermi('exams:question:export')")
    @Log(title = "科目", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExamsSubject examsSubject)
    {
        List<ExamsSubject> list = examsSubjectService.selectExamsSubjectList(examsSubject);
        ExcelUtil<ExamsSubject> util = new ExcelUtil<ExamsSubject>(ExamsSubject.class);
        return util.exportExcel(list, "subject");
    }

    /**
     * 获取科目详细信息
     */
    @PreAuthorize("@ss.hasPermi('exams:question:query')")
    @GetMapping(value = "/{subjectId}")
    public AjaxResult getInfo(@PathVariable("subjectId") Long subjectId)
    {
        return AjaxResult.success(examsSubjectService.selectExamsSubjectById(subjectId));
    }

    /**
     * 新增科目
     */
    @PreAuthorize("@ss.hasPermi('exams:question:add')")
    @Log(title = "科目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamsSubject examsSubject)
    {
        return toAjax(examsSubjectService.insertExamsSubject(examsSubject));
    }

    /**
     * 修改科目
     */
    @PreAuthorize("@ss.hasPermi('exams:question:edit')")
    @Log(title = "科目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamsSubject examsSubject)
    {
        return toAjax(examsSubjectService.updateExamsSubject(examsSubject));
    }

    /**
     * 删除科目
     */
    @PreAuthorize("@ss.hasPermi('exams:question:remove')")
    @Log(title = "科目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{subjectIds}")
    public AjaxResult remove(@PathVariable Long[] subjectIds)
    {
        return toAjax(examsSubjectService.deleteExamsSubjectByIds(subjectIds));
    }
}
