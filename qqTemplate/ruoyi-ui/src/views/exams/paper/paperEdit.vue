<template>
  <el-row class="app-container">
    <el-row class="tool-bar">
      <el-col :span="10">
        <span>学校：</span>
        <el-select v-model="paper.schoolId" placeholder="请选择学校" size="small">
          <el-option
            v-for="item in schools"
            :key="item.deptId"
            :label="item.deptName"
            :value="item.deptId">
          </el-option>
        </el-select>
        <span>科目：</span>
        <el-select v-model="paper.subjectId" placeholder="请选择科目" size="small">
          <el-option
            v-for="item in subjects"
            :key="item.subjectId"
            :label="item.grandName + '-' + item.subjectName"
            :value="item.subjectId">
          </el-option>
        </el-select>
      </el-col>
      <el-col :span="1.5" style="margin-right: 15px">
        <el-button
          type="success"
          icon="el-icon-plus"
          size="mini"
          @click="open = true"
          v-hasPermi="['system:paper:add']"
        >新增模块
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-check"
          size="mini"
          @click=""
          v-hasPermi="['system:paper:add']"
        >提交
        </el-button>
      </el-col>
    </el-row>
    <el-row class="paper-info">
      <el-row v-for="(part,index) in parts" :key="index" class="part-item">
        <el-col :span="1.5" style="margin-right: 15px">
          {{part.discrib}}
<!--          <el-button-->
<!--            type="success"-->
<!--            icon="el-icon-plus"-->
<!--            size="mini"-->
<!--            @click="open = true"-->
<!--            v-hasPermi="['system:paper:add']"-->
<!--          >新增试题-->
<!--          </el-button>-->
        </el-col>
      </el-row>
    </el-row>
    <!-- 添加或修改【请填写功能名称】对话框 -->
    <el-dialog title="添加模块" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="newPart" :model="newPart" :rules="rules" label-width="80px">
        <el-form-item label="题型" prop="questionType">
          <el-select v-model="newPart.questionType" placeholder="请选择题型" size="small">
            <el-option
              v-for="item in questionTypes"
              :key="item.dictCode"
              :label="item.dictLabel"
              :value="item.dictCode">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="描述" prop="discrib">
          <el-input v-model="newPart.discrib" placeholder="请输入描述" type="textarea"/>
        </el-form-item>
        <el-form-item label="模块总分" prop="score">
          <el-input v-model="newPart.score" placeholder="请输入模块总分" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="partSubmit">确 定</el-button>
        <el-button @click="cancelAddPart">取 消</el-button>
      </div>
    </el-dialog>
  </el-row>
</template>

<script>
  import {listDept} from "@/api/system/dept";
  import {listSubject} from "@/api/exams/subject";
  import {listPaper, getPaper, delPaper, addPaper, updatePaper, exportPaper} from "@/api/exams/paper";

  export default {
    name: "PaperEdit",
    data() {
      return {
        // 学校
        schools: [],
        // 科目
        subjects: [],
        // 题型
        questionTypes: [],
        paper: {},
        newPart: {
          questionType:''
        },
        // 表单校验
        rules: {
          questionType: [
            { required: true, message: "题型不能为空", trigger: "change" }
          ],
          score: [
            { pattern: /^([0-9]{1,2}|100)$/, message: "请输入正确的分数", trigger: "blur" }
          ]
        },
        open:false,
        parts:[]
      };
    },
    created() {
      this.getDate()
    },
    mounted() {
      let id = this.$route.params.id
      if (id) {
        getPaper(id).then(response => {
          this.paper = this.handPaper(response.data);
          console.log(this.paper)
        });
      }
    },
    methods: {
      getDate() {
        this.getDicts("sys_question_type").then(response => {
          this.questionTypes = response.data
        });
        listDept({parentId: 101}).then(response => {
          this.schools = response.data
        });
        listSubject().then(response => {
          this.subjects = response.rows
        });
      },
      handPaper(data) {
        let paper = {parts: [], content: ''}
        paper.id = data.id;
        paper.schoolId = data.schoolId;
        paper.grandId = data.grandId;
        paper.subjectId = data.subjectId;
        paper.name = data.name;
        paper.createDate = data.createDate;
        paper.updateDate = data.updateDate;
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
      resetPart(){
        this.newPart = {
          questionType:''
        }
      },
      partSubmit() {
        this.$refs["newPart"].validate(valid => {
          if (valid) {
            this.open = false
            this.parts.push(this.newPart)
            this.resetPart()
            console.log(this.parts)
          }
        });
      },
      cancelAddPart() {
        this.open = false
        this.resetPart()
      }
    }
  };
</script>
<style scoped>
  .app-container{
    height: 100%;
  }
  .tool-bar{
    height: 40px;
    line-height: 40px;
    margin-bottom: 10px;
  }
  .paper-info{
    height: calc(100% - 50px);
  }
  .paper-info .part-item{
    width: 80%;
    margin: 5px auto;
    border: 1px solid #ccc6c6;
    padding: 10px;
    transition: all 0.5s;
  }
  .paper-info .part-item:hover{
    box-shadow: 3px 4px 1px 1px #efefef;
  }
</style>
