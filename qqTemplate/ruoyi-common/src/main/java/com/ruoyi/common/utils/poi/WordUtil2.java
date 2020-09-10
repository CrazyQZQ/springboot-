package com.ruoyi.common.utils.poi;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ReUtil;
import com.deepoove.poi.NiceXWPFDocument;
import com.deepoove.poi.XWPFTemplate;
import com.deepoove.poi.config.Configure;
import com.deepoove.poi.data.MiniTableRenderData;
import com.deepoove.poi.data.PictureRenderData;
import com.deepoove.poi.data.TextRenderData;
import com.deepoove.poi.policy.AbstractRenderPolicy;
import com.deepoove.poi.policy.PictureRenderPolicy;
import com.deepoove.poi.policy.TextRenderPolicy;
import com.deepoove.poi.render.RenderContext;
import com.deepoove.poi.template.run.RunTemplate;
import com.deepoove.poi.util.TableTools;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xwpf.usermodel.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STMerge;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;

public class WordUtil2 {
    public static void main(String[] args) throws IOException {
        String html = FileUtil.readString("test2.html", "utf-8");

        //配置
        Configure config = Configure.newBuilder().build();
        config.customPolicy("resultHtml", createHtmlRenderPolicy());


        //创建word模板对象
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", "标题");
        map.put("resultHtml", html);
        XWPFTemplate template = XWPFTemplate.compile(getResourceInputStream("/out_template.docx"), config).render(map);
        template.writeToFile("D:\\qq\\新建文件夹\\images\\demo.docx");
        template.close();

    }

    public static void demo(String html){
        try {
            //配置
            Configure config = Configure.newBuilder().build();
            config.customPolicy("resultHtml", createHtmlRenderPolicy());
            //创建word模板对象
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("top", "TOPPPPP");
            map.put("resultHtml", html);
            map.put("buttom", "buttommmmmmmmmmmmmm");
            XWPFTemplate template = XWPFTemplate.compile(getResourceInputStream("/out_template.docx"), config).render(map);
            template.writeToFile("D:\\qq\\新建文件夹\\images\\demo.docx");
            template.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取资源文件的文件流
     *
     * @return
     */
    public static InputStream getResourceInputStream(String filePath) {
        InputStream in = FileUtil.class.getResourceAsStream(filePath);
        if (in != null) {
            return in;
        }
        return null;
    }

    /**
     * 创建测试用例过程记录的渲染策略：解析对应的html并输出到word
     * @author xuwangcheng
     * @date 2019/7/26 10:10
     * @param
     * @return {@link AbstractRenderPolicy}
     */
    private static AbstractRenderPolicy createHtmlRenderPolicy() {
        return new AbstractRenderPolicy() {
            @Override
            protected void afterRender(RenderContext context) {
                // 清空模板标签所在段落
                clearPlaceholder(context, true);
            }

            @Override
            public void doRender(RunTemplate runTemplate, Object data, XWPFTemplate template) throws Exception {
                if (data == null || StringUtils.isBlank(data.toString())) {
                    return;
                }

                //获得Apache POI增强类NiceXWPFDocument
                NiceXWPFDocument doc = template.getXWPFDocument();


                String html = data.toString();
                html = html.replaceAll("&gt;", ">")
                        .replaceAll("&lt;", "<")
                        .replaceAll("&nbsp;", " ")
                        .replaceAll("\\n", "")
                        .replaceAll("<br>", "\n");
                org.jsoup.nodes.Document htmlDoc = Jsoup.parse(html);

                Elements nodes = htmlDoc.body().children();
                XWPFParagraph xwpfParagraph = doc.insertNewParagraph(runTemplate.getRun().getParagraph().getCTP().newCursor());

                ListIterator<Element> itr = nodes.listIterator();
                while (itr.hasNext()) {
                    Element e = itr.next();
                    xwpfParagraph = parseHtmlToWord(e, doc, xwpfParagraph, true);
                }
            }
        };
    }


    /**
     * 转换整个html内容为word内容
     * @author xuwangcheng
     * @date 2019/7/29 18:46
     * @param ele ele
     * @param doc doc
     * @param xwpfParagraph xwpfParagraph
     * @return {@link XWPFParagraph}
     */
    private static XWPFParagraph parseHtmlToWord(Element ele, NiceXWPFDocument doc, XWPFParagraph xwpfParagraph
            , boolean isParent) throws Exception {

        //处理img图片
        if ("img".equals(ele.tagName())) {
            parseImgToWord(ele.attr("src"), xwpfParagraph);

            return xwpfParagraph;
        }

        //处理table标签
        if ("table".equals(ele.tagName())) {
            xwpfParagraph = doc.insertNewParagraph(getPrevXWPFParagraph(doc, xwpfParagraph).getCTP().newCursor());
            parseTableToWord(doc, ele, xwpfParagraph.createRun());
            //有表格的话新建段落
            //xwpfParagraph = doc.createParagraph();
            return xwpfParagraph;
        }


        //处理<sup>标签 上标
        if ("sup".equalsIgnoreCase(ele.tagName())) {
            XWPFRun run = xwpfParagraph.createRun();
            run.setText(ele.text());
            // 设置字体加粗;
            run.setBold(true);
            // 设置字体大小;
            run.setFontSize(12);
            run.setFontFamily("Times New Roman", XWPFRun.FontCharRange.ascii);
            run.setFontFamily("宋体", XWPFRun.FontCharRange.eastAsia);
            run.setSubscript(VerticalAlign.SUPERSCRIPT);

            TextRenderPolicy.Helper.renderTextRun(run, new TextRenderData(ele.text()));
            return xwpfParagraph;
        }

        //处理其他文本标签
        String text = ele.ownText();
        boolean continueItr = true;
        //span标签默认全部为文字，不再继续迭代
        if ("span".equalsIgnoreCase(ele.tagName())) {
            text = ele.wholeText();
            continueItr = false;
        }

//        boolean enabledBreak = (isParent || StringUtils.isNotBlank(ele.text()))
//                && ReUtil.isMatch("(p|h[12345]|li|img)", ele.tagName());
        boolean enabledBreak = ReUtil.isMatch("(p|h[12345]|li|img)", ele.tagName());
        if (enabledBreak) {
            XWPFRun run = xwpfParagraph.createRun();
            run.addBreak();
        }

        if (StringUtils.isNotBlank(text)) {
            XWPFRun run = xwpfParagraph.createRun();
            TextRenderPolicy.Helper.renderTextRun(run, new TextRenderData(text));
        }


        if (continueItr && ele.children().size() > 0) {
            ListIterator<Element> itr = ele.children().listIterator();
            while (itr.hasNext()) {
                Element me = itr.next();
                xwpfParagraph = parseHtmlToWord(me, doc, xwpfParagraph, false);
            }
        }

        return xwpfParagraph;
    }

    private static XWPFParagraph getPrevXWPFParagraph (NiceXWPFDocument doc, XWPFParagraph xwpfParagraph) {
        List<XWPFParagraph> xwpfParagraphs = doc.getXWPFDocument().getParagraphs();
        for (int i = 0;i < xwpfParagraphs.size();i++) {
            if (xwpfParagraphs.get(i).equals(xwpfParagraph)) {
                return xwpfParagraphs.get(i + 1);
            }
        }

        return xwpfParagraph;
    }


    /**
     * 转换图片为word内容
     * @author xuwangcheng
     * @date 2019/7/29 18:45
     * @param imgUrl imgUrl
     * @param xwpfParagraph xwpfParagraph
     */
    private static void parseImgToWord(String imgUrl, XWPFParagraph xwpfParagraph) throws Exception {
        //获取图片本地路径
        String imgRealPath = getImgRealPath(imgUrl);

        if (StringUtils.isBlank(imgRealPath) || !FileUtil.exist(imgRealPath)) {
            return;
        }

        //插入图片
        //获取图片对象
        BufferedImage img = ImageIO.read(new File(imgRealPath));

        //获得图片的宽
        int width = img.getWidth();
        //获得图片的高
        int height = img.getHeight();
        if (width > 600) {
            //获取比例
            int rate = (width / 600 ) + 1;
            width = width / rate - 20;
            height = height / rate;
        }
        PictureRenderData pictureRenderData = new PictureRenderData(width, height, imgRealPath);
        XWPFRun run = xwpfParagraph.createRun();
        PictureRenderPolicy.Helper.renderPicture(run, pictureRenderData);
    }


    /**
     * 通过imgUrl获取本地图片路径
     * @author xuwangcheng
     * @date 2019/11/21 9:47
     * @param imgUrl imgUrl
     * @return {@link String}
     */
    private static String getImgRealPath (String imgUrl) {
        //TODO 获取real_path
        if (imgUrl.startsWith("data:")) {
            imgUrl = imgUrl.replace("data:;base64,", "");
            imgUrl = imgUrl.split("base64,")[1];
            // base64转本地图片
            byte[] bytes = Base64.getDecoder().decode(imgUrl);
            String path = "D:\\qq\\新建文件夹\\images\\" + UUID.randomUUID().toString() + ".png";
            copyByte2File(bytes, new File(path));
            return path;
        } else {
            // 其他方式获取本地图片
        }
        return "I:\\img\\timg.jpg";
    }

    private static boolean copyByte2File(byte [] bytes,File file){
        FileOutputStream out = null;
        try {
            //转化为输入流
            ByteArrayInputStream in = new ByteArrayInputStream(bytes);

            //写出文件
            byte[] buffer = new byte[1024];

            out = new FileOutputStream(file);

            //写文件
            int len = 0;
            while ((len = in.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(out != null){
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    /**
     * 转换表格为word内容
     * @author xuwangcheng
     * @date 2019/7/29 18:45
     * @param doc doc
     * @param ele ele
     */
    private static void parseTableToWord(NiceXWPFDocument doc, Element ele, XWPFRun run) throws Exception {
        //简化表格html
        org.jsoup.nodes.Document tableDoc = Jsoup.parse(simplifyTable(ele.outerHtml()));
        Elements trList = tableDoc.getElementsByTag("tr");
        Elements tdList = trList.get(0).getElementsByTag("td");

        //创建表格
        XWPFTable xwpfTable = doc.insertNewTable(run, trList.size(), tdList.size());

        //设置样式
        TableTools.widthTable(xwpfTable, MiniTableRenderData.WIDTH_A4_FULL, tdList.size());
        TableTools.borderTable(xwpfTable, 4);

        //写入表格行和列内容
        Map<String, Boolean>[][] array = new Map[trList.size()][tdList.size()];
        for (int row = 0; row < trList.size(); row++) {
            Element trElement = trList.get(row);
            Elements tds = trElement.getElementsByTag("td");
            for (int col = 0; col < tds.size(); col++) {
                Element colElement = tds.get(col);
                String colspan = colElement.attr("colspan");
                String rowspan = colElement.attr("rowspan");
                String style = colElement.attr("style");
                StringBuilder styleSB = new StringBuilder();
                if (!StringUtils.isEmpty(colspan)) {
                    int colCount = Integer.parseInt(colspan);
                    for (int i = 0; i < colCount - 1; i++) {
                        array[row][col + i + 1] = new HashMap<String, Boolean>();
                        array[row][col + i + 1].put("mergeCol", true);
                    }
                }
                if (!StringUtils.isEmpty(rowspan)) {
                    int rowCount = Integer.parseInt(rowspan);
                    for (int i = 0; i < rowCount - 1; i++) {
                        array[row + i + 1][col] = new HashMap<String, Boolean>();
                        array[row + i + 1][col].put("mergeRow", true);
                    }
                }
                XWPFTableCell tableCell = xwpfTable.getRow(row).getCell(col);
                if (StringUtils.isEmpty(colspan)) {
                    if (col == 0) {
                        if (tableCell.getCTTc().getTcPr() == null) {
                            tableCell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.RESTART);
                        } else {
                            if (tableCell.getCTTc().getTcPr().getHMerge() == null) {
                                tableCell.getCTTc().getTcPr().addNewHMerge().setVal(STMerge.RESTART);
                            } else {
                                tableCell.getCTTc().getTcPr().getHMerge().setVal(STMerge.RESTART);
                            }
                        }
                    } else {
                        if (array[row][col] != null && array[row][col].get("mergeCol") != null && array[row][col].get("mergeCol")) {
                            if (tableCell.getCTTc().getTcPr() == null) {
                                tableCell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.CONTINUE);
                            } else {
                                if (tableCell.getCTTc().getTcPr().getHMerge() == null) {
                                    tableCell.getCTTc().getTcPr().addNewHMerge().setVal(STMerge.CONTINUE);
                                } else {
                                    tableCell.getCTTc().getTcPr().getHMerge().setVal(STMerge.CONTINUE);
                                }
                            }
                            continue;
                        } else {
                            if (tableCell.getCTTc().getTcPr() == null) {
                                tableCell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.RESTART);
                            } else {
                                if (tableCell.getCTTc().getTcPr().getHMerge() == null) {
                                    tableCell.getCTTc().getTcPr().addNewHMerge().setVal(STMerge.RESTART);
                                } else {
                                    tableCell.getCTTc().getTcPr().getHMerge().setVal(STMerge.RESTART);
                                }
                            }
                        }
                    }
                } else {
                    if (tableCell.getCTTc().getTcPr() == null) {
                        tableCell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.RESTART);
                    } else {
                        if (tableCell.getCTTc().getTcPr().getHMerge() == null) {
                            tableCell.getCTTc().getTcPr().addNewHMerge().setVal(STMerge.RESTART);
                        } else {
                            tableCell.getCTTc().getTcPr().getHMerge().setVal(STMerge.RESTART);
                        }
                    }
                }
                if (StringUtils.isEmpty(rowspan)) {
                    if (array[row][col] != null && array[row][col].get("mergeRow") != null && array[row][col].get("mergeRow")) {
                        if (tableCell.getCTTc().getTcPr() == null) {
                            tableCell.getCTTc().addNewTcPr().addNewVMerge().setVal(STMerge.CONTINUE);
                        } else {
                            if (tableCell.getCTTc().getTcPr().getVMerge() == null) {
                                tableCell.getCTTc().getTcPr().addNewVMerge().setVal(STMerge.CONTINUE);
                            } else {
                                tableCell.getCTTc().getTcPr().getVMerge().setVal(STMerge.CONTINUE);
                            }
                        }
                        continue;
                    } else {
                        if (tableCell.getCTTc().getTcPr() == null) {
                            tableCell.getCTTc().addNewTcPr().addNewVMerge().setVal(STMerge.RESTART);
                        } else {
                            if (tableCell.getCTTc().getTcPr().getVMerge() == null) {
                                tableCell.getCTTc().getTcPr().addNewVMerge().setVal(STMerge.RESTART);
                            } else {
                                tableCell.getCTTc().getTcPr().getVMerge().setVal(STMerge.RESTART);
                            }
                        }
                    }
                } else {
                    if (tableCell.getCTTc().getTcPr() == null) {
                        tableCell.getCTTc().addNewTcPr().addNewVMerge().setVal(STMerge.RESTART);
                    } else {
                        if (tableCell.getCTTc().getTcPr().getVMerge() == null) {
                            tableCell.getCTTc().getTcPr().addNewVMerge().setVal(STMerge.RESTART);
                        } else {
                            tableCell.getCTTc().getTcPr().getVMerge().setVal(STMerge.RESTART);
                        }
                    }
                }
                tableCell.removeParagraph(0);
                XWPFParagraph paragraph = tableCell.addParagraph();
                paragraph.setStyle(styleSB.toString());
                if (!StringUtils.isEmpty(style) && style.contains("text-align:center")) {
                    paragraph.setAlignment(ParagraphAlignment.CENTER);
                }

                parseHtmlToWord(colElement, doc, paragraph, true);
            }
        }
    }

    /**
     * 简化html中的表格dom
     * @author xuwangcheng
     * @date 2019/7/29 18:39
     * @param tableContent tableContent
     * @return {@link String}
     */
    private static String simplifyTable(String tableContent) {
        if (StringUtils.isEmpty(tableContent)) {
            return null;
        }
        org.jsoup.nodes.Document tableDoc = Jsoup.parse(tableContent);
        Elements trElements = tableDoc.getElementsByTag("tr");
        if (trElements != null) {
            Iterator<Element> eleIterator = trElements.iterator();
            Integer rowNum = 0;
            // 针对于colspan操作
            while (eleIterator.hasNext()) {
                rowNum++;
                Element trElement = eleIterator.next();
                //去除所有样式
                trElement.removeAttr("class");
                Elements tdElements = trElement.getElementsByTag("td");
                List<Element> tdEleList = covertElements2List(tdElements);
                for (int i = 0; i < tdEleList.size(); i++) {
                    Element curTdElement = tdEleList.get(i);
                    //去除所有样式
                    curTdElement.removeAttr("class");
                    Element ele = curTdElement.clone();
                    String colspanValStr = curTdElement.attr("colspan");
                    if (!StringUtils.isEmpty(colspanValStr)) {
                        ele.removeAttr("colspan");
                        Integer colspanVal = Integer.parseInt(colspanValStr);
                        for (int k = 0; k < colspanVal - 1; k++) {
                            curTdElement.after(ele.outerHtml());
                        }
                    }
                }
            }
            // 针对于rowspan操作
            List<Element> trEleList = covertElements2List(trElements);
            Element firstTrEle = trElements.first();
            Elements tdElements = firstTrEle.getElementsByTag("td");
            Integer tdCount = tdElements.size();
            //获取该列下所有单元格
            for (int i = 0; i < tdElements.size(); i++) {
                for (Element trElement : trEleList) {
                    List<Element> tdElementList = covertElements2List(trElement.getElementsByTag("td"));
                    try {
                        tdElementList.get(i);
                    } catch (Exception e) {
                        continue;
                    }
                    Node curTdNode = tdElementList.get(i);
                    Node cNode = curTdNode.clone();
                    String rowspanValStr = curTdNode.attr("rowspan");
                    if (!StringUtils.isEmpty(rowspanValStr)) {
                        cNode.removeAttr("rowspan");
                        Element nextTrElement = trElement.nextElementSibling();
                        Integer rowspanVal = Integer.parseInt(rowspanValStr);
                        for (int j = 0; j < rowspanVal - 1; j++) {
                            Node tempNode = cNode.clone();
                            List<Node> nodeList = new ArrayList<Node>();
                            nodeList.add(tempNode);
                            if (j > 0) {
                                nextTrElement = nextTrElement.nextElementSibling();
                            }
                            Integer indexNum = i + 1;
                            if (i == 0) {
                                indexNum = 0;
                            }
                            if (indexNum.equals(tdCount)) {
                                nextTrElement.appendChild(tempNode);
                            } else {
                                nextTrElement.insertChildren(indexNum, nodeList);
                            }
                        }
                    }
                }
            }
        }
        Element tableEle = tableDoc.getElementsByTag("table").first();
        String tableHtml = tableEle.outerHtml();

        return tableHtml;
    }

    /**
     * 转换Elements为list
     * @author xuwangcheng
     * @date 2019/7/29 18:40
     * @param curElements curElements
     * @return {@link List}
     */
    private static List<Element> covertElements2List(Elements curElements){
        List<Element> elementList = new ArrayList<Element>();
        Iterator<Element> eleIterator = curElements.iterator();
        while(eleIterator.hasNext()){
            Element curlement = eleIterator.next();
            elementList.add(curlement);
        }
        return elementList;
    }
}
