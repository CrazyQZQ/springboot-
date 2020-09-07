<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px">
      <el-form-item label="课程名称" prop="subjectId">
        <el-select v-model="queryParams.subjectId" placeholder="请选择课程">
          <el-option
            v-for="item in subjects"
            :key="item.subjectId"
            :label="item.grandName + '-' + item.subjectName"
            :value="item.subjectId">
          </el-option>
        </el-select>
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
      <el-form-item label="试题类型" prop="questionType">
        <el-select v-model="queryParams.questionType" placeholder="请选择试题类型" clearable size="small">
          <el-option
            v-for="item in questionTypes"
            :key="item.dictCode"
            :label="item.dictLabel"
            :value="item.dictCode">
          </el-option>
        </el-select>
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
          @click="handleAdd"
          v-hasPermi="['system:question:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:question:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:question:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:question:export']"
        >导出</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="questionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" width="65"/>
      <el-table-column label="标题" align="center" prop="title" />
      <el-table-column label="课程名称" align="center" prop="subjectId">
        <template slot-scope="scope">
          <span>{{ scope.row.grandName + '-' + scope.row.subjectName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="试题类型" align="center" prop="typeName" />
      <el-table-column label="创建时间" align="center" prop="createDate" width="150">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateDate" width="150">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="答案" align="center" prop="answer" />

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
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:question:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:question:remove']"
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

    <!-- 添加或修改【请填写功能名称】对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="80%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="课程">
          <el-select v-model="form.subjectId" placeholder="请选择课程">
            <el-option
              v-for="item in subjects"
              :key="item.subjectId"
              :label="item.grandName + '-' + item.subjectName"
              :value="item.subjectId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="试题类型">
          <el-select v-model="form.questionType" placeholder="请选择试题类型">
            <el-option
              v-for="item in questionTypes"
              :key="item.dictCode"
              :label="item.dictLabel"
              :value="item.dictCode">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="试题内容">
          <Editor v-model="form.content" />
        </el-form-item>
        <el-form-item label="答案" prop="answer" style="margin-top: 62px;">
          <el-input v-model="form.answer" placeholder="请输入答案" type="textarea"/>
        </el-form-item>
        <el-form-item label="试题解析内容" prop="analysis">
          <el-input v-model="form.analysis" placeholder="请输入试题解析内容" />
        </el-form-item>
        <el-form-item label="总结升华" prop="summarize">
          <el-input v-model="form.summarize" placeholder="请输入总结升华" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改【请填写功能名称】对话框 -->
    <el-dialog title="预览" :visible.sync="openPreview" width="500px" append-to-body>
      <div v-html="previewQuestion.content"></div>
    </el-dialog>
  </div>
</template>

<script>
  import { listQuestion, getQuestion, delQuestion, addQuestion, updateQuestion, exportQuestion } from "@/api/exams/question";
  import { listData } from "@/api/system/dict/data";
  import { listSubject } from "@/api/exams/subject";
  import Editor from '@/components/Editor';
  export default {
    name: "Question",
    components: {
      Editor
    },
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
        questionList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          subjectId: undefined,
          createDate: undefined,
          updateDate: undefined,
          answer: undefined,
          content: undefined,
          questionType: undefined,
          options: undefined,
          analysis: undefined,
          summarize: undefined,
          languagePointsId: undefined
        },
        questionTypes:[],
        subjects:[],
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          subjectId: [
            { required: true, message: "课程名称不能为空", trigger: "blur" }
          ],
        },
        previewQuestion: {
          content:undefined
        },
        openPreview: false
      };
    },
    created() {
      this.getList();
      // this.getTypeList();
      this.getDicts("sys_question_type").then(response => {
        this.questionTypes = response.data
        console.log(this.questionTypes)
      });
      listSubject().then(response => {
        this.subjects = response.rows
      });
    },
    methods: {
      /** 查询【请填写功能名称】列表 */
      getList() {
        this.loading = true;
        listQuestion(this.queryParams).then(response => {
          this.questionList = response.rows;
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
          subjectId: undefined,
          createDate: undefined,
          updateDate: undefined,
          answer: undefined,
          content: undefined,
          questionType: undefined,
          options: undefined,
          analysis: undefined,
          summarize: undefined,
          languagePointsId: undefined
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
        this.single = selection.length!=1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getQuestion(id).then(response => {
          response.data.questionType = parseInt(response.data.questionType)
          this.form = response.data;
          this.form.subjectName = this.form.grandName+"-"+this.form.subjectName
          this.open = true;
          this.title = "编辑";
        });
      },
      preview(row) {
        this.reset();
        const id = row.id || this.ids
        getQuestion(id).then(response => {
          this.previewQuestion = response.data;
          this.openPreview = true
        });
      },
      /** 提交按钮 */
      submitForm: function() {
        console.log(this.form)
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != undefined) {
              updateQuestion(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess("修改成功");
                  this.open = false;
                  this.getList();
                }
              });
            } else {
              addQuestion(this.form).then(response => {
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
        }).then(function() {
          return delQuestion(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams;
        this.$confirm('是否确认导出所有【请填写功能名称】数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportQuestion(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
      },
      /** 查询字典数据列表 */
      getTypeList() {
        let params = {dictType:"sys_question_type"}
        listData(params).then(response => {
          this.questionTypes = response.rows
          console.log(this.questionTypes)
        });
      },
    }
  };
</script>
