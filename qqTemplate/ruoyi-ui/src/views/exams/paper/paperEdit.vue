<template>
  <el-row class="app-container">
    <el-row class="tool-bar">
      <el-col :span="20" class="paper-prop">
        <span>学校：</span>
        <el-select v-model="paper.schoolId" placeholder="请选择学校" size="small">
          <el-option
            v-for="item in schools"
            :key="item.deptId"
            :label="item.deptName"
            :value="item.deptId"
          ></el-option>
        </el-select>
        <span>科目：</span>
        <el-select v-model="paper.subjectId" placeholder="请选择科目" size="small">
          <el-option
            v-for="item in subjects"
            :key="item.subjectId"
            :label="item.grandName + '-' + item.subjectName"
            :value="item.subjectId"
          ></el-option>
        </el-select>
        <span>标题：</span>
        <el-input v-model="paper.name" placeholder="请填写标题" size="small"></el-input>
        <span>总分：</span>
        <el-input v-model="paper.paperScore" placeholder="请填写总分" size="small"></el-input>
      </el-col>
      <el-col :span="1.5" style="margin-right: 15px">
        <el-button
          type="success"
          icon="el-icon-plus"
          size="mini"
          @click="open = true"
          v-hasPermi="['system:paper:add']"
          :disabled="!paper.schoolId || !paper.subjectId"
        >新增模块</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-check"
          size="mini"
          @click="submitPaper"
          v-hasPermi="['system:paper:add']"
        >提交</el-button>
      </el-col>
    </el-row>
    <el-row class="paper-info">
      <el-row v-for="(part,index) in parts" :key="index" class="part-item">
        <el-row class="part-info">
          <span>{{index + 1}}、</span>
          <span>{{findQuestionType(part.questionType)}}</span>
          <span>({{part.discrib}},共{{part.partScore}}分)</span>
          <el-button
            type="success"
            icon="el-icon-plus"
            size="mini"
            @click="addQuestion(part.questionType,index)"
            v-hasPermi="['system:paper:add']"
          >新增试题</el-button>
          <el-button
            type="danger"
            icon="el-icon-plus"
            size="mini"
            @click="parts.splice(index)"
            v-hasPermi="['system:paper:add']"
          >删除模块</el-button>
        </el-row>
        <el-row class="part-questions">
          <el-row v-for="(question,idx) in part.questions" :key="idx" class="question-item">
            <span>
              ({{idx+1}})&nbsp;&nbsp; 标题：{{findQuestion(question.id).title}} &nbsp;&nbsp;&nbsp;题目分数： {{question.questionScore}}分
              <!-- ({{idx+1}})  ---- {{question.questionScore}}分 -->
            </span>
            <el-button
              @click="questions.splice(idx)"
              size="mini"
              type="danger"
              icon="el-icon-delete"
              circle
            ></el-button>
          </el-row>
        </el-row>
      </el-row>
    </el-row>
    <!-- 添加模块对话框 -->
    <el-dialog title="添加模块" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="newPart" :model="newPart" :rules="partRules" label-width="80px">
        <el-form-item label="题型" prop="questionType">
          <el-select v-model="newPart.questionType" placeholder="请选择题型" size="small">
            <el-option
              v-for="item in questionTypes"
              :key="item.dictCode"
              :label="item.dictLabel"
              :value="item.dictCode"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="描述" prop="discrib">
          <el-input v-model="newPart.discrib" placeholder="请输入描述" type="textarea" />
        </el-form-item>
        <el-form-item label="模块总分" prop="partScore">
          <el-input v-model="newPart.partScore" placeholder="请输入模块总分" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="partSubmit">确 定</el-button>
        <el-button @click="cancelAddPart">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加试题对话框 -->
    <el-dialog title="添加试题" :visible.sync="openQuestion" width="500px" append-to-body>
      <el-form ref="newPart" :model="newQuestion" :rules="questionRules" label-width="80px">
        <el-form-item label="题目" prop="id">
          <el-select v-model="newQuestion.id" placeholder="请选择题目" size="small">
            <el-option
              v-for="item in questions"
              :key="item.id"
              :label="item.title"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="试题分数" prop="questionScore">
          <el-input v-model="newQuestion.questionScore" placeholder="试题分数" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="questionSubmit">确 定</el-button>
        <el-button @click="cancelAddQuestion">取 消</el-button>
      </div>
    </el-dialog>
  </el-row>
</template>

<script>
import { listDept } from "@/api/system/dept";
import { listSubject } from "@/api/exams/subject";
import { listQuestion, getQuestion } from "@/api/exams/question";
import { getPaper, updatePaper, addPaper } from "@/api/exams/paper";

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
        questionType: "",
        partScore: undefined,
        questions: []
      },
      // 表单校验
      partRules: {
        questionType: [
          { required: true, message: "题型不能为空", trigger: "change" }
        ],
        partScore: [
          {
            pattern: /^([0-9]{1,2}|100)$/,
            message: "请输入正确的分数",
            trigger: "blur"
          }
        ]
      },
      // 表单校验
      questionRules: {
        id: [{ required: true, message: "题型不能为空", trigger: "change" }],
        questionScore: [
          {
            pattern: /^([0-9]{1,2}|100)$/,
            message: "请输入正确的分数",
            trigger: "blur"
          }
        ]
      },
      open: false,
      openQuestion: false,
      parts: [],
      // 所有试题
      allQuestions: [],
      // 待选择的试题
      questions: [],
      newQuestion: {
        id: undefined,
        questionScore: undefined,
        sort: -1
      },
      curPartIdx: -1
    };
  },
  created() {
    this.getData();
  },
  mounted() {
    let id = this.$route.params.id;
    if (id) {
      getPaper(id).then(response => {
        this.paper = this.handPaper(response.data);
        this.parts = this.paper.parts;
      });
    }
  },
  methods: {
    getData() {
      this.getDicts("sys_question_type").then(response => {
        this.questionTypes = response.data;
      });
      listDept({ parentId: 101 }).then(response => {
        this.schools = response.data;
      });
      listSubject().then(response => {
        this.subjects = response.rows;
      });
      listQuestion().then(res => {
        this.allQuestions = res.rows;
      });
    },
    handPaper(data) {
      let paper = { parts: [], content: "" };
      paper.id = data.id;
      paper.schoolId = data.schoolId;
      paper.grandId = data.grandId;
      paper.subjectId = data.subjectId;
      paper.name = data.name;
      paper.createTime = data.createTime;
      paper.updateTime = data.updateTime;
      data.paperParts.forEach(paperPart => {
        let part = JSON.parse(JSON.stringify(paperPart.part));
        part.sort = paperPart.sort
        part.partScore = paperPart.partScore
        part.questions = [];
        paperPart.part.partQuestions.forEach((partQuestion, index) => {
          let question = JSON.parse(JSON.stringify(partQuestion.question));
          question.sort = partQuestion.sort
          question.questionScore = partQuestion.questionScore
          part.questions.push(question);
        });
        paper.parts.push(part);
      });
      return paper;
    },
    resetPart() {
      this.newPart = {
        questionType: "",
        partScore: undefined,
        questions: []
      };
    },
    resetQuestion() {
      this.newQuestion = {
        id: undefined,
        questionScore: undefined
      };
    },
    partSubmit() {
      this.$refs["newPart"].validate(valid => {
        if (valid) {
          this.open = false;
          this.newPart.sort = this.parts.length + 1;
          this.parts.push(this.newPart);
          this.resetPart();
        }
      });
    },
    cancelAddPart() {
      this.open = false;
      this.resetPart();
    },
    findQuestionType(id) {
      let question = this.questionTypes.find(e => e.dictCode == id);
      return question ? question.dictLabel : null;
    },
    findQuestion(id) {
      let question = this.allQuestions.find(e => e.id == id);
      return question;
    },
    addQuestion(questionType,index) {
      this.openQuestion = true
      this.curPartIdx = index
      this.questions = this.allQuestions.filter(e => e.questionType==questionType)
      console.log(this.questions)
      // listQuestion({questionType:questionType}).then(res => {
      //   this.questions = res.rows;
      // });
    },
    questionSubmit() {
      this.openQuestion = false;
      this.newQuestion.sort = this.parts[this.curPartIdx].questions.length + 1;
      this.parts[this.curPartIdx].questions.push(JSON.parse(JSON.stringify(this.newQuestion)));
    },
    cancelAddQuestion() {
      this.openQuestion = false;
      this.resetPart();
    },
    submitPaper() {
      this.paper.grandId = this.subjects.find(
        e => e.subjectId == this.paper.subjectId
      ).grandId;
      this.paper.parts = this.parts;
      console.log(this.paper);
      if (this.paper.id) {
        updatePaper(this.paper).then(response => {
          if (response.code === 200) {
            this.msgSuccess("修改成功");
          }
        });
      } else {
        addPaper(this.paper).then(response => {
          if (response.code === 200) {
            this.msgSuccess("新增成功");
          }
        });
      }
    }
  }
};
</script>
<style scoped>
.app-container {
  height: 100%;
}

.tool-bar {
  height: 40px;
  line-height: 40px;
  margin-bottom: 10px;
}

.tool-bar .paper-prop > .el-input {
  width: 200px;
}

.paper-info {
  height: calc(100% - 50px);
}

.paper-info .part-item {
  width: 80%;
  margin: 5px auto;
  border: 1px solid #ccc6c6;
  padding: 10px;
  transition: all 0.5s;
}

.paper-info .part-item:hover {
  box-shadow: 3px 4px 1px 1px #efefef;
}

.paper-info .part-item .part-info {
  height: 35px;
  line-height: 35px;
}

.paper-info .part-item .part-info > span {
  margin-right: 10px;
}

.paper-info .part-item .question-item {
  height: 35px;
  line-height: 35px;
  padding-left: 10px;
  border-bottom: 1px solid #efefef;
  transition: all 0.5s;
}

.paper-info .part-item .question-item > span {
  margin-right: 15px;
}

.paper-info .part-item .question-item:hover {
  background-color: lightgray;
}
</style>
