<template>
  <div class="app-container">
    <el-col :span="20">
      <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small">
        <el-form-item label="科目">
          <el-select v-model="form.subjectId" placeholder="请选择科目">
            <el-option
              v-for="item in subjects"
              :key="item.subjectId"
              :label="item.grandName + '-' + item.subjectName"
              :value="item.subjectId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题"/>
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
          <Tinymce ref="editor" v-model="form.content" :height="300"/>
        </el-form-item>
        <el-form-item label="答案" prop="answer">
          <el-input v-model="form.answer" placeholder="请输入答案" type="textarea"/>
        </el-form-item>
        <el-form-item label="试题解析内容" prop="analysis">
          <el-input v-model="form.analysis" placeholder="请输入试题解析内容" type="textarea"/>
        </el-form-item>
        <el-form-item label="总结升华" prop="summarize">
          <el-input v-model="form.summarize" placeholder="请输入总结升华" type="textarea"/>
        </el-form-item>
      </el-form>
    </el-col>
    <el-col :span="4">
      <el-button type="primary" @click="submitForm">确 定</el-button>
      <el-button @click="cancel">取 消</el-button>
    </el-col>
  </div>
</template>

<script>
  import { listQuestion, getQuestion, delQuestion, addQuestion, updateQuestion, exportQuestion } from "@/api/exams/question";
  import Tinymce from '@/components/Tinymce'
  import { listSubject } from "@/api/exams/subject";
  export default {
    name: "Notice",
    components: {
      Tinymce
    },
    data() {
      return {
        // 表单参数
        form: {},
        questionTypes:[],
        subjects:[],
        // 表单校验
        rules: {
          subjectId: [
            { required: true, message: "科目名称不能为空", trigger: "change" }
          ],
          questionType: [
            { required: true, message: "题型不能为空", trigger: "change" }
          ],
          content: [
            { required: true, message: "试题内容不能为空", trigger: "blur" }
          ],
          answer: [
            { required: true, message: "答案不能为空", trigger: "blur" }
          ],
          title: [
            { required: true, message: "标题不能为空", trigger: "blur" }
          ],
        },
      };
    },
    created() {
      this.getDicts("sys_question_type").then(response => {
        this.questionTypes = response.data
      });
      listSubject().then(response => {
        this.subjects = response.rows
      });
    },
    mounted() {
      let id = this.$route.params.id
      if(id){
        getQuestion(id).then(response => {
          console.log(response)
          response.data.questionType = parseInt(response.data.questionType)
          this.form = response.data;
          this.form.subjectName = this.form.grandName+"-"+this.form.subjectName
        });
      }else {
        this.reset()
      }
    },
    methods: {
      // 取消按钮
      cancel() {
        this.$router.push({ name: 'Questions'})
      },
      // 表单重置
      reset() {
        this.form = {
          id: undefined,
          subjectId: undefined,
          createTime: undefined,
          updateTime: undefined,
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
      /** 提交按钮 */
      submitForm: function() {
        console.log(this.form)
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != undefined) {
              updateQuestion(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess("修改成功");
                  this.$router.push({ name: 'Questions'})
                }
              });
            } else {
              addQuestion(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess("新增成功");
                  this.$router.push({ name: 'Questions'})
                }
              });
            }
          }
        });
      },
    }
  };
</script>
