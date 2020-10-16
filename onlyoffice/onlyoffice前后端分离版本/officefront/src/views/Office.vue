<template>
  <div class="Office">
    <div id="iframeEditor"></div>
  </div>
</template>
<script>
export default {
  name: "Office",
  data() {
    return {
      appUrl: "",
      config: {},
    };
  },
  created() {},
  mounted() {
    this.init();
  },
  methods: {
    init() {
      var innerAlert = function (message) {
        if (console && console.log) console.log(message);
      };

      var onReady = function () {
        innerAlert("Document editor ready");
      };

      var onDocumentStateChange = function (event) {
        var title = document.title.replace(/\*$/g, "");
        document.title = title + (event.data ? "*" : "");
      };

      var onRequestEditRights = function () {
        location.href = location.href.replace(RegExp("action=view&?", "i"), "");
      };

      var onError = function (event) {
        if (event) innerAlert(event.data);
      };

      var onOutdatedVersion = function (event) {
        location.reload(true);
      };
      this.axios.get("/api/office/create?filename=new.pptx").then((res) => {
        console.log(res.data);
        this.config = res.data.data;
        var docEditor = new DocsAPI.DocEditor("iframeEditor", {
          width: "100%",
          height: "100%",
          type: "desktop",
          documentType: this.config.documentType,
          document: this.config.doc,
          editorConfig: this.config.editorConfig,
          events: {
            onReady: onReady,
            onDocumentStateChange: onDocumentStateChange,
            onRequestEditRights: onRequestEditRights,
            onError: onError,
            onOutdatedVersion: onOutdatedVersion,
          },
        });
        console.log(docEditor);
      });
    },
  },
};
</script>
<style lang="less" scoped>
.Office {
  height: 100%;
}
</style>
