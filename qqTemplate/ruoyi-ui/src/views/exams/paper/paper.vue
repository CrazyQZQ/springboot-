<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" size="small" label-width="68px">
      <el-form-item label="试卷名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入试卷名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学校" prop="schoolId">
        <el-select v-model="queryParams.schoolId" placeholder="请选择学校" size="small" clearable>
          <el-option
            v-for="item in schools"
            :key="item.deptId"
            :label="item.deptName"
            :value="item.deptId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="年级" prop="grandId">
        <el-select v-model="queryParams.grandId" placeholder="请选择年级" size="small" clearable>
          <el-option
            v-for="item in grands"
            :key="item.dictCode"
            :label="item.dictLabel"
            :value="item.dictCode"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="科目" prop="subjectId">
        <el-select v-model="queryParams.subjectId" placeholder="请选择科目" size="small" clearable>
          <el-option
            v-for="item in subjects"
            :key="item.subjectId"
            :label="item.subjectName"
            :value="item.subjectId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker
          clearable
          size="small"
          style="width: 200px"
          v-model="queryParams.createTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择创建时间"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="修改时间" prop="updateTime">
        <el-date-picker
          clearable
          size="small"
          style="width: 200px"
          v-model="queryParams.updateTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择修改时间"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="toDetail"
          v-hasPermi="['system:paper:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:paper:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:paper:export']"
        >导出</el-button>
      </el-col>-->
    </el-row>

    <el-table v-loading="loading" :data="paperList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="试卷名" align="center" prop="name" />
      <el-table-column label="学校" width="120" align="center" prop="schoolName" />
      <el-table-column label="年级" width="100" align="center" prop="grandName" />
      <el-table-column label="科目" width="100" align="center" prop="subjectName" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="修改时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="preview(scope.row)"
            v-hasPermi="['system:question:edit']"
          >预览</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="toDetail(scope.row)"
            v-hasPermi="['system:paper:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-download"
            @click="handleExport(scope.row)"
            v-hasPermi="['system:paper:edit']"
          >导出</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:paper:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改试题对话框 -->
    <el-dialog title="预览" :visible.sync="openPreview" width="595px" class="paper-preview-dialog" append-to-body>
      <!-- <el-row class="paper-title">{{previewPaper.name}}</el-row> -->
      <el-row>
        <div
          style="text-align: center;
                  font-size: 18px;
                  height: 35px;
                  line-height: 35px;
                  border-bottom: 1px solid;
                  margin-bottom: 10px;">
          <span
            style
          >{{previewPaper.schoolName+' '+previewPaper.grandName+' '+previewPaper.subjectName+' '+previewPaper.name}}</span>
          <span style="float:right;">共{{previewPaper.paperScore}}分</span>
        </div>
      </el-row>
      <el-row v-html="previewPaper.content"></el-row>
    </el-dialog>
  </div>
</template>

<script>
import {
  listPaper,
  getPaper,
  delPaper,
  addPaper,
  updatePaper,
  exportPaper
} from "@/api/exams/paper";
import { praseNumber } from "@/utils/ruoyi";
import { listDept } from "@/api/system/dept";
import { listSubject } from "@/api/exams/subject";

export default {
  name: "Paper",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 总条数
      total: 0,
      // 试卷表格数据
      paperList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: undefined,
        schoolId: undefined,
        grandId: undefined,
        subjectId: undefined,
        createTime: undefined,
        updateTime: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [{ required: true, message: "试卷名不能为空", trigger: "blur" }],
        schoolId: [
          { required: true, message: "学校编号不能为空", trigger: "blur" }
        ],
        grandId: [
          { required: true, message: "年级编号不能为空", trigger: "blur" }
        ],
        subjectId: [
          { required: true, message: "科目编号不能为空", trigger: "blur" }
        ]
      },
      openPreview: false,
      previewPaper: {
        content: undefined
      },
      // 学校
      schools: [],
      // 年级
      grands: [],
      // 科目
      subjects: []
    };
  },
  created() {
    this.getData();
  },
  methods: {
    getData() {
      this.getList();
      listDept({ parentId: 101 }).then(response => {
        this.schools = response.data;
      });
      listSubject().then(response => {
        this.subjects = response.rows;
      });
      this.getDicts("sys_grand").then(response => {
        this.grands = response.data;
      });
    },
    /** 查询试卷列表 */
    getList() {
      this.loading = true;
      listPaper(this.queryParams).then(response => {
        this.paperList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        name: undefined,
        schoolId: undefined,
        grandId: undefined,
        subjectId: undefined,
        createTime: undefined,
        updateTime: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加试卷";
    },
    preview(row) {
      this.reset();
      const id = row.id || this.ids;
      getPaper(id).then(response => {
        this.previewPaper = this.handPaper(response.data);
        this.openPreview = true;
      });
    },
    /** 修改按钮操作 */
    toDetail(row) {
      this.$router.push({
        name: "PaperEdit",
        params: { id: row.id ? row.id : null }
      });
    },
    handPaper(data) {
      let paper = { parts: [], content: "" };
      paper.name = data.name;
      paper.paperScore = data.paperScore;
      paper.id = data.id;
      paper.schoolName = data.schoolName;
      paper.grandName = data.grandName;
      paper.subjectName = data.subjectName;
      data.paperParts.forEach(paperPart => {
        let part = JSON.parse(JSON.stringify(paperPart.part));
        paper.content += `${praseNumber(paperPart.sort)}、${
          part.typeName
        }&nbsp;(${part.discrib})&nbsp;&nbsp;共${paperPart.partScore}分`;
        part.questions = [];
        paperPart.part.partQuestions.forEach((partQuestion, index) => {
          part.questions.push(partQuestion.question);
          if (partQuestion.question.content)
            paper.content += `${partQuestion.question.content.replace(
              "<p>",
              `<p>${partQuestion.sort}、`
            )}<br/>`;
        });
        paper.parts.push(paperPart.part);
      });
      return paper;
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != undefined) {
            updatePaper(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addPaper(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除试卷编号为"' + ids + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(function() {
          return delPaper(ids);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
        .catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport(row) {
      let that = this;
      this.$confirm("确认导出试卷?", "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          const id = row.id || that.ids;
          return getPaper(id);
        })
        .then(response => {
          let paper = that.handPaper(response.data);
          let paperStr = 
          `<div style="text-align: center;
                  font-size: 18px;
                  height: 35px;
                  line-height: 35px;
                  border-bottom: 1px solid;
                  margin-bottom: 10px;">
          <span style="font-weight: 600;">${paper.schoolName}  ${paper.grandName} ${paper.subjectName} ${paper.name}</span>
          <span style="float:right;font-weight:400;">共${paper.paperScore}分</span>
        </div>
        ${paper.content}`;
          // console.log(paperStr);
          // return;
          return exportPaper(paperStr);
        })
        .then(response => {
          this.download(response.msg);
        })
        .catch(function() {});
    }
  }
};
</script>
<style scoped>
.paper-title {
  height: 35px;
  line-height: 30px;
  text-align: center;
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 10px;
  border-bottom: 1px solid black;
}
</style>
<style>
  .paper-preview-dialog .el-dialog__header{
    display: none;
  }
  .paper-preview-dialog .el-dialog__body{
    max-height: 740px;
    overflow-y: auto;
  }
</style>
