/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 11/09/2020 08:53:12
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exams_paper
-- ----------------------------
DROP TABLE IF EXISTS `exams_paper`;
CREATE TABLE `exams_paper`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名',
  `school_id` int(11) NOT NULL COMMENT '学校编号',
  `grand_id` int(11) NOT NULL COMMENT '年级编号',
  `subject_id` int(11) NOT NULL COMMENT '科目编号',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `paper_score` int(255) NULL DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exams_paper
-- ----------------------------
INSERT INTO `exams_paper` VALUES ('1', '期中', 103, 39, 1, '2020-09-08 00:00:00', '2020-09-08 00:00:00', 100);
INSERT INTO `exams_paper` VALUES ('49563499-256a-4414-959f-3d566909fcd9', '测试', 103, 39, 2, NULL, '2020-09-10 15:36:55', 100);
INSERT INTO `exams_paper` VALUES ('b5e5f4b4-5a82-4f09-8442-db93b4c7cf7c', '期末', 103, 40, 3, NULL, NULL, 100);

-- ----------------------------
-- Table structure for exams_paper_part
-- ----------------------------
DROP TABLE IF EXISTS `exams_paper_part`;
CREATE TABLE `exams_paper_part`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷编号',
  `part_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块编号',
  `sort` int(10) NOT NULL COMMENT '模块排序',
  `part_score` double(255, 0) NULL DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_part_paper`(`part_id`) USING BTREE,
  INDEX `fk_paper_part`(`paper_id`) USING BTREE,
  CONSTRAINT `fk_paper_part` FOREIGN KEY (`paper_id`) REFERENCES `exams_paper` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_part_paper` FOREIGN KEY (`part_id`) REFERENCES `exams_part` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exams_paper_part
-- ----------------------------
INSERT INTO `exams_paper_part` VALUES (1, '1', '1', 1, 50);
INSERT INTO `exams_paper_part` VALUES (2, '1', '2', 2, 50);
INSERT INTO `exams_paper_part` VALUES (11, 'b5e5f4b4-5a82-4f09-8442-db93b4c7cf7c', 'ebc4390a-5c15-4090-8241-d9f5b502af43', 1, NULL);
INSERT INTO `exams_paper_part` VALUES (12, 'b5e5f4b4-5a82-4f09-8442-db93b4c7cf7c', '93815289-6d61-471b-b879-4ca45ed6fb6a', 2, NULL);
INSERT INTO `exams_paper_part` VALUES (14, '49563499-256a-4414-959f-3d566909fcd9', '918b023d-d144-4fde-9190-922465c5dc69', 1, 50);

-- ----------------------------
-- Table structure for exams_part
-- ----------------------------
DROP TABLE IF EXISTS `exams_part`;
CREATE TABLE `exams_part`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_type` int(11) NOT NULL COMMENT '题型',
  `discrib` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exams_part
-- ----------------------------
INSERT INTO `exams_part` VALUES ('1', 45, '每小题5分');
INSERT INTO `exams_part` VALUES ('2', 47, '每小题8分');
INSERT INTO `exams_part` VALUES ('918b023d-d144-4fde-9190-922465c5dc69', 45, 'www');
INSERT INTO `exams_part` VALUES ('93815289-6d61-471b-b879-4ca45ed6fb6a', 46, 'ww');
INSERT INTO `exams_part` VALUES ('ebc4390a-5c15-4090-8241-d9f5b502af43', 45, NULL);

-- ----------------------------
-- Table structure for exams_part_question
-- ----------------------------
DROP TABLE IF EXISTS `exams_part_question`;
CREATE TABLE `exams_part_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块编号',
  `question_id` int(11) NOT NULL COMMENT '试题编号',
  `sort` int(11) NOT NULL COMMENT '试题排序',
  `question_score` double(255, 0) NULL DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_part_question`(`part_id`) USING BTREE,
  INDEX `fk_question_part`(`question_id`) USING BTREE,
  CONSTRAINT `fk_part_question` FOREIGN KEY (`part_id`) REFERENCES `exams_part` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_question_part` FOREIGN KEY (`question_id`) REFERENCES `exams_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exams_part_question
-- ----------------------------
INSERT INTO `exams_part_question` VALUES (1, '1', 1, 1, 10);
INSERT INTO `exams_part_question` VALUES (2, '2', 5, 2, 10);
INSERT INTO `exams_part_question` VALUES (6, 'ebc4390a-5c15-4090-8241-d9f5b502af43', 1, 1, 10);
INSERT INTO `exams_part_question` VALUES (7, 'ebc4390a-5c15-4090-8241-d9f5b502af43', 5, 2, 50);
INSERT INTO `exams_part_question` VALUES (8, '93815289-6d61-471b-b879-4ca45ed6fb6a', 5, 1, 10);
INSERT INTO `exams_part_question` VALUES (10, '918b023d-d144-4fde-9190-922465c5dc69', 1, 1, 10);

-- ----------------------------
-- Table structure for exams_question
-- ----------------------------
DROP TABLE IF EXISTS `exams_question`;
CREATE TABLE `exams_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL COMMENT '课程名称',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题内容',
  `question_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题类型',
  `options` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题选项（多个以逗号隔开）',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题解析内容',
  `summarize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总结升华',
  `language_points_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exams_question
-- ----------------------------
INSERT INTO `exams_question` VALUES (1, 1, '2020-09-07 00:00:00', '2020-09-10 08:51:19', 'A', '<p>这是一个选择题</p>\n<p>A、sss</p>\n<p>B、ddds</p>', '45', 'd\'d\'d', NULL, NULL, NULL, 'test');
INSERT INTO `exams_question` VALUES (5, 1, NULL, '2020-09-09 14:06:42', '噗噗噗噗噗', '<p>看图写话</p>\n<p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAKHKE07oe4ukJuL2bZkiRt31j3HoPfU3ssLjcekC2tkhQ+2rvK+ZphQ13d21iwu5unktNIEqWo7Cun42LHCAyJu6zUs0k7tz9kTI86iuqdA2ernUnK5bJi2ZaUlm1trt23a7Un9a52akl0pgcqVHlG5gmCHdjl8dkmkv2F6y+2slKVIcBkjqKPkedNAvgdxRQyHMduKIVWtcELDIfSRqLOZVKLjkSWsJkrrFJcSkEQs2ziFLBB6ExVVaywmn+Hmbew3DqzvcfZsutG4szfO9kp1RAcdQXFqPMUbq2HMpJJkqKh1PFQnW/DXDast7t5LSGMjcNJR25EpISQe8PGRt7jVliZrXz9eTv8AZXmkaoyDOGRmbiq+g7bj2XMyBjL1l7Dak09bZKxyLD1vdMc55C2nlC5BhRIJBBG6VFMdOYWBpm7v9PZK24eZ9w3DrePL+KyK3CpeQtmlBCg6Ckcr7aVsc+55+crEboTKsL6Nui3bJ631zjLbMOlzmt1IU4yq33USULQoLSSVGYI2AHgIpnjgrgzweatNO5jWecbvsbcm+xFrhcgt/MWvOhSTzuPqXyIKXFiXVd9KoAPKBVL4s0jE8QRujcRsOa79iK4+vqFf5mr42dlEQcjv/q/8VsZOxtsi2q0uVFTZBC2grlC0kRCo6g77dD4zUeueGnD68xrmHc0Zh27R11t9bbFmhmXEeouUAEKHQEGYkdCRVa6K1dd3uExeq8XqO/yIyVv9W9klMl1S+aVsOltCUl1IBQAhPVCiebrSDWnpQO6L16/p/MYFrJWltaNvMJs1Ft5Vw4gFLTwUqB1JlO4Ckd1RmuZy/wBL9YwZY/hMsNiNWbIo+w5CtJsXy2te7cFQ/wBKhPCexXa6N0vp5p3VDTqFvXNu6oizaj9SsmZ5hBCNgjdW3MeZJ6NfAiw4j5d/UGogHNP4R8NLZExfXMBXZextIKSr73MkeJIF0n6OnGHWSbvUwsrHBm/dW8kZh95Lyg4SokJ5FuRv1cAUeu8zXW/CrQdpwz0RjtJsPB922QXbp8JjtrhaipxfukwmdwlKR4VPW9fh8P6b8Di5HmTD5buz9SfT0HukmsvalNWEMspQy0hDaEAJQlKYCUjoAB0HsrK8oIKgCY/81lcvhyy4dTjZUXtANBfPEXB7RQJ+0fz/AO9GMviJkEUiS+CtSZgyaLafIjf313CSHZZ8OA5Umw1hfZm6TZY4W6niOYJeu2bcEewuqSCd+gk+ypxZcG+JFyhK2sKxB6EZC3VP8KzVXM3A8SB5g1vYDKFBaW0A+YSAaAGQjaRpPsf8KXU48FW03wV4koBP6EZJG0fTGh+aqsvh3w2x9hhA3q7RducoHVlbl12NyhaSe7yQpQSAIBEAzJ3nbm23yN20JZu3mz4BLhH5UwZ1BloHLl78EeVyv/Gi4+RiYsnmNiJ9yD/svHNkkFWAuocha8LsG+m1zGL0zYOKHMlN1ZsNcwHikqSAobjpUVy+ueF+MuFWdpofE5NIEh62t7bsjudgvlJPTwHjVHryd7ecv0y+ubjlkp7Z5S+WescxMTA+VbWn94oeZrTpBUEbW/YFSZjV+pxKneWz+Kzly0rE6TssMhskqFu4VFwGPWACUf7s+3qKlek7QLT2pH7NVnhnO0eCfbVyaTt+RhtMeAmsqMd2pZzWO7mymi7yo7CtThvppGVvQ/cIBtrUBxwEbKV9lP8AM+we2rlcWGkFZBISJ2Emo3w/xqcdpq3UUwu7/rCj5g+r/ugfM1JiYrrEMLceNsbRwstPKZXklIXdSZFAUq20VnLpI6FCrVvm9wdfSfmBVTcYOJQucC7p7J6XzOAuzcNOD9IOWZbLQJPaKUy+tIRsqTJKeXmKYFW5ldXadwd21YZbL29rcPILiEOKjuidz5DY9fKlWqLHSWpcE3mMhcWYZLJNlfqE8hcHdKenMJg8viR0q3wqilbJI012Temvbi5Mc8zCW3tXr291zTis1fY91qzORuCpDynFXCEkIYeSluQeTpIlQ8TBEnoOocLrDTl3ibe9Go8fcp7JIduUupSgrCghQJOwPOeUpO4Jgia55yer+BXC3JLttaa8stUZNctW+Awdqbu4W8SVQUtkhKzvCVlHU9ZqP5TV1zqrIIS96K+J01pJdwq5d/pdY8j1864FAON2QSGg4FEKUpZV1G/MQatMtseWRG0kn1Wi1qWDWp44MQEu33oAG/eiuyhB8qjWs+I2huHuPXk9bapxeFt0pKh9LuUoU5HghHrLO2yUgk+ArirGcDOMGp8jeYzglxFvdKYO6dduMljv0q/Y2doCrkbFu1bhR7wSvmGwMJkj1QZpr0dbPTK/oeM0EOImuss6EJyupSkYbHMwee5ftwpSl7gQhZcUo9OT1TVuwHMcQ7gKiytJdhyOjkcCW1ddr91aWf455vVrP6U0ve5HHYa9A7Nty2+i3H0ZQI7UlYDiZB5xyHmgCNzUf4PejZw11djclZ6lxVjk+wzJyouXS47d3CVqWtsPPKJU4nfkMqPOlHeEqJNm3Ho9vjTNv/rO7d6kt7Vttdy3bM2zDzo5edSWgkhsKAUAkbJ5pEEJixOH+jrfR2FbtVpaXfOISLt9EkuFJPKCTuYBiTudyetPT5OM3HLYavjjdXGXqWnx6cGYQqTYXVHtdnuDwq9zGg8E0GLS3xzWPbx5KGmbNtLLaR5BKQAB47AUrGncTaOM3JsmHrq3SUNXLjSS8hBPMUhcSBIBgECRVnazsw1dJfAgPp3PmobH8IqC5AgBQiuFePJdQggOO2Z3lg3V7JrS812RE1jzYCARcAK3PWiUuT40iNypDxiBJ6UbbXXOJJ+FcbfEeVdWCmyHDIg9DNZQzT0kQayvYnuaKQXx7r5wdsC4rfxNEouCDBMx40nDw5zBkydqKadkRMV9OOi2WQBtOmn+m494NFtXBESaSMvHbei2robDf2g0nLEpgp60/wBKKaf6UkZeIjcT5UW0/wDOehpKSLZFBtO2nztJoxp8KEGkjb3Tfaim3iI3pKSJEa6lMdOvkO91tbqgqAlsiT8yBVq4TVeStXmWxofN9iVJS5dLeskMtJJ3Wf6wVkASYSgnbYVT+lLoJukkme8NvlV04C0yV7csF7KsCwbUVqtUWY7R0RslTilKAH91AJ8xtTPh2OL8SqUff6Wp3H8vnfpvdWriuKvFLMtLs+H+hcRll2jTbQtrrJG0S0kmA646ErPLypUAkIlRG20kFP5X0ns66LbTo4fYdVuyhN+rJWV8/wBlcGZSyUuIDoH3iEz3TuFd2x9BaMxWi8L9Axlw9c9uovuXL4QHHJ3AhCUpCUjZIAGwkyoqUZPXVZnxEkNYPoVRZmVjSSuONEGt7c37891zVqDRvEbVmsQ3lbdpy/ZCUofWxysIZSFEDnQITMz1PrEQeleMV6JGtX9UfpjV3pF6wusQy6u4ssTinV2LdqSslCJLi0KQlBKZS2hRMGR0rpbl9lexXnxT5ellUB6I+Zrc+TEyFoDWsG1Dv6qGcPeDHDPhaytOhtI2OOuHQe3vSkvXlwSZJduHCp1cnfvKO5p/qrS+P1dhX8LkgpLT6Y7RATztn7ySoEA+2KbpMUDfaiw2NX2OQylpbOcoVyvPpQeUmAYJ6Tt76tccNIvuqVskvmB7Ceob33SHH4fSHDXGBLRt7FhSUMqfeWAt0oSeUEn1lQFGB7YFRDgQt6+s9W5u6uWnjldT3t5bBNwp0tWauUMolQBTsFKKAOUKWuJmTF9W60s+POr8Pw50DrHGowBx91m8lctoDtxfBhxppthCHE9y3Wp9C/pCQQ4kENqEFVMeG/DvWuldXt3d6Ozx8O9ryOoUlR3gHcEzKYMSOQT1mkMiON7HlzqcrvGigycSWWeWpeaPcf5V11kDyrB0FZWdVQo7rNE45lyN0u8o9kg/4VWWSIEz51ZuuHA1iGQTBU+IHn3VVVGTegEz51gvHsTRjHq9AtDojv7qJvXJ+krHkdqKYu+8IVSV94quVkkbq2rYzcEEEGuNOi+ULVNeWndSe2ugVp5vMdPfWUos7s9ogGCAobfGspIw0aRC+186+3+tVv4mimnRtKqSB4oUSFSCTtRjVwT1NfUj4tlhwU5af3mfxoxp3pB91KbRxtx5ttx4NNqWlK3Ckq5EkwVQNzA3gbmuj9D8FeEWXtm37bWTupnlJBUi3vEMp+LSPrUH2KVNeQYD8o9LK+69dKGCyqQauSDCjRjT/TcAe011PZcH+GGOTyt6JsiQP/Uqcf38/rFKp5aaG0LaCLbRWn2x5oxjAPz5aZPhyR4+ZwQ/i2g7LkZq9aTHaPoB8yr/ABopu/tyQDctbftgV2Hb4vDsD+rYixa/uW6E/kKYICG/1aEpHsTFCPhc93/wUQZpHAXJOn8nbJfE3TXX74q+dGZdDrbSkupMgePjVlW7xBEKIqRYu7UhQIWfnXmJ4T8jKGQ2XjtSi/NL2dJCs7QuQGW0rjrqSVJYSyufvI7pPxifjT1xtSkkJPKoggKiYPnUZ0bl0rKrJxU9p3m5P2vEfEflUvrY/AAUSVSuJa4hJMDj8tj7M2+Wyqsk9zqUHVNJQeU9BA/zvTQT5GtxISCT0FUvoDXmf1fxMvnkXj72BUm4RaoQgJZS2nlhajJ5iT47HvREA0b4Br7cXV+yax8aXLZJK2qYLPb7D6q45qrdd8NMhrPWljl7e6ZYtbNlKHXHkBRmVHlQmO9vykyQBO3N3gLUU4BskVrJJ8aUdMMc0w2o4mVLiSebEaNEevOxQysdahbL30doOMNqaaWEAKQgxKUnwB5U7D7o8hW6B5V7r8jzqsna6d3Ugg0vHer9SD417rXcXDNowu4uFhDbaStSj4AVBkDQbK/WoRxGyKUrt7JJ9RBcV+9sPyPzqp87fBphxXNG0U/1TnlZLIXF2r+1USEz6qRskfICq71DkA4sNA7Dc1yPx3qDciTyGHv/AAFrNJg8tgtLy9Lkk9a3NPHYHr5UsbdBVv1/GiG3TMHw+Vc8Me1K8BpOLV6Xm9/EfyrKBtXZdR494b/GspZ0e6kHWLXzsTcDtFzt3j+dENOyZmkwelxXh3j+dFNvqSQFSRX1E+LZYbq9E6ZuCYgwfOi0ONqI7RKTBkSOhpK28CBB2opt9QIBn2eylHxHkIocO6l+P1XqXGpSnGaly9kE/Ztr51ofJKgKkVpxa4kWgBb1xlz4fW3BeP8A9nNVdMvjY9RRzbw2hQIoBdK3Zrj+5U6HorPteOPFZogjWTqo+/ZWqifiWqZ2/H/igI59RNKI87C3/kgVUzL0RvRbb4MQaA/JyRsHn91NrWHsuh9Aa8436+df/Ql/h+ytShL790y2hKCqYHKgFZmDuExt1Bq69NWfEBrlVnNYY1fm3a4uPktTm/8ADXEuD1JmtN36cng8pcWV0kcgdZVBKfuqB2Uk+KVAgx0q18D6Sut7cJbydpiL8f8AuKZW04fihQT8k05hahDGAclzr9yhviJ/SAuu8YzeNZS0yjeauCpkcq21hPKobnYJA5TMGd+gq48FmmstbTKUvoA7RE/iPZXEGG9JXIu8od0zabHdQvV/9H86sbTXHTKXdyycfjrZp3cgqcUqAASfLwB99aDG8R4E7xjMf8x4FFAmxcjJ6WkWRsF1UpsrSULAUlQgg7gigcXg8bhrUWOJsLezt0mQ2y2EJnxMCoTw/wCL1hq1tu0vrc2t8Uc55EksqHnP2PD1tp2BMxVioJO/NIjarQdE1tFkKtlZJjuMT9iDuPZeeyVWdkqtteSlfgqoOxYgL6bQ7K1qQUiSRXmvfZk/aFa31s2rZduHktp8yaTfive78ttBSDvVftVbxE1wzcA4bHPSwg/XuJOzih9kHyH4n3VI9TZP9JWyrG1u3rVpUha24C1jy3BgfjVf3WjcQ5617f8AwW3/ANFVmpQ5QiLMcCz9U9iRs6uuRQLLZgNhS1L38BULu70uOkhUmatDJcM8PdqKzl8qjyAcaI/4Kj+W4VWllaO3zeqBbtsiVLu2R2YHtUFCPkfca45qHhnVTI7IyGg+xGy00WZAAGtUNbf6b0Sh7l8aTNP9N6LbfJABNZSSGirC05tXodRv9ofnWUFbPS4jfYEfnWUk+PfhFBsL50F3mcJnxP51vZeiJVSrtiHCD5miW3wepO9fUzoqCwYKbIe5SADRbb4XsDv5Umad5T160S279qaVfFYRQU6bdUJINGNXEiASD40lauDPfge2i0PCRHhSckW6K1+1FO2n9pmnWOw+SyeLv8vYMh9nF8irpKJK2m1hUOER6gKCFHqNiREkRRl+Oqj5U5wuoMrg33LjEZJ6zdeZXburaI+saX6yCDsQYB6bEAiCAaWMbA78wbJmJzOr8y6+iNbfMQDFTLDP8P39NLbyq76xzdv2pS4wlb6bsbqb7pPImD3VAlEgSFSdq9Q8AkAdI2PhFGNPQd1Ak+VKNIiJ+UH3RYpzGSQAbFb/APeVJ8dlVtqBmOnj02qc6e1bd2LqHba8caUJ7zaykwRB3G/QkfGqqbeGx5iD4UxtMi42RCojxmqafEt3UzYjil61/SbXVHD7jK5p+0XZos7d8PL7QqcUUrmAI5t5HkI6k+dWlhvSBvmUpDNihCfui4JT8ik1xDYagWiO+alGM1rc24Se2IHtpjG1/VNNaI+rqaPXlDkxopiXO5K7gtfSEfcSO1wduqPu3JH/AC0Z/p+bUmf6Ptj/AOX/APiuOLLiCpIHOQf3opkniCk/an96rE+N5wPmYb9gl/w2Mrqu54+LIPJiUtT9x+SPmk/lUevuNqCpTjmLUsjbmXeb/wDBXN72vVvCEOBO2xnelz+qnX+r341U5njXU5hUA6fqQEzHp0DRZV+5HjwhskMYBtav2rwgfgio/d8e8uoK+j4WwSr/AGji3PyKapZeZW4Y5zJ9lYm7Uvqapn67q8g+eY/YAJpuLAzsrLu+Metb0KQ1eWlrzeNvaiR7u0K6Q3uey2Yc7XLZO5vFJ3R2zhUlJ9ieifgBUbaeChBotp7l8aqMrKysjaV5PuU2yNjP0gJwy9BG9GsvAxBpKy9Eb7US29yiUn31TyRco1p9bPQ4gT1UB+NZQFpc/WNn9ofnWUk6LdFG+6+dSXYWrfoTW9p1O3KaVouIcUJgyaJQ6B08a+qZMcgLBNeCmrT4iCaKQ5G3N+FKUOg9Npre29BiaRki3pFBTdt8H1ok+VFNPEb800qQ8CO6aJaf3jypN8W9IoKcNPgiP8iimniBsdvKkzbo6pVFFNXMkAgzSkkfOyKHUbTtq4iAk7T0otl6EhU0laeJMhUUW1cb+sB7/GkZItkUOtO23wSCDRbT3TfbxpKy8DG8UW0703pOSKgih1Jy0+rbvbUY1cco7qjHlNJGXgeh2FFtPfdMbD40nJEiAp6zdrP2z59aLauVT6xI9/SkTNwCfI0Wy8BEmkpIFMP9U9auT9pZ+dFIeIIBVNJGXwOsijWnztBE0jJEigpy0+FRBotp8JEgzSRp/ljqZoxp/pJpR8WymDSdtP8ATfbxo1p8gAAmkTT/AE8/fRbT8bc0GkpIkcFPWn0wI6Hwopt6YhXvpIzcSQJgmjWn58SPbSMsKIHB3Cd2zoLiPOR+dZQFq/DqAqB3hWUm6LdEa6hS+daXzzkg7kkg/GimbiI5jStnx95/Oj2+gr6yliaeVztriCmTTw2miG3Y2NL2epo1Hh76qZo2hOscSN0W29B67UU29O0/Ggbf+X86Ka6n3VXyNACKDSNQ6EAEGiW3QYmhE+qKJP2f8+IpJ4CKDSMafKTBM0Yh0QPKgm/CimvD3Uo9opEBI4RyLgg7/Oi2bgDof/FAo6UZb+qaTeBSYHNI9p/pJ26CiWnZjegEeqn40wa/VfEUlIBakLRbbwMTRTT6k7Hp4UH9ke6i2PXpN4FIoFo1l/pBEe+jG7k7E9OlBseHwoxHRPupGUBTbuLRjT/Tei23ojegmunx/kaNZ6fL86TkAREW1cEGJ28aLafChsdqHa/VGi7b16SeBujNRDb5T3SZFGNPq6823n40Lb+t+6aLa/5jSMtFEaLRttcBTiACCCR41le7T1k1lJuAJRQKC//Z\" width=\"200\" height=\"137\" /></p>\n<p>简答题</p>', '47', NULL, NULL, NULL, NULL, '回答');

-- ----------------------------
-- Table structure for exams_subject
-- ----------------------------
DROP TABLE IF EXISTS `exams_subject`;
CREATE TABLE `exams_subject`  (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `grand_id` int(11) NOT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exams_subject
-- ----------------------------
INSERT INTO `exams_subject` VALUES (1, 39, '语文');
INSERT INTO `exams_subject` VALUES (2, 39, '数学');
INSERT INTO `exams_subject` VALUES (3, 40, '语文');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'exams_subject', '', 'ExamsSubject', 'crud', 'com.ruoyi.system', 'system', 'subject', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-09-07 14:36:47', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'exams_question', '', 'ExamsQuestion', 'crud', 'com.ruoyi.system', 'system', 'question', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-09-07 14:50:23', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'exams_paper', '', 'ExamsPaper', 'crud', 'com.ruoyi.system', 'system', 'paper', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-09-08 13:43:23', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'exams_paper_part', '', 'ExamsPaperPart', 'crud', 'com.ruoyi.system', 'system', 'part', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-09-08 13:43:23', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'exams_part', '', 'ExamsPart', 'crud', 'com.ruoyi.system', 'system', 'part', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-09-08 13:43:23', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'exams_part_question', '', 'ExamsPartQuestion', 'crud', 'com.ruoyi.system', 'system', 'question', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-09-08 13:43:23', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (15, '2', 'subject_id', NULL, 'int(11)', 'Long', 'subjectId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-07 14:36:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'grand_id', NULL, 'int(11)', 'Long', 'grandId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-07 14:36:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'subject_name', NULL, 'varchar(255)', 'String', 'subjectName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-09-07 14:36:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '3', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'subject_id', '课程名称', 'int(11)', 'Long', 'subjectId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'create_date', NULL, 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'update_date', NULL, 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '3', 'answer', '答案', 'varchar(255)', 'String', 'answer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '3', 'content', '试题内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '3', 'question_type', '试题类型', 'varchar(255)', 'String', 'questionType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '3', 'options', '试题选项（多个以逗号隔开）', 'varchar(255)', 'String', 'options', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '3', 'analysis', '试题解析内容', 'varchar(255)', 'String', 'analysis', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'summarize', '总结升华', 'varchar(255)', 'String', 'summarize', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '3', 'language_points_id', NULL, 'int(11)', 'Long', 'languagePointsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-09-07 14:50:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '4', 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '4', 'name', '试卷名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '4', 'school_id', '学校编号', 'int(11)', 'Long', 'schoolId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '4', 'grand_id', '年级编号', 'int(11)', 'Long', 'grandId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '4', 'subject_id', '科目编号', 'int(11)', 'Long', 'subjectId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '4', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '4', 'update_date', '修改时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '5', 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '5', 'paper_id', '试卷编号', 'int(11)', 'Long', 'paperId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '5', 'part_id', '模块编号', 'int(11)', 'Long', 'partId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '5', 'sort', '模块排序', 'int(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '6', 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '6', 'question_type', '题型', 'int(11)', 'Long', 'questionType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '6', 'discrib', '描述', 'varchar(255)', 'String', 'discrib', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '7', 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '7', 'part_id', '模块编号', 'int(11)', 'Long', 'partId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '7', 'question_id', '试题编号', 'int(11)', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-08 13:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '7', 'sort', '试题排序', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-09-08 13:43:23', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000174770B0CD87870707400007070707400013174000E3020302F3330202A202A202A203F74001946696C655461736B2E64656C65746554656D7046696C65282974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000064740021E588A0E999A4E8AF95E58DB7E5AFBCE587BAE79A84E4B8B4E697B6E69687E4BBB674000131740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-4SCQGSL1599728641187', 1599732004792, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1599728650000, -1, 5, 'PAUSED', 'CRON', 1599728641000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 1599733800000, 1599732000000, 5, 'WAITING', 'CRON', 1599728641000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1599728655000, -1, 5, 'PAUSED', 'CRON', 1599728641000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1599728660000, -1, 5, 'PAUSED', 'CRON', 1599728641000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '南京', 0, 'qq', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-10 15:00:01');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '江宁区', 1, 'qq', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-10 15:00:01');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '江宁中心小学', 2, 'qq', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-10 15:00:01');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE,
  INDEX `dict_value`(`dict_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (39, 1, '一年级', '0', 'sys_grand', NULL, NULL, 'N', '0', 'admin', '2020-09-07 14:21:34', 'qq', '2020-09-07 14:21:46', '一年级');
INSERT INTO `sys_dict_data` VALUES (40, 2, '二年级', '1', 'sys_grand', NULL, NULL, 'N', '0', 'admin', '2020-09-07 14:21:34', 'qq', '2020-09-07 14:21:46', '二年级');
INSERT INTO `sys_dict_data` VALUES (41, 3, '三年级', '2', 'sys_grand', NULL, NULL, 'N', '0', 'admin', '2020-09-07 14:21:34', 'qq', '2020-09-07 14:21:46', '三年级');
INSERT INTO `sys_dict_data` VALUES (42, 4, '四年级', '3', 'sys_grand', NULL, NULL, 'N', '0', 'admin', '2020-09-07 14:21:34', 'qq', '2020-09-07 14:21:46', '四年级');
INSERT INTO `sys_dict_data` VALUES (43, 5, '五年级', '4', 'sys_grand', NULL, NULL, 'N', '0', 'admin', '2020-09-07 14:21:34', 'qq', '2020-09-07 14:21:46', '五年级');
INSERT INTO `sys_dict_data` VALUES (44, 6, '六年级', '5', 'sys_grand', NULL, NULL, 'N', '0', 'admin', '2020-09-07 14:21:34', 'qq', '2020-09-07 14:21:46', '六年级');
INSERT INTO `sys_dict_data` VALUES (45, 1, '选择题', '0', 'sys_question_type', NULL, NULL, 'N', '0', 'admin', '2020-09-07 15:55:46', 'qq', '2020-09-07 15:55:49', '选择题');
INSERT INTO `sys_dict_data` VALUES (46, 2, '填空题', '1', 'sys_question_type', NULL, NULL, 'N', '0', 'admin', '2020-09-07 15:55:46', 'qq', '2020-09-07 15:55:49', '填空题');
INSERT INTO `sys_dict_data` VALUES (47, 3, '简答题', '2', 'sys_question_type', NULL, NULL, 'N', '0', 'admin', '2020-09-07 15:55:46', 'qq', '2020-09-07 15:55:49', '简答题');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '年级', 'sys_grand', '0', 'admin', '2020-09-07 13:52:12', 'admin', '2020-09-07 13:54:19', '年级');
INSERT INTO `sys_dict_type` VALUES (101, '题型', 'sys_question_type', '0', 'admin', '2020-09-07 15:54:11', 'admin', '2020-09-07 15:54:16', '题型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2020-09-10 15:53:42', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (100, '删除试卷导出的临时文件', 'DEFAULT', 'FileTask.deleteTempFile()', '0 0/30 * * * ?', '1', '1', '0', 'admin', '2020-09-10 16:04:07', 'admin', '2020-09-10 16:16:03', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2020-09-10 15:53:00');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-09-10 15:53:05');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-09-10 15:53:10');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-09-10 15:53:20');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-09-10 15:53:30');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-09-10 15:53:40');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2020-09-10 16:04:37');
INSERT INTO `sys_job_log` VALUES (8, 'www', 'DEFAULT', 'FileTask.deleteTempFile()', 'www 总共耗时：37毫秒', '0', '', '2020-09-10 16:05:01');
INSERT INTO `sys_job_log` VALUES (9, 'www', 'DEFAULT', 'FileTask.deleteTempFile()', 'www 总共耗时：12毫秒', '0', '', '2020-09-10 16:06:50');
INSERT INTO `sys_job_log` VALUES (10, '删除试卷导出的临时文件', 'DEFAULT', 'FileTask.deleteTempFile()', '删除试卷导出的临时文件 总共耗时：13毫秒', '0', '', '2020-09-10 16:15:52');
INSERT INTO `sys_job_log` VALUES (11, '删除试卷导出的临时文件', 'DEFAULT', 'FileTask.deleteTempFile()', '删除试卷导出的临时文件 总共耗时：18毫秒', '0', '', '2020-09-10 17:30:00');
INSERT INTO `sys_job_log` VALUES (12, '删除试卷导出的临时文件', 'DEFAULT', 'FileTask.deleteTempFile()', '删除试卷导出的临时文件 总共耗时：0毫秒', '0', '', '2020-09-10 18:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-28 11:21:48');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-28 13:35:55');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-29 16:34:04');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-31 17:11:43');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-07-31 17:28:40');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-31 17:32:56');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-01 10:01:29');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-02 15:13:48');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-02 15:14:31');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-02 15:15:23');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-02 15:16:38');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-02 15:39:07');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-04 14:51:24');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-04 14:51:28');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '192.168.11.124', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-04 15:22:20');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '192.168.11.124', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-04 15:22:27');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-07 13:50:36');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-08 08:33:48');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-08 08:33:59');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-08 09:19:52');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-08 10:10:29');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-08 12:00:10');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-08 13:42:50');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-08 14:52:38');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-09 08:52:32');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-09 08:52:40');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-09 11:37:03');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-09 11:48:42');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-09 11:48:48');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-09 13:35:28');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-09 14:42:49');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-09 17:41:34');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 08:47:01');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 09:25:15');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 11:07:52');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-10 13:35:23');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 13:35:28');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 14:30:05');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-10 15:03:35');
INSERT INTO `sys_logininfor` VALUES (139, 'lx', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 15:03:48');
INSERT INTO `sys_logininfor` VALUES (140, 'lx', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-10 15:04:00');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 15:04:14');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-10 17:06:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2006 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 5, 'http://ruoyi.vip', NULL, 0, 'M', '0', '1', '', 'guide', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-07 14:08:26', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', '1', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-07 14:04:37', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', '1', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-07 14:04:30', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '考试系统', 0, 4, 'exams', NULL, 1, 'M', '0', '0', '', 'documentation', 'admin', '2020-09-07 14:07:20', 'admin', '2020-09-07 14:08:30', '');
INSERT INTO `sys_menu` VALUES (2001, '题库', 2000, 1, 'questions', 'exams/questions/question', 1, 'C', '0', '0', 'exams:questions', 'edit', 'admin', '2020-09-07 14:10:30', 'admin', '2020-09-07 15:06:32', '');
INSERT INTO `sys_menu` VALUES (2002, '科目管理', 2000, 2, 'subject', 'exams/subject/subject', 1, 'C', '0', '0', 'exams:subject', 'cascader', 'admin', '2020-09-07 15:21:12', 'admin', '2020-09-07 15:21:49', '');
INSERT INTO `sys_menu` VALUES (2003, '详情', 2000, 3, 'detail', 'exams/questions/detail', 1, 'C', '1', '0', 'exams:questions', 'documentation', 'admin', '2020-09-08 10:29:55', 'admin', '2020-09-08 10:30:17', '');
INSERT INTO `sys_menu` VALUES (2004, '试卷管理', 2000, 4, 'paper', 'exams/paper/paper', 1, 'C', '0', '0', 'exams:questions', 'documentation', 'admin', '2020-09-08 14:54:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '试卷编辑', 2000, 5, 'paperEdit', 'exams/paper/paperEdit', 1, 'C', '1', '0', 'exams:paper', 'edit', 'admin', '2020-09-08 16:44:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, 'ddd', '2', '<p>dsfsdfs</p>', '0', 'admin', '2020-09-07 13:59:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 237 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dept', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-07-29 17:12:59');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-07-29 17:13:18');
INSERT INTO `sys_oper_log` VALUES (102, '在线用户', 3, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, NULL, NULL, '/monitor/online/34f5f55c-40e2-4b51-b8e5-4eb59f078531', '127.0.0.1', '内网IP', '{tokenId=34f5f55c-40e2-4b51-b8e5-4eb59f078531}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-02 15:38:49');
INSERT INTO `sys_oper_log` VALUES (103, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"params\":{},\"dictType\":\"sys_grand\",\"createBy\":\"admin\",\"dictName\":\"年级\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:52:12');
INSERT INTO `sys_oper_log` VALUES (104, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:52:28');
INSERT INTO `sys_oper_log` VALUES (105, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"dictId\":100,\"params\":{},\"dictType\":\"sys_grand\",\"createBy\":\"admin\",\"createTime\":1599457932000,\"updateBy\":\"admin\",\"dictName\":\"年级\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:54:12');
INSERT INTO `sys_oper_log` VALUES (106, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"dictId\":100,\"params\":{},\"dictType\":\"sys_grand\",\"createBy\":\"admin\",\"createTime\":1599457932000,\"updateBy\":\"admin\",\"dictName\":\"年级\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:54:19');
INSERT INTO `sys_oper_log` VALUES (107, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/2', '127.0.0.1', '内网IP', '{noticeIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:58:53');
INSERT INTO `sys_oper_log` VALUES (108, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/1', '127.0.0.1', '内网IP', '{noticeIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:58:55');
INSERT INTO `sys_oper_log` VALUES (109, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"ddd\",\"noticeContent\":\"<p>dsfsdfs</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 13:59:02');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"总部\",\"leader\":\"q\'q\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:02');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2020-09-07 14:00:09');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:14');
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:16');
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2020-09-07 14:00:18');
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:21');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2020-09-07 14:00:24');
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:27');
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:29');
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"教师\",\"leader\":\"qq\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:00:44');
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"教师部\",\"leader\":\"qq\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:01:07');
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"江宁中心小学\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:01:26');
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1521171180000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:01:47');
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:01:52');
INSERT INTO `sys_oper_log` VALUES (124, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:01:55');
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"qq\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"江宁中心小学\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2020-09-07 14:02:14');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-07 14:03:15');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:03:27');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-07 14:03:30');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"4\",\"menuName\":\"服务监控\",\"params\":{},\"parentId\":2,\"path\":\"server\",\"component\":\"monitor/server/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":112,\"menuType\":\"C\",\"perms\":\"monitor:server:list\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:04:30');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":\"3\",\"menuName\":\"数据监控\",\"params\":{},\"parentId\":2,\"path\":\"druid\",\"component\":\"monitor/druid/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":111,\"menuType\":\"C\",\"perms\":\"monitor:druid:list\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:04:37');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"5\",\"menuName\":\"考试系统\",\"params\":{},\"parentId\":0,\"path\":\"exams\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:07:20');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"5\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:08:26');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"考试系统\",\"params\":{},\"parentId\":0,\"path\":\"exams\",\"children\":[],\"createTime\":1599458840000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:08:30');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"1\",\"menuName\":\"题库\",\"params\":{},\"parentId\":2000,\"path\":\"questions\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exams:questions\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:10:30');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'exams_subject', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:36:47');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-07 14:37:30');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'exams_question', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 14:50:23');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-07 14:50:30');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"1\",\"menuName\":\"题库\",\"params\":{},\"parentId\":2000,\"path\":\"questions\",\"component\":\"/exams/questions/question\",\"children\":[],\"createTime\":1599459030000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"exams:questions\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 15:06:32');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-07 15:12:55');
INSERT INTO `sys_oper_log` VALUES (141, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"params\":{},\"content\":\"dddd\",\"subjectId\":39,\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"d\'d\'d\'s\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 15:20:11');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"2\",\"menuName\":\"科目管理\",\"params\":{},\"parentId\":2000,\"path\":\"subject\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 15:21:12');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"2\",\"menuName\":\"科目管理\",\"params\":{},\"parentId\":2000,\"path\":\"subject\",\"component\":\"exams/subject/subject\",\"children\":[],\"createTime\":1599463272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 15:21:35');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"2\",\"menuName\":\"科目管理\",\"params\":{},\"parentId\":2000,\"path\":\"subject\",\"component\":\"exams/subject/subject\",\"children\":[],\"createTime\":1599463272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"exams:subject\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 15:21:49');
INSERT INTO `sys_oper_log` VALUES (145, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"params\":{}}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may involve com.ruoyi.system.mapper.ExamsQuestionMapper.insertExamsQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_question\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2020-09-07 16:10:23');
INSERT INTO `sys_oper_log` VALUES (146, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"params\":{},\"content\":\"dddd\",\"subjectId\":39,\"answer\":\"a\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 16:18:01');
INSERT INTO `sys_oper_log` VALUES (147, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"typeName\":\"选择题\",\"params\":{},\"content\":\"<p>选择题</p><p>A、sss</p><p>B、ddd</p>\",\"subjectId\":39,\"answer\":\"a\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 16:28:19');
INSERT INTO `sys_oper_log` VALUES (148, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"typeName\":\"45\",\"analysis\":\"d\",\"params\":{},\"content\":\"<p>ddd</p>\",\"answer\":\"dd\",\"summarize\":\"d\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.ExamsQuestionMapper.insertExamsQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_question          ( answer,             content,                                       analysis,             summarize )           values ( ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-09-07 16:30:07');
INSERT INTO `sys_oper_log` VALUES (149, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"typeName\":\"45\",\"params\":{},\"content\":\"<p>ddd</p>\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'subject_id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.ExamsQuestionMapper.insertExamsQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_question          ( content )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'subject_id\' doesn\'t have a default value\n; Field \'subject_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'subject_id\' doesn\'t have a default value', '2020-09-07 16:31:57');
INSERT INTO `sys_oper_log` VALUES (150, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"typeName\":\"45\",\"params\":{},\"content\":\"<p>ddd</p>\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'subject_id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.ExamsQuestionMapper.insertExamsQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_question          ( content )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'subject_id\' doesn\'t have a default value\n; Field \'subject_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'subject_id\' doesn\'t have a default value', '2020-09-07 16:32:03');
INSERT INTO `sys_oper_log` VALUES (151, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599408000000,\"typeName\":\"选择题\",\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p><p>A、sss</p><p>B、ddd</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"a\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"选择题\",\"createDate\":1599408000000,\"subjectName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 17:19:59');
INSERT INTO `sys_oper_log` VALUES (152, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599408000000,\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p><p>A、sss</p><p>B、ddds</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"A\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"选择题\",\"createDate\":1599408000000,\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 17:22:37');
INSERT INTO `sys_oper_log` VALUES (153, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599408000000,\"typeName\":\"选择题\",\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p><p>A、sss</p><p>B、ddds</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"A\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"45\",\"createDate\":1599408000000,\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 17:32:02');
INSERT INTO `sys_oper_log` VALUES (154, '试题', 5, 'com.ruoyi.web.controller.exams.questions.QuestionController.export()', 'GET', 1, 'admin', NULL, '/exams/question/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"68d6c51b-7cb9-428e-b9b3-ef64594f1693_question.xlsx\",\"code\":200}', 0, NULL, '2020-09-07 17:35:03');
INSERT INTO `sys_oper_log` VALUES (155, '科目', 1, 'com.ruoyi.web.controller.exams.subject.SubjectController.add()', 'POST', 1, 'admin', NULL, '/exams/subject', '127.0.0.1', '内网IP', '{\"params\":{},\"grandId\":39,\"subjectName\":\"数学\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-07 17:58:04');
INSERT INTO `sys_oper_log` VALUES (156, '科目', 1, 'com.ruoyi.web.controller.exams.subject.SubjectController.add()', 'POST', 1, 'admin', NULL, '/exams/subject', '127.0.0.1', '内网IP', '{\"params\":{},\"grandId\":40,\"subjectName\":\"语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 08:35:21');
INSERT INTO `sys_oper_log` VALUES (157, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"params\":{},\"content\":\"<p>嗯嗯<img class=\\\"wscnph\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAESAZADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCVnIPGOg6gelKJGz2/IVExw/4D+VAbNfBcp6pPvPbH5CnCQ+2foKhzjmnA1LQXJw57Yz9BSiRvb/vkVCDTw1S0VcmEhxnj8hThI3t/3yKg6d6cG9aloCcSHPb/AL5FODt/s/8AfIqDOKcDU2HcmEje3/fIp/mHpgf98ioQaWpsO5OJD7f98inCQ+i/98ioAemaeDUtATeY3+z/AN8inBz6L/3yKhzTgRUtDJg5/wBn/vkU4Oc9F/75FQhqcDUtDuTCQ9gv/fIpd5PQL/3yKiBpc1Nhkwcjsv8A3yKdvPTC/wDfIqEH1pwNTYCUSH/Z/wC+RThIfRf++RUINPA5pNIES+Y2Oi/98inK7Z6L/wB8CmKtTxxZ61m7IaEDufT/AL5FSKzdwv8A3yKlWIVMsYFRvshkChvRc/7oqRVf2H/ARU4TFPCU1Skw5kQhG9v++RTtp74/IVNtpdtP2Ew5kRbcen5UYIHb8ql2YpNtQ6UkHMhnI9Pyoyfb8qeVxVWeZ7UmR1L2/wDEyjmP3I7j6cj37TGnKTsguixk44x+VKCf8imqVdA6sGRgCrKcgj1FLipd07Meguc+n5Uuee35U3NApqTFYkz9Pyoz9PypmaUHNaRkxWHZ+n5Uufp+VNoBrRSYrDyTnt+VLuPt+VNzmjvVKTFYdk+35Uu498flTAadVqTFYcD7D8q4rxn4zOmltK0yQfbm4mmAB8gHsP8AaP6U/wAZ+MBo6Np2nuDqLj53HIt1Pf8A3iOg7da8rUEvuJJJOWZjkk+pPrXs4LCu3tKnyQrXOtY/N+A/lRmmMfmPTtSg4qLGRIDTwe9RA0oOKTQEwbNPBxioQcgU4E/nUNDJg1OBqLOacDUtDJAcU/OaiU/SlHHNS0MmBpQRUYbNOzzzUtASZxTgcVGDTs85qWhkob3p2fSoQaeG5qWhkuacD71EDTgaloZKDTgaizTg1S0BKD+NPX0qNeakXp71DGPUc1KkZY9KSKMsQauxx7R0rNtvRDQkUWOtWFT24pVSplX2ranhZT1ZLmkNValVKcqe1ShMV6FPBpGTqEYT2p4T2qwltK/3Y2P4YqdbCc9UVfq1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 09:09:05');
INSERT INTO `sys_oper_log` VALUES (158, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"params\":{},\"content\":\"<p>&nbsp;呃呃呃</p>\",\"subjectId\":1,\"questionType\":\"45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 09:09:50');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"documentation\",\"orderNum\":\"3\",\"menuName\":\"详情\",\"params\":{},\"parentId\":2000,\"path\":\"detail\",\"component\":\"exams/question/detail\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:29:55');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"documentation\",\"orderNum\":\"3\",\"menuName\":\"详情\",\"params\":{},\"parentId\":2000,\"path\":\"detail\",\"component\":\"exams/questions/detail\",\"children\":[],\"createTime\":1599532195000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"exams:questions\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:30:17');
INSERT INTO `sys_oper_log` VALUES (161, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"analysis\":\"sdf\",\"params\":{},\"content\":\"<p>dsdfs</p>\",\"subjectId\":1,\"answer\":\"sdf\",\"summarize\":\"sdf\",\"questionType\":\"45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:37:51');
INSERT INTO `sys_oper_log` VALUES (162, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"typeName\":\"选择题\",\"analysis\":\"sfsdfas\",\"params\":{},\"content\":\"<p>dsdfs</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"sdf\",\"summarize\":\"sdf\",\"id\":4,\"questionType\":\"45\",\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:38:09');
INSERT INTO `sys_oper_log` VALUES (163, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599408000000,\"typeName\":\"选择题\",\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"A\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"45\",\"createDate\":1599408000000,\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:42:40');
INSERT INTO `sys_oper_log` VALUES (164, '试题', 3, 'com.ruoyi.web.controller.exams.questions.QuestionController.remove()', 'DELETE', 1, 'admin', NULL, '/exams/question/2', '127.0.0.1', '内网IP', '{ids=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:50:15');
INSERT INTO `sys_oper_log` VALUES (165, '试题', 3, 'com.ruoyi.web.controller.exams.questions.QuestionController.remove()', 'DELETE', 1, 'admin', NULL, '/exams/question/3', '127.0.0.1', '内网IP', '{ids=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:50:17');
INSERT INTO `sys_oper_log` VALUES (166, '试题', 3, 'com.ruoyi.web.controller.exams.questions.QuestionController.remove()', 'DELETE', 1, 'admin', NULL, '/exams/question/4', '127.0.0.1', '内网IP', '{ids=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:50:20');
INSERT INTO `sys_oper_log` VALUES (167, '试题', 1, 'com.ruoyi.web.controller.exams.questions.QuestionController.add()', 'POST', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"params\":{},\"content\":\"<p>erdfgdfgd</p>\",\"subjectId\":1,\"answer\":\"dfgdfg\",\"questionType\":\"47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:50:34');
INSERT INTO `sys_oper_log` VALUES (168, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599533498814,\"typeName\":\"简答题\",\"params\":{},\"content\":\"<p>erdfgdfgd</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"dfgdfg\",\"id\":5,\"questionType\":\"47\",\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:51:38');
INSERT INTO `sys_oper_log` VALUES (169, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599533647328,\"typeName\":\"选择题\",\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"A\",\"options\":\"d\'d\'d\",\"id\":1,\"questionType\":\"45\",\"createDate\":1599408000000,\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 10:54:07');
INSERT INTO `sys_oper_log` VALUES (170, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599534088338,\"typeName\":\"简答题\",\"params\":{},\"title\":\"werwer\",\"content\":\"<p>erdfgdfgd</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"answer\":\"dfgdfg\",\"id\":5,\"questionType\":\"47\",\"subjectName\":\"一年级-语文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 11:01:28');
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'exams_paper,exams_paper_part,exams_part,exams_part_question', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 13:43:23');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-08 13:43:31');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"试卷管理\",\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"component\":\"exams/paper/paper\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exams:questions\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 14:54:02');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"edit\",\"orderNum\":\"5\",\"menuName\":\"试卷编辑\",\"params\":{},\"parentId\":2000,\"path\":\"paperEdit\",\"component\":\"exams/paper/paperEdit\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exams:paper\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-08 16:44:50');
INSERT INTO `sys_oper_log` VALUES (175, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":100,\"schoolId\":103,\"name\":\"wew\",\"parts\":[{\"discrib\":\"12\",\"params\":{},\"questionType\":45}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 10:46:23');
INSERT INTO `sys_oper_log` VALUES (176, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":100,\"schoolId\":103,\"name\":\"wew\",\"parts\":[{\"discrib\":\"12\",\"params\":{},\"questionType\":45}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 10:50:19');
INSERT INTO `sys_oper_log` VALUES (177, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":100,\"schoolId\":103,\"name\":\"wew\",\"parts\":[{\"discrib\":\"12\",\"params\":{},\"questionType\":45}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 11:02:51');
INSERT INTO `sys_oper_log` VALUES (178, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, NULL, NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":100,\"schoolId\":103,\"name\":\"wew\",\"parts\":[{\"discrib\":\"12\",\"params\":{},\"questionType\":45}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 11:36:24');
INSERT INTO `sys_oper_log` VALUES (179, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":120,\"schoolId\":103,\"name\":\"qwww\",\"parts\":[{\"partScore\":10.0,\"questions\":[{\"id\":1,\"questionScore\":10.0,\"params\":{}}],\"discrib\":\"11\",\"sort\":1,\"params\":{},\"id\":\"50d0a639-c209-46b7-8647-c0bb7f3d5dac\",\"questionType\":45}],\"id\":\"a9c70e63-4611-404e-8a08-aafc8a8f9d68\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'sort\' cannot be null\r\n### The error may involve com.ruoyi.system.mapper.ExamsPartQuestionMapper.insertExamsPartQuestionBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_part_question         (part_id, question_id,sort,question_score)         values                        (             ?,             ?,             ?,             ?             )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'sort\' cannot be null\n; Column \'sort\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'sort\' cannot be null', '2020-09-09 11:37:36');
INSERT INTO `sys_oper_log` VALUES (180, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":111,\"schoolId\":103,\"name\":\"111\",\"parts\":[{\"partScore\":11.0,\"questions\":[],\"discrib\":\"11\",\"sort\":1,\"params\":{},\"id\":\"1a544067-ecae-430c-b84b-ba1a99c33d48\",\"questionType\":45}],\"id\":\"a2517a68-417e-4e64-ac71-e0a36b793287\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may involve com.ruoyi.system.mapper.ExamsPartQuestionMapper.insertExamsPartQuestionBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_part_question         (part_id, question_id,sort,question_score)         values\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2020-09-09 11:39:22');
INSERT INTO `sys_oper_log` VALUES (181, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":111,\"schoolId\":103,\"name\":\"111\",\"parts\":[{\"partScore\":11.0,\"questions\":[],\"discrib\":\"11\",\"sort\":1,\"params\":{},\"id\":\"ad0d259f-63f6-4b57-a89e-f583e91a0a1b\",\"questionType\":45}],\"id\":\"aa6cbbac-ee0a-47ea-b2a4-3db514215d3d\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may involve com.ruoyi.system.mapper.ExamsPartQuestionMapper.insertExamsPartQuestionBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_part_question         (part_id, question_id,sort,question_score)         values\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2020-09-09 11:43:56');
INSERT INTO `sys_oper_log` VALUES (182, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":1,\"grandId\":39,\"paperScore\":111,\"schoolId\":103,\"name\":\"111\",\"parts\":[{\"partScore\":11.0,\"questions\":[],\"discrib\":\"11\",\"sort\":1,\"params\":{},\"id\":\"008b4a57-3aff-426a-8040-9bcd24861cda\",\"questionType\":45}],\"id\":\"7783dc7f-5e92-4aaa-a521-3db039b3a69a\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may involve com.ruoyi.system.mapper.ExamsPartQuestionMapper.insertExamsPartQuestionBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_part_question         (part_id, question_id,sort,question_score)         values\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2020-09-09 11:45:45');
INSERT INTO `sys_oper_log` VALUES (183, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":2,\"grandId\":39,\"paperScore\":100,\"schoolId\":103,\"name\":\"paper2\",\"parts\":[{\"partScore\":50.0,\"questions\":[{\"id\":1,\"questionScore\":10.0,\"sort\":1,\"params\":{}}],\"discrib\":\"www\",\"sort\":1,\"params\":{},\"id\":\"a85a9ad0-37af-4870-8dea-65d74946687d\",\"questionType\":45}],\"id\":\"49563499-256a-4414-959f-3d566909fcd9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 11:55:30');
INSERT INTO `sys_oper_log` VALUES (184, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599631504831,\"typeName\":\"简答题\",\"title\":\"回答\",\"content\":\"<p><img class=\\\"wscnph\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAKHKE07oe4ukJuL2bZkiRt31j3HoPfU3ssLjcekC2tkhQ+2rvK+ZphQ13d21iwu5unkt', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 14:05:04');
INSERT INTO `sys_oper_log` VALUES (185, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599631518395,\"typeName\":\"简答题\",\"title\":\"回答\",\"content\":\"<p><img class=\\\"wscnph\\\" style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAKH', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 14:05:18');
INSERT INTO `sys_oper_log` VALUES (186, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599631601810,\"typeName\":\"简答题\",\"title\":\"回答\",\"content\":\"<p>看图写话</p>\\n<p><img class=\\\"wscnph\\\" style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctw', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 14:06:41');
INSERT INTO `sys_oper_log` VALUES (187, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ok\",\"code\":200}', 0, NULL, '2020-09-09 14:42:56');
INSERT INTO `sys_oper_log` VALUES (188, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ok\",\"code\":200}', 0, NULL, '2020-09-09 14:50:36');
INSERT INTO `sys_oper_log` VALUES (189, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-09 14:52:17');
INSERT INTO `sys_oper_log` VALUES (190, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-09 14:55:16');
INSERT INTO `sys_oper_log` VALUES (191, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-09 14:56:28');
INSERT INTO `sys_oper_log` VALUES (192, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"e742f345-c028-4e9b-a678-124518ae76c1_paper.xlsx\",\"code\":200}', 0, NULL, '2020-09-09 14:58:51');
INSERT INTO `sys_oper_log` VALUES (193, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1e400d01-3f23-4ffc-82be-0c0b01018767_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:15:26');
INSERT INTO `sys_oper_log` VALUES (194, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"4e174faa-867c-4448-aab3-6bdfc3086d00_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:25:25');
INSERT INTO `sys_oper_log` VALUES (195, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"85179e5c-d49f-451c-8157-7eafc1cf5a90_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:26:44');
INSERT INTO `sys_oper_log` VALUES (196, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ff362c09-25b0-4bc4-89dc-eeb1e0d9696f_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:28:01');
INSERT INTO `sys_oper_log` VALUES (197, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"63605749-9bb8-45e6-ac5d-c931e835db86_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:28:24');
INSERT INTO `sys_oper_log` VALUES (198, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'GET', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"81d153b1-bfea-4190-abb4-5c7877d8fd2e_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:37:26');
INSERT INTO `sys_oper_log` VALUES (199, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599637195578,\"typeName\":\"选择题\",\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"options\":\"d\'d\'d\",\"id\":1,\"createDate\":1599408000000,\"subjectName\":\"一年级-语文\",\"params\":{},\"answer\":\"A\",\"questionType\":\"45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 15:39:55');
INSERT INTO `sys_oper_log` VALUES (200, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '{\"content\":\"一、选择题&nbsp;(www)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p><br/>\"}', '{\"msg\":\"1e48b779-fea2-43f5-bcc0-475cc175d31f_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:44:25');
INSERT INTO `sys_oper_log` VALUES (201, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(www)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/>', '{\"msg\":\"2d2109ab-c8b5-4288-b83b-1646bf996a68_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:45:53');
INSERT INTO `sys_oper_log` VALUES (202, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"c1d90ffd-3049-483f-b99c-a315fbbbbd4a_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 15:46:18');
INSERT INTO `sys_oper_log` VALUES (203, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(www)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/>', '{\"msg\":\"59aeae0b-bf38-4440-8f6a-a1160e145351_word.doc\",\"code\":200}', 0, NULL, '2020-09-09 16:28:08');
INSERT INTO `sys_oper_log` VALUES (204, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"ee13ef7f-2b8a-49db-a483-7f5157f42f26_word.doc\",\"code\":200}', 0, NULL, '2020-09-09 16:28:25');
INSERT INTO `sys_oper_log` VALUES (205, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(www)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/>', 'null', 1, '导出Word失败，请联系网站管理员！', '2020-09-09 16:45:51');
INSERT INTO `sys_oper_log` VALUES (206, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(www)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/>', '{\"msg\":\"eef6631f-96da-4e6d-814f-af964ccd7218_word.pdf\",\"code\":200}', 0, NULL, '2020-09-09 16:47:15');
INSERT INTO `sys_oper_log` VALUES (207, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"234eb024-3a5e-46c7-ab0f-1820fb74c46f_word.pdf\",\"code\":200}', 0, NULL, '2020-09-09 16:51:28');
INSERT INTO `sys_oper_log` VALUES (208, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"b9c76953-3412-4456-8324-d984356855ad_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 17:41:41');
INSERT INTO `sys_oper_log` VALUES (209, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"35ad510d-e8e6-4c50-8f1a-0e27a2482bc6_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 17:41:50');
INSERT INTO `sys_oper_log` VALUES (210, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"afe67b88-20bf-4b51-b7ec-3c991d015462_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 17:53:50');
INSERT INTO `sys_oper_log` VALUES (211, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599645417837,\"typeName\":\"选择题\",\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\\n<p><img class=\\\"wscnph\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAmcAAADwCAIAAADKLFSUAAAAAXNSR0IArs4c6QAAAAlwSFlzAAASdAAAEnQB3mYfeAAAD8hJREFUeF7t3EuIVMcaB/A7d+tCUEHcSNC4FvGBgw+4YHytDESi+EAwoLhzJURBQnShySqLqFsVMTGBLHwrXjBBxHhBQd0IMqsJgiJZu/B+5EDTmWeF6p5zTtfvrGbaqjr1/b6CP6e7naHR0dF/zfg1MjIyPDw847d1QwIECBAgkCXw76zZJhMgQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3e5RrVeuXOnRSpYhQIBAywSkZssaZrsECBAgUKOA1KwR360JECBAoGUCUrNlDbNdAgQIEKhRQGrWiO/WBAgQINAyAanZsobZLgECBAjUKCA1a8R3awIECBBomYDUbFnDbJcAAQIEahSQmjXiuzUBAgQItExAarasYbZLgAABAjUKSM0a8d2aAAECBFomIDVb1jDbJUCAAIEaBaRmjfhuTYAAAQItE5CaLWuY7RIgQIBAjQJSs0Z8tyZAgACBlglIzZY1zHYJECBAoEYBqVkjvlsTIECAQMsEpGbLGma7BAgQIFCjgNSsEd+tCRAgQKBlAlKzZQ2zXQIECBCoUUBq1ojv1gQIECDQMgGp2bKG2S4BAgQI1CggNWvEd2sCBAgQaJmA1GxZw2yXAAECBGo', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-09 17:56:57');
INSERT INTO `sys_oper_log` VALUES (212, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(www)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><p><img class=\"wscnph\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAmcAAADwCAIAAADKLFSUAAAAAXNSR0IArs4c6QAAAAlwSFlzAAASdAAAEnQB3mYfeAAAD8hJREFUeF7t3EuIVMcaB/A7d+tCUEHcSNC4FvGBgw+4YHytDESi+EAwoLhzJURBQnShySqLqFsVMTGBLHwrXjBBxHhBQd0IMqsJgiJZu/B+5EDTmWeF6p5zTtfvrGbaqjr1/b6CP6e7naHR0dF/zfg1MjIyPDw847d1QwIECBAgkCXw76zZJhMgQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3e5RrVeuXOnRSpYhQIBAywSkZssaZrsECBAgUKOA1KwR360JECBAoGUCUrNlDbNdAgQIEKhRQGrWiO/WBAgQINAyAanZsobZLgECBAjUKCA1a8R3awIECBBomYDUbFnDbJcAAQIEahSQmjXiuzUBAgQItExAarasYbZLgAABAjUKSM0a8d2aAAECBFomIDVb1jDbJUCAAIEaBaRmjfhuTYAAAQItE5CaLWuY7RIgQIBAjQJSs0Z8tyZAgACBlglIzZY1zHYJECBAoEYBqVkjvlsTIECAQMsEpGbLGma7BAgQIFCjgNSsEd+tCRAgQKBlAlKzZQ2zXQIECBCoUUBq1ojv1gQIECDQMgGp2bKG2S4BAgQI1CggNWvEd2sCBAgQaJmA1GxZw2yXAAECBGoUkJo14rs1AQIECLRMQGq2rGG2S4AAAQI1CkjNGvHdmgABAgRaJiA1W9Yw2yVAgAC', '{\"msg\":\"0720548a-ce80-4cf1-bb6c-394bc996e694_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 17:57:12');
INSERT INTO `sys_oper_log` VALUES (213, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(www)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><p><img class=\"wscnph\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAmcAAADwCAIAAADKLFSUAAAAAXNSR0IArs4c6QAAAAlwSFlzAAASdAAAEnQB3mYfeAAAD8hJREFUeF7t3EuIVMcaB/A7d+tCUEHcSNC4FvGBgw+4YHytDESi+EAwoLhzJURBQnShySqLqFsVMTGBLHwrXjBBxHhBQd0IMqsJgiJZu/B+5EDTmWeF6p5zTtfvrGbaqjr1/b6CP6e7naHR0dF/zfg1MjIyPDw847d1QwIECBAgkCXw76zZJhMgQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3e5RrVeuXOnRSpYhQIBAywSkZssaZrsECBAgUKOA1KwR360JECBAoGUCUrNlDbNdAgQIEKhRQGrWiO/WBAgQINAyAanZsobZLgECBAjUKCA1a8R3awIECBBomYDUbFnDbJcAAQIEahSQmjXiuzUBAgQItExAarasYbZLgAABAjUKSM0a8d2aAAECBFomIDVb1jDbJUCAAIEaBaRmjfhuTYAAAQItE5CaLWuY7RIgQIBAjQJSs0Z8tyZAgACBlglIzZY1zHYJECBAoEYBqVkjvlsTIECAQMsEpGbLGma7BAgQIFCjgNSsEd+tCRAgQKBlAlKzZQ2zXQIECBCoUUBq1ojv1gQIECDQMgGp2bKG2S4BAgQI1CggNWvEd2sCBAgQaJmA1GxZw2yXAAECBGoUkJo14rs1AQIECLRMQGq2rGG2S4AAAQI1CkjNGvHdmgABAgRaJiA1W9Yw2yVAgAC', '{\"msg\":\"fdb0cb97-3818-4588-ba97-4be23877192d_word.docx\",\"code\":200}', 0, NULL, '2020-09-09 17:58:08');
INSERT INTO `sys_oper_log` VALUES (214, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><p><img class=\"wscnph\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAmcAAADwCAIAAADKLFSUAAAAAXNSR0IArs4c6QAAAAlwSFlzAAASdAAAEnQB3mYfeAAAD8hJREFUeF7t3EuIVMcaB/A7d+tCUEHcSNC4FvGBgw+4YHytDESi+EAwoLhzJURBQnShySqLqFsVMTGBLHwrXjBBxHhBQd0IMqsJgiJZu/B+5EDTmWeF6p5zTtfvrGbaqjr1/b6CP6e7naHR0dF/zfg1MjIyPDw847d1QwIECBAgkCXw76zZJhMgQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3VYrAQIECOQJSM08P7MJECBAoCQBqVlSt9VKgAABAnkCUjPPz2wCBAgQKElAapbUbbUSIECAQJ6A1MzzM5sAAQIEShKQmiV1W60ECBAgkCcgNfP8zCZAgACBkgSkZkndVisBAgQI5AlIzTw/swkQIECgJAGpWVK31UqAAAECeQJSM8/PbAIECBAoSUBqltRttRIgQIBAnoDUzPMzmwABAgRKEpCaJXVbrQQIECCQJyA18/zMJkCAAIGSBKRmSd1WKwECBAjkCUjNPD+zCRAgQKAkAalZUrfVSoAAAQJ5AlIzz89sAgQIEChJQGqW1G21EiBAgECegNTM8zObAAECBEoSkJoldVutBAgQIJAnIDXz/MwmQIAAgZIEpGZJ3e5RrVeuXOnRSpYhQIBAywSkZssaZrsECBAgUKOA1KwR360JECBAoGUCUrNlDbNdAgQIEKhRQGrWiO/WBAgQINAyAanZsobZLgECBAjUKCA1a8R3awIECBBomYDUbFnDbJcAAQIEahSQmjXiuzUBAgQItExAarasYbZLgAABAjUKSM0a8d2aAAECBFomIDVb1jDbJUCAAIEaBaRmjfhuTYAAAQItE5CaLWuY7RIgQIBAjQJSs0Z8tyZAgACBlglIzZY1zHYJECBAoEYBqVkjvlsTIECAQMsEpGbLGma7BAgQIFCjgNSsEd+tCRAgQKBlAlKzZQ2zXQIECBCoUUBq1ojv1gQIECDQMgGp2bKG2S4BAgQI1CggNWvEd2sCBAgQaJmA1GxZw2yXAAECBGoUkJo14rs1AQIECLRMQGq2rGG2S4AAAQI1CkjNGvHdmgABAgRaJiA1W9Yw2yVAg', '{\"msg\":\"c9672b8b-a221-40e1-9bc5-6a4ba10b1c88_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 08:47:09');
INSERT INTO `sys_oper_log` VALUES (215, '试题', 2, 'com.ruoyi.web.controller.exams.questions.QuestionController.edit()', 'PUT', 1, 'admin', NULL, '/exams/question', '127.0.0.1', '内网IP', '{\"updateDate\":1599699078721,\"typeName\":\"选择题\",\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"subjectId\":1,\"grandName\":\"一年级\",\"options\":\"d\'d\'d\",\"id\":1,\"createDate\":1599408000000,\"subjectName\":\"一年级-语文\",\"params\":{},\"answer\":\"A\",\"questionType\":\"45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 08:51:18');
INSERT INTO `sys_oper_log` VALUES (216, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"f413b97a-4148-486c-bf70-32c92636af53_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 08:51:34');
INSERT INTO `sys_oper_log` VALUES (217, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"ae5fd062-1f06-43c6-8d26-63228ffd50ae_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 08:52:20');
INSERT INTO `sys_oper_log` VALUES (218, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"1b7f12df-715e-47af-a60b-06955782a4a9_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 09:25:18');
INSERT INTO `sys_oper_log` VALUES (219, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题(每小题5分)共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xhvw2ctwycgbcpDNzhAK', '{\"msg\":\"251ccecf-83bc-4239-999f-a44c773d21bf_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 09:26:30');
INSERT INTO `sys_oper_log` VALUES (220, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<img src=\"D:/qq/新建文件夹/images/b902dcfe-a25d-40ac-b67e-cf334b8ea9aa.png\" alt=\"\">', '{\"msg\":\"43414338-6cd8-4c67-a326-91280fa242e7_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 09:47:28');
INSERT INTO `sys_oper_log` VALUES (221, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<img style=\"margin-left:200px\" src=\"D:/qq/新建文件夹/images/b902dcfe-a25d-40ac-b67e-cf334b8ea9aa.png\" alt=\"\">', '{\"msg\":\"124d7b9c-ecd8-4866-a53a-1315a8895f3f_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 09:48:40');
INSERT INTO `sys_oper_log` VALUES (222, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<img style=\"margin-left:200px\" src=\"D:/qq/新建文件夹/images/b902dcfe-a25d-40ac-b67e-cf334b8ea9aa.png\" alt=\"\">', 'null', 1, '', '2020-09-10 10:13:51');
INSERT INTO `sys_oper_log` VALUES (223, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<img style=\"margin-left:200px\" src=\"D:/qq/新建文件夹/images/b902dcfe-a25d-40ac-b67e-cf334b8ea9aa.png\" alt=\"\">', 'null', 1, '', '2020-09-10 10:14:47');
INSERT INTO `sys_oper_log` VALUES (224, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<img style=\"margin-left:200px\" src=\"D:/qq/新建文件夹/images/b902dcfe-a25d-40ac-b67e-cf334b8ea9aa.png\" alt=\"\">', 'null', 1, '', '2020-09-10 10:15:44');
INSERT INTO `sys_oper_log` VALUES (225, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"cf93b2a2-34b8-4cf6-90e7-78fbc0f9e926_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 10:16:41');
INSERT INTO `sys_oper_log` VALUES (226, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"59a92d68-62c0-4b76-a659-8ccfff693499_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 10:18:36');
INSERT INTO `sys_oper_log` VALUES (227, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"5857467b-d84c-4181-9938-45dcdedd9389_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 10:23:49');
INSERT INTO `sys_oper_log` VALUES (228, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"b47b2069-f881-401a-b9ed-ecef182d7c7a_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 10:28:49');
INSERT INTO `sys_oper_log` VALUES (229, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"a31fa680-f12a-459e-9dd5-b8d62d05f13c_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 10:31:21');
INSERT INTO `sys_oper_log` VALUES (230, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"959c16d4-5aaa-4086-be79-cdefdc1452f9_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:08:01');
INSERT INTO `sys_oper_log` VALUES (231, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"D:/qq/uploadPath/temp/95b33dc0-aae3-4517-b485-b3097eb3d33e.png\" width=\"200\" height=\"137\" />', '{\"msg\":\"f01918ce-2a25-4af5-b3ea-b4bb6090edb1_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:10:28');
INSERT INTO `sys_oper_log` VALUES (232, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"ffd52c5d-ba2f-4bc7-af3a-b3da54648327_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:11:44');
INSERT INTO `sys_oper_log` VALUES (233, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5VB60nafCokx7aLbe3AMj20o+Ek8IgKcNOkGDTC2WXT3T1pEw7uBPWpHhWC+tCE9TFVuQOgWig2pHhMeq4UFKBShPX/Cp1i7EAABIAHs8KVYWxAShISAB5Vcuh9HNssN5bJNgrIC2GldB5KI8/IeHXr00Xh', '{\"msg\":\"f9b9b028-e7fe-4f01-a475-be4eafe4122b_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:20:03');
INSERT INTO `sys_oper_log` VALUES (234, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<h3 style=\"text-align: center;\">          江宁中心小学  一年级 语文 paper1          <span style=\"float:right;font-weight:400;\">共100分</span>        </h3>        <hr>一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5V', '{\"msg\":\"fa507503-85ff-4ab9-86f3-7855231bc5dd_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:35:24');
INSERT INTO `sys_oper_log` VALUES (235, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<h3 style=\"text-align: center;\">          江宁中心小学  一年级 语文 paper1          <span style=\"float:right;font-weight:400;\">共100分</span>        </h3>        <hr>一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7QifGiEPSQZoDotlXA2nbL0GQYotp/oEqpK0+PExRbT0xv40lJF2RmutPGH+nyoxl6fGkSHuUgKMUWzcAqAO1JSRIgf6p40/wBOtFNPBW5V', '{\"msg\":\"c03fde12-c721-44b4-a45c-cfab9718d002_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:35:46');
INSERT INTO `sys_oper_log` VALUES (236, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<div style=\"text-align: center;                  font-size: 18px;                  height: 35px;                  line-height: 35px;                  border-bottom: 1px solid;                  margin-bottom: 10px;\">          <span style=\"font-weight: 600;\">江宁中心小学  一年级 语文 paper1</span>          <span style=\"float:right;font-weight:400;\">共100分</span>        </div>        一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/><p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1', '{\"msg\":\"e51d25f9-8863-4507-9f98-ef16ee67aa6c_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 11:41:30');
INSERT INTO `sys_oper_log` VALUES (237, '试卷', 2, 'com.ruoyi.web.controller.exams.paper.PaperController.edit()', 'PUT', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"updateDate\":1599494400000,\"params\":{},\"subjectId\":1,\"grandId\":39,\"schoolId\":103,\"name\":\"期中\",\"parts\":[{\"partQuestions\":[{\"questionId\":1,\"question\":{\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"id\":1,\"params\":{},\"answer\":\"A\"},\"sort\":1,\"params\":{},\"id\":1},{\"questionId\":5,\"question\":{\"title\":\"回答\",\"content\":\"<p>看图写话</p>\\n<p><img class=\\\"wscnph\\\" style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpKuYE3HDXh7fkZQy1lciwuDZp8WW1D+1+8oeoNh355MqFejF6OytUXFrxI15ZqViG1h7HWTwn6esHZ5wHq0D0B9c9e6IVldK/FNL0ADBZbi3kijv9Sf7dhslnAA8WokXyHFEH7Ropp/pSYXA7', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 13:52:52');
INSERT INTO `sys_oper_log` VALUES (238, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":3,\"grandId\":40,\"paperScore\":100,\"schoolId\":103,\"name\":\"期末\",\"parts\":[{\"partScore\":50.0,\"questions\":[{\"id\":5,\"questionScore\":5.0,\"sort\":1,\"params\":{}}],\"sort\":1,\"params\":{},\"questionType\":45},{\"partScore\":50.0,\"questions\":[{\"id\":5,\"questionScore\":5.0,\"sort\":1,\"params\":{}}],\"discrib\":\"0\",\"sort\":2,\"params\":{},\"questionType\":46}]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.ExamsPaperMapper.insertExamsPaper-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_paper          ( name,             school_id,             grand_id,             subject_id,                                       paper_score )           values ( ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-09-10 14:31:01');
INSERT INTO `sys_oper_log` VALUES (239, '试卷', 3, 'com.ruoyi.web.controller.exams.paper.PaperController.remove()', 'DELETE', 1, 'admin', NULL, '/exams/paper/wewe', '127.0.0.1', '内网IP', '{ids=wewe}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:33:57');
INSERT INTO `sys_oper_log` VALUES (240, '试卷', 1, 'com.ruoyi.web.controller.exams.paper.PaperController.add()', 'POST', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":3,\"grandId\":40,\"paperScore\":100,\"schoolId\":103,\"name\":\"期末\",\"parts\":[{\"partScore\":50.0,\"questions\":[{\"id\":1,\"questionScore\":50.0,\"sort\":1,\"params\":{}}],\"sort\":1,\"params\":{},\"id\":\"0f950147-b3e6-41ae-98e9-3f93e95ddf96\",\"questionType\":45},{\"partScore\":50.0,\"questions\":[{\"id\":5,\"questionScore\":50.0,\"sort\":1,\"params\":{}}],\"discrib\":\"ww\",\"sort\":2,\"params\":{},\"id\":\"9e3f0e51-8f76-4716-8784-80dd6a435814\",\"questionType\":46}],\"id\":\"b5e5f4b4-5a82-4f09-8442-db93b4c7cf7c\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:34:40');
INSERT INTO `sys_oper_log` VALUES (241, '试卷', 2, 'com.ruoyi.web.controller.exams.paper.PaperController.edit()', 'PUT', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":3,\"grandId\":40,\"schoolId\":103,\"name\":\"期末\",\"parts\":[{\"partQuestions\":[{\"questionId\":1,\"question\":{\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"id\":1,\"params\":{},\"answer\":\"A\"},\"questionScore\":50.0,\"sort\":1,\"params\":{},\"id\":4}],\"questions\":[{\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"id\":1,\"params\":{},\"answer\":\"A\"},{\"id\":5,\"questionScore\":55.0,\"sort\":2,\"params\":{}}],\"typeName\":\"选择题\",\"params\":{},\"id\":\"482e6611-3057-4412-8138-494744f724e1\",\"questionType\":45},{\"partQuestions\":[{\"questionId\":5,\"question\":{\"title\":\"回答\",\"content\":\"<p>看图写话</p>\\n<p><img class=\\\"wscnph\\\" style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEb', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'sort\' cannot be null\r\n### The error may involve com.ruoyi.system.mapper.ExamsPaperPartMapper.insertExamsPaperPartBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exams_paper_part         (paper_id, part_id, sort, part_score)         values                        (             ?,             ?,             ?,             ?             )          ,              (             ?,             ?,             ?,             ?             )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'sort\' cannot be null\n; Column \'sort\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'sort\' cannot be null', '2020-09-10 14:35:12');
INSERT INTO `sys_oper_log` VALUES (242, '试卷', 2, 'com.ruoyi.web.controller.exams.paper.PaperController.edit()', 'PUT', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"params\":{},\"subjectId\":3,\"grandId\":40,\"schoolId\":103,\"name\":\"期末\",\"parts\":[{\"partQuestions\":[{\"questionId\":1,\"question\":{\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"id\":1,\"params\":{},\"answer\":\"A\"},\"questionScore\":50.0,\"sort\":1,\"params\":{},\"id\":4}],\"questions\":[{\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"id\":1,\"sort\":1,\"params\":{},\"answer\":\"A\"},{\"id\":5,\"questionScore\":50.0,\"sort\":2,\"params\":{}}],\"typeName\":\"选择题\",\"sort\":1,\"params\":{},\"id\":\"ebc4390a-5c15-4090-8241-d9f5b502af43\",\"questionType\":45},{\"partQuestions\":[{\"questionId\":5,\"question\":{\"title\":\"回答\",\"content\":\"<p>看图写话</p>\\n<p><img class=\\\"wscnph\\\" style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+a', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:38:24');
INSERT INTO `sys_oper_log` VALUES (243, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"createBy\":\"admin\",\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"deptIds\":[],\"menuIds\":[107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2000,2001,2002,2003,2004,2005,1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:58:24');
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":101,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"createBy\":\"admin\",\"roleKey\":\"student\",\"roleName\":\"学生\",\"deptIds\":[],\"menuIds\":[2000,2001,2002,2003,2004,2005],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:58:59');
INSERT INTO `sys_oper_log` VALUES (245, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"江宁区\",\"leader\":\"qq\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:59:39');
INSERT INTO `sys_oper_log` VALUES (246, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"南京\",\"leader\":\"qq\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 14:59:52');
INSERT INTO `sys_oper_log` VALUES (247, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"江宁中心小学\",\"leader\":\"qq\",\"deptId\":103,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:00:01');
INSERT INTO `sys_oper_log` VALUES (248, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"qq\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"江宁中心小学\",\"leader\":\"qq\",\"deptId\":103,\"orderNum\":\"2\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2020-09-10 15:02:15');
INSERT INTO `sys_oper_log` VALUES (249, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"\",\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"postName\":\"校长\",\"postCode\":\"ceo\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:02:33');
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13188888888\",\"admin\":false,\"password\":\"$2a$10$AVVePQQ2uOKFNuchOiny0ObO3n47gIh77ohJlDbSpt66T68P1tFZ6\",\"postIds\":[4],\"email\":\"qq@qq.com\",\"nickName\":\"lx\",\"sex\":\"1\",\"deptId\":103,\"params\":{},\"userName\":\"lx\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[100],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:03:31');
INSERT INTO `sys_oper_log` VALUES (251, '试卷', 2, 'com.ruoyi.web.controller.exams.paper.PaperController.edit()', 'PUT', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"updateTime\":1599723139534,\"params\":{},\"subjectId\":2,\"createBy\":\"admin\",\"grandId\":39,\"schoolId\":103,\"name\":\"paper2\",\"parts\":[{\"partQuestions\":[{\"questionId\":1,\"question\":{\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"answer\":\"A\",\"id\":1},\"questionScore\":10.0,\"sort\":1,\"params\":{},\"id\":3}],\"partScore\":50.0,\"questions\":[{\"questionScore\":10.0,\"sort\":1,\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"answer\":\"A\",\"id\":1}],\"typeName\":\"选择题\",\"discrib\":\"www\",\"sort\":1,\"params\":{},\"id\":\"17333cba-4c74-4f00-84aa-f308faa94a5b\",\"questionType\":45}],\"id\":\"49563499-256a-4414-959f-3d566909fcd9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:32:19');
INSERT INTO `sys_oper_log` VALUES (252, '试卷', 2, 'com.ruoyi.web.controller.exams.paper.PaperController.edit()', 'PUT', 1, 'admin', NULL, '/exams/paper', '127.0.0.1', '内网IP', '{\"updateTime\":1599723414930,\"params\":{},\"subjectId\":2,\"createBy\":\"admin\",\"grandId\":39,\"paperScore\":100,\"schoolId\":103,\"name\":\"测试\",\"parts\":[{\"partQuestions\":[{\"questionId\":1,\"question\":{\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"answer\":\"A\",\"id\":1},\"questionScore\":10.0,\"sort\":1,\"params\":{},\"id\":9}],\"partScore\":50.0,\"questions\":[{\"questionScore\":10.0,\"sort\":1,\"params\":{},\"title\":\"test\",\"content\":\"<p>这是一个选择题</p>\\n<p>A、sss</p>\\n<p>B、ddds</p>\",\"answer\":\"A\",\"id\":1}],\"typeName\":\"选择题\",\"discrib\":\"www\",\"sort\":1,\"params\":{},\"id\":\"918b023d-d144-4fde-9190-922465c5dc69\",\"questionType\":45}],\"id\":\"49563499-256a-4414-959f-3d566909fcd9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:36:55');
INSERT INTO `sys_oper_log` VALUES (253, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:52:37');
INSERT INTO `sys_oper_log` VALUES (254, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:53:05');
INSERT INTO `sys_oper_log` VALUES (255, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 15:53:42');
INSERT INTO `sys_oper_log` VALUES (256, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"www\",\"concurrent\":\"1\",\"params\":{},\"cronExpression\":\"0/10 * * * * ?\",\"jobId\":100,\"createBy\":\"admin\",\"nextValidTime\":1599725050000,\"invokeTarget\":\"FileTask.deleteTempFile()\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:04:07');
INSERT INTO `sys_oper_log` VALUES (257, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:04:25');
INSERT INTO `sys_oper_log` VALUES (258, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":100,\"misfirePolicy\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:04:44');
INSERT INTO `sys_oper_log` VALUES (259, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":100,\"misfirePolicy\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:06:30');
INSERT INTO `sys_oper_log` VALUES (260, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<div style=\"text-align: center;                  font-size: 18px;                  height: 35px;                  line-height: 35px;                  border-bottom: 1px solid;                  margin-bottom: 10px;\">          <span style=\"font-weight: 600;\">江宁中心小学  一年级 语文 期中</span>          <span style=\"float:right;font-weight:400;\">共100分</span>        </div>        一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/>二、简答题&nbsp;(每小题8分)&nbsp;&nbsp;共50分<p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpK', '{\"msg\":\"a4ee3ffe-2b73-4205-a433-1283954e88fa_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 16:12:03');
INSERT INTO `sys_oper_log` VALUES (261, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"删除试卷导出的临时文件\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 0/30 * * * ?\",\"jobId\":100,\"createBy\":\"admin\",\"nextValidTime\":1599726600000,\"createTime\":1599725047000,\"updateBy\":\"admin\",\"invokeTarget\":\"FileTask.deleteTempFile()\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:15:30');
INSERT INTO `sys_oper_log` VALUES (262, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":100,\"misfirePolicy\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:15:37');
INSERT INTO `sys_oper_log` VALUES (263, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":100,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-10 16:16:03');
INSERT INTO `sys_oper_log` VALUES (264, '试卷', 5, 'com.ruoyi.web.controller.exams.paper.PaperController.export()', 'POST', 1, 'admin', NULL, '/exams/paper/export', '127.0.0.1', '内网IP', '<div style=\"text-align: center;                  font-size: 18px;                  height: 35px;                  line-height: 35px;                  border-bottom: 1px solid;                  margin-bottom: 10px;\">          <span style=\"font-weight: 600;\">江宁中心小学  一年级 语文 期中</span>          <span style=\"float:right;font-weight:400;\">共100分</span>        </div>        一、选择题&nbsp;(每小题5分)&nbsp;&nbsp;共50分<p>1、这是一个选择题</p><p>A、sss</p><p>B、ddds</p><br/>二、简答题&nbsp;(每小题8分)&nbsp;&nbsp;共50分<p>2、看图写话</p><p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCACJAMgDASIAAhEBAxEB/8QAHQAAAgIDAQEBAAAAAAAAAAAABAUGBwADCAIJAf/EAEkQAAEDAwIDBAYGBgYJBQAAAAECAxEABAUGIQcSMRMiQVEIMmFxgZEUI0JSobEVM2KCksEWJENy0fAXJmOissLS4fFEU4Sj4v/EABwBAAIDAQEBAQAAAAAAAAAAAAMEAgUGBwEIAP/EADMRAAEEAQMCBAQFAwUAAAAAAAEAAgMRBAUhMRJBBhNRcRQiYYEVIzKRoQex4VLB0fDx/9oADAMBAAIRAxEAPwAgXSw6odqsEKO3N7aKbunAr9av3c1JO2lxW8d4/maJae5Yr5KfCCFvrPZPmrpZj61Y9yjRbV44IBdWP36RM3B2O59tGtvmes0lJFyih1p21duTBcX/ABmim7p0J2dWf3jSNp8hI8j19lGNvggEHb2ilHxUiBxCeM3bpj61f8Rotu5WTu6v4qNIm3Y3B/7UWzcSIJ60nJFyiAp61dK2hxf8RolN05G7q49hpI0/vM0W2+BtNJyRbooeRynLdyuIDi4/vUSzcPGIdX/EaWWxKiD76fYrGquYUtJCJnp1pCQNbtSmDZW60RdPLTyrc/iNPLPF3SiCq4X/ABGjcfjEoSEhMAU+tMeYBKdhTWJ4fzM82G01QflRxCiUqt8SsRLjkj9o0cjHACAV/FRqQ2mAvHQC1ZPKB8Q2Y+cRRn9HMgkEmxegf7Or1ngGVzbN/slTq7AasKKmzUnwIrTePCxaLz5WlpPrqEkIHmfZ5nw6mACakibVp4KDS0L7NXIrlM8qh1B8j7OtanrAp3UkpPXeqrM8GZGK7gkDtwUw3ND9u6SoWtQC0KlJEgg7EeBFew4Z6yTUNyWVb4d5pt68um3NK5a7Zsg5z74m9WeVIVJP1DqikbR2az0KVyiaONkTArP6ro+TpDwXX0O3B49wfQjumGSB+xG62B2TE16CyDBPWhgSNiKDc1LgLfI2+IuM5j0X12Sm3tl3KEvOkAk8qCeZWwJ2B6HyoGI+aXaNpdXoCV65jQnXaEbhR39te0OEiQo/M0vdvrW2cQy/dMtuLkpQpYBUN+gPuPyNc6ekJ6UFnhLa60Rw1yBdy6lLt77JN7JsgDCkNK+06TI5hsmDEmI0mj6ZmapMIomkDuTwB6n/AI7oLg3gL36TXpK', '{\"msg\":\"eff06594-3146-47e3-ac03-cf0ec0af40a9_word.docx\",\"code\":200}', 0, NULL, '2020-09-10 16:17:32');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '校长', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-10 15:02:33', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES (100, '教师', 'teacher', 3, '1', '0', '0', 'admin', '2020-09-10 14:58:24', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (101, '学生', 'student', 4, '1', '0', '0', 'admin', '2020-09-10 14:58:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'qq', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 103, 'ry', 'qq', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-07 14:01:47', '测试员');
INSERT INTO `sys_user` VALUES (100, 103, 'lx', 'lx', '00', 'qq@qq.com', '13188888888', '1', '', '$2a$10$AVVePQQ2uOKFNuchOiny0ObO3n47gIh77ohJlDbSpt66T68P1tFZ6', '0', '0', '', NULL, 'admin', '2020-09-10 15:03:31', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);

SET FOREIGN_KEY_CHECKS = 1;
