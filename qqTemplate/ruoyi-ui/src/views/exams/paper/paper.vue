<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px">
      <el-form-item label="试卷名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入试卷名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学校编号" prop="schoolId">
        <el-input
          v-model="queryParams.schoolId"
          placeholder="请输入学校编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="年级编号" prop="grandId">
        <el-input
          v-model="queryParams.grandId"
          placeholder="请输入年级编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="科目编号" prop="subjectId">
        <el-input
          v-model="queryParams.subjectId"
          placeholder="请输入科目编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createDate">
        <el-date-picker clearable size="small" style="width: 200px"
                        v-model="queryParams.createDate"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="修改时间" prop="updateDate">
        <el-date-picker clearable size="small" style="width: 200px"
                        v-model="queryParams.updateDate"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择修改时间">
        </el-date-picker>
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
        >新增
        </el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="toDetail"-->
<!--          v-hasPermi="['system:paper:edit']"-->
<!--        >修改-->
<!--        </el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:paper:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:paper:export']"
        >导出
        </el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="paperList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="ID" align="center" prop="id"/>
      <el-table-column label="试卷名" align="center" prop="name"/>
      <el-table-column label="学校编号" align="center" prop="schoolId"/>
      <el-table-column label="年级编号" align="center" prop="grandId"/>
      <el-table-column label="科目编号" align="center" prop="subjectId"/>
      <el-table-column label="创建时间" align="center" prop="createDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="修改时间" align="center" prop="updateDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateDate, '{y}-{m}-{d}') }}</span>
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
          >预览
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="toDetail(scope.row)"
            v-hasPermi="['system:paper:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:paper:remove']"
          >删除
          </el-button>
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
    <el-dialog title="预览" :visible.sync="openPreview" width="500px" append-to-body>
      <el-row class="paper-title">
        {{previewPaper.name}}
      </el-row>
      <el-row v-html="previewPaper.content"></el-row>
    </el-dialog>
  </div>
</template>

<script>
  import {listPaper, getPaper, delPaper, addPaper, updatePaper, exportPaper} from "@/api/exams/paper";

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
        // 【请填写功能名称】表格数据
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
          createDate: undefined,
          updateDate: undefined
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          name: [
            {required: true, message: "试卷名不能为空", trigger: "blur"}
          ],
          schoolId: [
            {required: true, message: "学校编号不能为空", trigger: "blur"}
          ],
          grandId: [
            {required: true, message: "年级编号不能为空", trigger: "blur"}
          ],
          subjectId: [
            {required: true, message: "科目编号不能为空", trigger: "blur"}
          ],
        },
        openPreview: false,
        previewPaper: {
          content: undefined
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询【请填写功能名称】列表 */
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
          createDate: undefined,
          updateDate: undefined
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
        this.ids = selection.map(item => item.id)
        this.single = selection.length != 1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加【请填写功能名称】";
      },
      preview(row) {
        this.reset();
        const id = row.id || this.ids
        getPaper(id).then(response => {
          this.previewPaper = this.handPaper(response.data);
          this.openPreview = true
        });
      },
      /** 修改按钮操作 */
      toDetail(row) {
        this.$router.push({ name: 'PaperEdit', params: { id: row.id ? row.id : null }})
      },
      handPaper(data) {
        let paper = {parts: [], content: ''}
        paper.name = data.name;
        data.parts.forEach(paperPart => {
          let part = JSON.parse(JSON.stringify(paperPart.part))
          paper.content += `${part.typeName}(${part.discrib})`
          part.questions = []
          paperPart.part.questions.forEach((partQuestion, index) => {
            part.questions.push(partQuestion.question)
            if (partQuestion.question.content)
              paper.content += `${partQuestion.question.content.replace("<p>", `<p>${index + 1}、`)}<br/>`
          })
          paper.parts.push(paperPart.part)
        })
        return paper;
      },
      /** 提交按钮 */
      submitForm: function () {
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
        this.$confirm('是否确认删除【请填写功能名称】编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function () {
          return delPaper(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function () {
        });
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams;
        this.$confirm('是否确认导出所有【请填写功能名称】数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function () {
          return exportPaper(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function () {
        });
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
