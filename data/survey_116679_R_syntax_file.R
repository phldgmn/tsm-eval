data <- read.csv("/Users/philhennel/Downloads/survey_116679_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE, fileEncoding="UTF-8-BOM")


# LimeSurvey Field type: F
data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"
# LimeSurvey Field type: F
data[, 3] <- as.numeric(data[, 3])
attributes(data)$variable.labels[3] <- "lastpage"
names(data)[3] <- "lastpage"
# LimeSurvey Field type: A
data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "startlanguage"
names(data)[4] <- "startlanguage"
# LimeSurvey Field type: A
data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "seed"
names(data)[5] <- "seed"
# LimeSurvey Field type: A
data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- ""
names(data)[6] <- "ID"
# LimeSurvey Field type: A
data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "Thank you for participating in this survey on digital transformation in healthcare. This survey is a joint project of the University of Cologne and the Karlsruhe Institute of Technology about examining the effects of digital transformation on employees.  A German version of the survey can be filled out by changing the language settings above (Um den Fragebogen in deutsch auszufüllen, klicken Sie bitte oben rechts auf \"Language\" und dann auf Deutsch). Your participation in this study is voluntary. You can revoke or cancel your participation in the survey at any time. For further information on the applicable data privacy policy, see the section below. Please feel free to direct any questions to  Dr. Phil Hennel or Dr. Scott Thiebes."
data[, 7] <- factor(data[, 7], levels=c("A1"),labels=c("I accept the outlined privacy policy"))
names(data)[7] <- "WELC"
# LimeSurvey Field type: F
data[, 8] <- as.numeric(data[, 8])
attributes(data)$variable.labels[8] <- "Have you experienced the introduction of IT or software in your job within the last three years?"
data[, 8] <- factor(data[, 8], levels=c(1,2),labels=c("Yes", "No"))
names(data)[8] <- "OWNEXPERIENCE"
# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[9] <- "Please describe the IT or software that was introduced in your job within the last three years. Which IT or software was introduced and in which type of organization?  You do not have to mention any identifyable information (such as locations, persons or organizations)."
names(data)[9] <- "DESC"
# LimeSurvey Field type: A
data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "Thank you for sharing your experience! In the following, we would like to measure your perception of the IT or software that was introduced in your job within the last three years that you described on the previous page. Therefore, please answer the following questions in relation to the IT software you described."
names(data)[10] <- "DESCINFO"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "[People in my organization who use the system have more prestige than those who do not.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 11] <- factor(data[, 11], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[11] <- "IMG_IMG1"
# LimeSurvey Field type: F
data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "[People in my organization who use the system have a high profile.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 12] <- factor(data[, 12], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[12] <- "IMG_IMG2"
# LimeSurvey Field type: F
data[, 13] <- as.numeric(data[, 13])
attributes(data)$variable.labels[13] <- "[Having the system is a status symbol in my organization.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 13] <- factor(data[, 13], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[13] <- "IMG_IMG3"
# LimeSurvey Field type: F
data[, 14] <- as.numeric(data[, 14])
attributes(data)$variable.labels[14] <- "[My interaction with the system is clear and understandable.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 14] <- factor(data[, 14], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[14] <- "PEOU_PEOU1"
# LimeSurvey Field type: F
data[, 15] <- as.numeric(data[, 15])
attributes(data)$variable.labels[15] <- "[It is easy for me to become skillful at using the system.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 15] <- factor(data[, 15], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[15] <- "PEOU_PEOU2"
# LimeSurvey Field type: F
data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "[I find the system easy to use.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 16] <- factor(data[, 16], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[16] <- "PEOU_PEOU3"
# LimeSurvey Field type: F
data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "[Learning to operate the system is easy for me.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 17] <- factor(data[, 17], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[17] <- "PEOU_PEOU4"
# LimeSurvey Field type: F
data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[18] <- "[Interacting with the system does not require a lot of my mental effort.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 18] <- factor(data[, 18], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[18] <- "PEOU_PEOU5"
# LimeSurvey Field type: F
data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "[I find it easy to get the system to do what I want it to do.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 19] <- factor(data[, 19], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[19] <- "PEOU_PEOU6"
# LimeSurvey Field type: F
data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "[I have seen what others do using a system like this.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 20] <- factor(data[, 20], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[20] <- "VIS_VIS1"
# LimeSurvey Field type: F
data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[21] <- "[I have seen a system like this in use in other organizations.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 21] <- factor(data[, 21], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[21] <- "VIS_VIS2"
# LimeSurvey Field type: F
data[, 22] <- as.numeric(data[, 22])
attributes(data)$variable.labels[22] <- "[I know other organizations that use a system like this.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 22] <- factor(data[, 22], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[22] <- "VIS_VIS3"
# LimeSurvey Field type: F
data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[My use of the system is voluntary.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 23] <- factor(data[, 23], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[23] <- "VOI_VOI1"
# LimeSurvey Field type: F
data[, 24] <- as.numeric(data[, 24])
attributes(data)$variable.labels[24] <- "[My supervisor does not require me to use the system.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 24] <- factor(data[, 24], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[24] <- "VOI_VOI2"
# LimeSurvey Field type: F
data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "[Although it might be helpful, using the system is certainly not compulsory in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 25] <- factor(data[, 25], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[25] <- "VOI_VOI3"
# LimeSurvey Field type: F
data[, 26] <- as.numeric(data[, 26])
attributes(data)$variable.labels[26] <- "[My superiors expect me to use the system.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 26] <- factor(data[, 26], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[26] <- "VOI_VOI4"
# LimeSurvey Field type: F
data[, 27] <- as.numeric(data[, 27])
attributes(data)$variable.labels[27] <- "[Using the system improves my performance in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 27] <- factor(data[, 27], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[27] <- "PUA_PUA1"
# LimeSurvey Field type: F
data[, 28] <- as.numeric(data[, 28])
attributes(data)$variable.labels[28] <- "[Using the system in my job increases my productivity.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 28] <- factor(data[, 28], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[28] <- "PUA_PUA2"
# LimeSurvey Field type: F
data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Using the system enhances my effectiveness in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 29] <- factor(data[, 29], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[29] <- "PUA_PUA3"
# LimeSurvey Field type: F
data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[I find the system to be useful in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 30] <- factor(data[, 30], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[30] <- "PUA_PUA4"
# LimeSurvey Field type: F
data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[Using the system enables me to accomplish tasks more quickly.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 31] <- factor(data[, 31], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[31] <- "PUA_PUA5"
# LimeSurvey Field type: F
data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[If I use the system, I will increase my chances of getting a raise.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 32] <- factor(data[, 32], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[32] <- "PUA_PUA6"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[Using the system improves the quality of work I do.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 33] <- factor(data[, 33], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[33] <- "PUA_PUA7"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[34] <- "[Using the system makes it easier to do my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 34] <- factor(data[, 34], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[34] <- "PUA_PUA8"
# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "[I have no difficulty telling others about the results of using the system.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 35] <- factor(data[, 35], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[35] <- "RES_RES1"
# LimeSurvey Field type: F
data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[36] <- "[I believe I could communicate to others the consequences of using the system.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 36] <- factor(data[, 36], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[36] <- "RES_RES2"
# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "[The results of using the system are apparent to me.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 37] <- factor(data[, 37], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[37] <- "RES_RES3"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "[I would have difficulty explaining why using the system may or may not be beneficial.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 38] <- factor(data[, 38], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[38] <- "RES_RES4"
# LimeSurvey Field type: F
data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[39] <- "[The system enables my supervisor(s) to monitor my activities more closely.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 39] <- factor(data[, 39], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[39] <- "SQR_SQR1"
# LimeSurvey Field type: F
data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[40] <- "[The system enables my supervisor(s) to have more control over my activities.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 40] <- factor(data[, 40], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[40] <- "SQR_SQR2"
# LimeSurvey Field type: F
data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[41] <- "[My managers use the system to secure their authority.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 41] <- factor(data[, 41], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[41] <- "SQR_SQR3"
# LimeSurvey Field type: F
data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[42] <- "[The system does not lead to changes in the organizational hierarchy.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 42] <- factor(data[, 42], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[42] <- "SQR_SQR4"
# LimeSurvey Field type: F
data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[43] <- "[I miss face-to-face contact with my co-workers since the system was introduced.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 43] <- factor(data[, 43], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[43] <- "SR_SR1"
# LimeSurvey Field type: F
data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[44] <- "[I feel isolated in my work environment since the system was introduced.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 44] <- factor(data[, 44], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[44] <- "SR_SR2"
# LimeSurvey Field type: F
data[, 45] <- as.numeric(data[, 45])
attributes(data)$variable.labels[45] <- "[I miss the emotional support of coworkers since the system was introduced.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 45] <- factor(data[, 45], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[45] <- "SR_SR3"
# LimeSurvey Field type: F
data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[I miss informal interaction with others since the system was introduced.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 46] <- factor(data[, 46], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[46] <- "SR_SR4"
# LimeSurvey Field type: F
data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Knowledge gained by using the system will be helpful to me for my work in the future.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 47] <- factor(data[, 47], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[47] <- "LS_LS1"
# LimeSurvey Field type: F
data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[The system provides me with information that had been previously unknown to me.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 48] <- factor(data[, 48], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[48] <- "LS_LS2"
# LimeSurvey Field type: F
data[, 49] <- as.numeric(data[, 49])
attributes(data)$variable.labels[49] <- "[Information provided by the system uncovers aspects of my work environment that have been previously unknown to me.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 49] <- factor(data[, 49], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[49] <- "LS_LS3"
# LimeSurvey Field type: F
data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[Information provided by the system helps me to better understand my work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 50] <- factor(data[, 50], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[50] <- "LS_LS4"
# LimeSurvey Field type: F
data[, 51] <- as.numeric(data[, 51])
attributes(data)$variable.labels[51] <- "[Information provided by the system helps me to stay close to the work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 51] <- factor(data[, 51], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[51] <- "LS_LS5"
# LimeSurvey Field type: F
data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[52] <- "[Information provided by the system helps me to increase my focus in the work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 52] <- factor(data[, 52], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[52] <- "LS_LS6"
# LimeSurvey Field type: F
data[, 53] <- as.numeric(data[, 53])
attributes(data)$variable.labels[53] <- "[Information provided by the system helps me to test assumptions about the work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 53] <- factor(data[, 53], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[53] <- "LS_LS7"
# LimeSurvey Field type: F
data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[54] <- "[Information provided by the system helps me to improve insights about the work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 54] <- factor(data[, 54], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[54] <- "LS_LS8"
# LimeSurvey Field type: F
data[, 55] <- as.numeric(data[, 55])
attributes(data)$variable.labels[55] <- "[Information gained by using the system gives me greater control over my work.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 55] <- factor(data[, 55], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[55] <- "PPC_PPC1"
# LimeSurvey Field type: F
data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "[Information gained by using the system enables me to make a decision without consulting my supervisor(s) or co-workers.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 56] <- factor(data[, 56], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[56] <- "PPC_PPC2"
# LimeSurvey Field type: F
data[, 57] <- as.numeric(data[, 57])
attributes(data)$variable.labels[57] <- "[Information gained by using the system enables me to work more independently of my supervisor(s) or co-workers.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 57] <- factor(data[, 57], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[57] <- "PPC_PPC3"
# LimeSurvey Field type: F
data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[58] <- "[Information gained by using the system enables me to structure my work more independently.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 58] <- factor(data[, 58], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[58] <- "PPC_PPC4"
# LimeSurvey Field type: F
data[, 59] <- as.numeric(data[, 59])
attributes(data)$variable.labels[59] <- "[Information gained by using the system enables me to implement more of my own ideas for my work.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 59] <- factor(data[, 59], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[59] <- "PPC_PPC5"
# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Information gained by using the system gives me more freedom in my work.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 60] <- factor(data[, 60], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[60] <- "PPC_PPC6"
# LimeSurvey Field type: F
data[, 61] <- as.numeric(data[, 61])
attributes(data)$variable.labels[61] <- "[The way the information is presented by the system improves my performance in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 61] <- factor(data[, 61], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[61] <- "PS_PS01"
# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[The way the information is presented by the system increases my productivity in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 62] <- factor(data[, 62], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[62] <- "PS_PS02"
# LimeSurvey Field type: F
data[, 63] <- as.numeric(data[, 63])
attributes(data)$variable.labels[63] <- "[The way the information is presented by the system enhances my effectiveness in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 63] <- factor(data[, 63], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[63] <- "PS_PS03"
# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[64] <- "[I find the way the information is presented by the system to be useful in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 64] <- factor(data[, 64], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[64] <- "PS_PS04"
# LimeSurvey Field type: F
data[, 65] <- as.numeric(data[, 65])
attributes(data)$variable.labels[65] <- "[The way the information is presented by the system enables me to accomplish tasks more quickly] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 65] <- factor(data[, 65], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[65] <- "PS_PS05"
# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[66] <- "[The way the information is presented by the system improves the quality of work I do.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 66] <- factor(data[, 66], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[66] <- "PS_PS06"
# LimeSurvey Field type: F
data[, 67] <- as.numeric(data[, 67])
attributes(data)$variable.labels[67] <- "[The way the information is presented by the system makes it easier to do my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 67] <- factor(data[, 67], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[67] <- "PS_PS07"
# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[68] <- "[The way the information is presented assists me in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 68] <- factor(data[, 68], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[68] <- "PS_PS08"
# LimeSurvey Field type: F
data[, 69] <- as.numeric(data[, 69])
attributes(data)$variable.labels[69] <- "[I find the way the information is presented by the system to be helpful in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 69] <- factor(data[, 69], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[69] <- "PS_PS09"
# LimeSurvey Field type: F
data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[70] <- "[The way the information is presented by the system helps me to combine information from different sources.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 70] <- factor(data[, 70], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[70] <- "PS_PS10"
# LimeSurvey Field type: F
data[, 71] <- as.numeric(data[, 71])
attributes(data)$variable.labels[71] <- "[The way the information is presented by the system helps me to keep track of my working processes.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 71] <- factor(data[, 71], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[71] <- "PS_PS11"
# LimeSurvey Field type: F
data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[72] <- "[Using the information provided by the system improves my performance in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 72] <- factor(data[, 72], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[72] <- "PU_PUI1"
# LimeSurvey Field type: F
data[, 73] <- as.numeric(data[, 73])
attributes(data)$variable.labels[73] <- "[Using the information provided by the system in my job increases my productivity.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 73] <- factor(data[, 73], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[73] <- "PU_PUI2"
# LimeSurvey Field type: F
data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[74] <- "[Using the information provided by the system enhances my effectiveness in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 74] <- factor(data[, 74], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[74] <- "PU_PUI3"
# LimeSurvey Field type: F
data[, 75] <- as.numeric(data[, 75])
attributes(data)$variable.labels[75] <- "[I find the information provided by the system to be useful in my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 75] <- factor(data[, 75], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[75] <- "PU_PUI4"
# LimeSurvey Field type: F
data[, 76] <- as.numeric(data[, 76])
attributes(data)$variable.labels[76] <- "[Using the information provided by the system enables me to accomplish tasks more quickly.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 76] <- factor(data[, 76], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[76] <- "PU_PUI5"
# LimeSurvey Field type: F
data[, 77] <- as.numeric(data[, 77])
attributes(data)$variable.labels[77] <- "[If I use the information provided by the system, I will increase my chances of getting a raise.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 77] <- factor(data[, 77], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[77] <- "PU_PUI6"
# LimeSurvey Field type: F
data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[78] <- "[Using the information provided by the system improves the quality of work I do.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 78] <- factor(data[, 78], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[78] <- "PU_PUI7"
# LimeSurvey Field type: F
data[, 79] <- as.numeric(data[, 79])
attributes(data)$variable.labels[79] <- "[Using the information provided by the system makes it easier to do my job.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 79] <- factor(data[, 79], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[79] <- "PU_PUI8"
# LimeSurvey Field type: F
data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[80] <- "[Information provided by the system reduces the need to have previous knowledge for my tasks.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 80] <- factor(data[, 80], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[80] <- "TKR_TKR1"
# LimeSurvey Field type: F
data[, 81] <- as.numeric(data[, 81])
attributes(data)$variable.labels[81] <- "[Information provided by the system would enable new employees to perform my tasks with less previous knowledge.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 81] <- factor(data[, 81], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[81] <- "TKR_TKR2"
# LimeSurvey Field type: F
data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[82] <- "[Information provided by the system reduces mental effort needed for my tasks.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 82] <- factor(data[, 82], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[82] <- "TKR_TKR3"
# LimeSurvey Field type: F
data[, 83] <- as.numeric(data[, 83])
attributes(data)$variable.labels[83] <- "[I think the information provided by the system lowers training needs for new employees.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 83] <- factor(data[, 83], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[83] <- "TKR_TKR4"
# LimeSurvey Field type: F
data[, 84] <- as.numeric(data[, 84])
attributes(data)$variable.labels[84] <- "[Using the information provided by the system enables me to improve my work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 84] <- factor(data[, 84], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[84] <- "WEI_WEI1"
# LimeSurvey Field type: F
data[, 85] <- as.numeric(data[, 85])
attributes(data)$variable.labels[85] <- "[Using the information provided by the system enables me to improve the quality of services in my work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 85] <- factor(data[, 85], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[85] <- "WEI_WEI2"
# LimeSurvey Field type: F
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[86] <- "[Using the information provided by the system leads to innovation in my work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 86] <- factor(data[, 86], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[86] <- "WEI_WEI3"
# LimeSurvey Field type: F
data[, 87] <- as.numeric(data[, 87])
attributes(data)$variable.labels[87] <- "[Using the information provided by the system enables me to improve work processes in my work environment.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 87] <- factor(data[, 87], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[87] <- "WEI_WEI4"
# LimeSurvey Field type: F
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[88] <- "[Using the information provided by the system helps to surpass the performance of other organizations.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 88] <- factor(data[, 88], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[88] <- "WEI_WEI5"
# LimeSurvey Field type: F
data[, 89] <- as.numeric(data[, 89])
attributes(data)$variable.labels[89] <- "[Using the information provided by the system helps to keep up with the performance of other organizations.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 89] <- factor(data[, 89], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[89] <- "WEI_WEI6"
# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[90] <- "[Using the information provided by the system helps to surpass the performance of other divisions.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 90] <- factor(data[, 90], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[90] <- "WEI_WEI7"
# LimeSurvey Field type: F
data[, 91] <- as.numeric(data[, 91])
attributes(data)$variable.labels[91] <- "[Using the information provided by the system helps to keep up with the performance of other divisions.] Please indicate your agreement with the following statements from 7 - Strongly agree to 1 - Strongly disagree."
data[, 91] <- factor(data[, 91], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[91] <- "WEI_WEI8"
# LimeSurvey Field type: F
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[92] <- "[From your experience, how likely is the project you described in the beginning of this survey to have beneficial outcomes for you or your work?] Please indicate how you would assess the likelihood in the following questions, from 7 - impossible to 1 - certain."
data[, 92] <- factor(data[, 92], levels=c(0,1,2,3,4,5,6),labels=c("7 - impossible", "6 - unlikely", "5 - somewhat unlikely", "4 - fifty-fifty", "3 - somewhat likely", "2 - likely", "1 - certain"))
names(data)[92] <- "PERCEPTION_PROJPOS"
# LimeSurvey Field type: F
data[, 93] <- as.numeric(data[, 93])
attributes(data)$variable.labels[93] <- "[From your experience, how likely is the project you described in the beginning of this survey to have detrimental outcomes for you or your work?] Please indicate how you would assess the likelihood in the following questions, from 7 - impossible to 1 - certain."
data[, 93] <- factor(data[, 93], levels=c(0,1,2,3,4,5,6),labels=c("7 - impossible", "6 - unlikely", "5 - somewhat unlikely", "4 - fifty-fifty", "3 - somewhat likely", "2 - likely", "1 - certain"))
names(data)[93] <- "PERCEPTION_PROJNEG"
# LimeSurvey Field type: F
data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[94] <- "[From your experience, how likely is digital transformation to have beneficial outcomes in general?] Please indicate how you would assess the likelihood in the following questions, from 7 - impossible to 1 - certain."
data[, 94] <- factor(data[, 94], levels=c(0,1,2,3,4,5,6),labels=c("7 - impossible", "6 - unlikely", "5 - somewhat unlikely", "4 - fifty-fifty", "3 - somewhat likely", "2 - likely", "1 - certain"))
names(data)[94] <- "PERCEPTION_DTPOS"
# LimeSurvey Field type: F
data[, 95] <- as.numeric(data[, 95])
attributes(data)$variable.labels[95] <- "[From your experience, how likely is digital transformation to have detrimental outcomes in general?] Please indicate how you would assess the likelihood in the following questions, from 7 - impossible to 1 - certain."
data[, 95] <- factor(data[, 95], levels=c(0,1,2,3,4,5,6),labels=c("7 - impossible", "6 - unlikely", "5 - somewhat unlikely", "4 - fifty-fifty", "3 - somewhat likely", "2 - likely", "1 - certain"))
names(data)[95] <- "PERCEPTION_DTNEG"
# LimeSurvey Field type: F
data[, 96] <- as.numeric(data[, 96])
attributes(data)$variable.labels[96] <- "[My work pace is determined by digital technology.] Please indicate your agreement with the following statement from 7 - Strongly agree to 1 - Strongly disagree."
data[, 96] <- factor(data[, 96], levels=c(7,6,5,4,3,2,1),labels=c("7 - Strongly agree", "6 - Agree", "5 - Somewhat agree", "4 - Neither agree nor disagree", "3 - Somewhat disagree", "2 - Disagree", "1 - Strongly disagree"))
names(data)[96] <- "WORKPACE_SQ001"
# LimeSurvey Field type: F
data[, 97] <- as.numeric(data[, 97])
attributes(data)$variable.labels[97] <- "As a result of digital transformation, your scope for decision-making at work has rather ..."
data[, 97] <- factor(data[, 97], levels=c(3,2,1),labels=c("... increased", "... remained the same", "... decreased"))
names(data)[97] <- "AUTONOMY"
# LimeSurvey Field type: F
data[, 98] <- as.numeric(data[, 98])
attributes(data)$variable.labels[98] <- "As a result of digital transformation, the amount of work to be done has rather..."
data[, 98] <- factor(data[, 98], levels=c(3,2,1),labels=c("... increased", "... remained the same", "... decreased"))
names(data)[98] <- "WORKAMOUNT"
# LimeSurvey Field type: F
data[, 99] <- as.numeric(data[, 99])
attributes(data)$variable.labels[99] <- "Due to digital transformation, the number of processes to be handled simultaneously in your work has..."
data[, 99] <- factor(data[, 99], levels=c(3,2,1),labels=c("... increased", "... remained the same", "... decreased"))
names(data)[99] <- "PARALLEL"
# LimeSurvey Field type: F
data[, 100] <- as.numeric(data[, 100])
attributes(data)$variable.labels[100] <- "All in all, due to digital transformation your workload has rather ..."
data[, 100] <- factor(data[, 100], levels=c(3,2,1),labels=c("... increased", "... remained the same", "... decreased"))
names(data)[100] <- "WORKLOAD"
# LimeSurvey Field type: F
data[, 101] <- as.numeric(data[, 101])
attributes(data)$variable.labels[101] <- "Has your employer taken measures to reduce your workload in connection with digital transformation?"
data[, 101] <- factor(data[, 101], levels=c(1,2),labels=c("Yes", "No"))
names(data)[101] <- "MEASURES"
# LimeSurvey Field type: F
data[, 102] <- as.numeric(data[, 102])
attributes(data)$variable.labels[102] <- "And to what extent have these measures helped to reduce your workload?"
data[, 102] <- factor(data[, 102], levels=c(3,2,1,0),labels=c("to a very high degree", "to a high degree", "to a low degree", "not at all"))
names(data)[102] <- "MEASURES2"
# LimeSurvey Field type: A
data[, 103] <- as.character(data[, 103])
attributes(data)$variable.labels[103] <- "In your experience, what is/are the biggest challenge/s for the successful digital transformation in the project described by you in the beginning of this survey?"
names(data)[103] <- "DIGICHALSPEC"
# LimeSurvey Field type: A
data[, 104] <- as.character(data[, 104])
attributes(data)$variable.labels[104] <- "In your experience, what is/are the biggest benefit/s stemming from the digital transformation the project described by you in the beginning of this survey?"
names(data)[104] <- "DIGIBENSPEC"
# LimeSurvey Field type: A
data[, 105] <- as.character(data[, 105])
attributes(data)$variable.labels[105] <- "In your experience, what is/are the biggest challenge/s for the successful digital transformation in general?"
names(data)[105] <- "DIGICHALGEN"
# LimeSurvey Field type: A
data[, 106] <- as.character(data[, 106])
attributes(data)$variable.labels[106] <- "In your experience, what is/are the biggest benefit/s stemming from the digital transformation in general?"
names(data)[106] <- "DIGIBENGEN"
# LimeSurvey Field type: A
data[, 107] <- as.character(data[, 107])
attributes(data)$variable.labels[107] <- "Please indicate your country of residence."
data[, 107] <- factor(data[, 107], levels=c("DE","EU","UK","US"),labels=c("Germany", "Rest of Europe", "United Kingdom", "United States"))
names(data)[107] <- "Residence"
# LimeSurvey Field type: A
data[, 108] <- as.character(data[, 108])
attributes(data)$variable.labels[108] <- "[Other] Please indicate your country of residence."
names(data)[108] <- "Residence_other"
# LimeSurvey Field type: F
data[, 109] <- as.numeric(data[, 109])
attributes(data)$variable.labels[109] <- "Please indicate your age."
data[, 109] <- factor(data[, 109], levels=c(17,18,21,30,40,50,60,67),labels=c("17 or younger", "18-20", "21-29", "30-39", "40-49", "50-59", "60-66", "67 or older"))
names(data)[109] <- "Age"
# LimeSurvey Field type: A
data[, 110] <- as.character(data[, 110])
attributes(data)$variable.labels[110] <- "Please state your highest level of education."
data[, 110] <- factor(data[, 110], levels=c("EDU1","EDU2","EDU3","EDU4","EDU5","EDU6","EDU7","EDU8"),labels=c("Lower school-leaving certificate", "Intermediate school-leaving certificate", "Advanced technical college certificate", "Upper school-leaving certificate/GCE", "Vocational training", "Bachelor\'s/Prediploma", "Master\'s/Diploma", "Doctorate/PhD"))
names(data)[110] <- "Education"
# LimeSurvey Field type: A
data[, 111] <- as.character(data[, 111])
attributes(data)$variable.labels[111] <- "[Other] Please state your highest level of education."
names(data)[111] <- "Education_other"
# LimeSurvey Field type: F
data[, 112] <- as.numeric(data[, 112])
attributes(data)$variable.labels[112] <- "How many years of experience do you have working in healthcare or another medical or related field of work?"
data[, 112] <- factor(data[, 112], levels=c(0,2,5,10,20,21),labels=c("None", "less than 2 years", "2 to 5 years", "5 to 10 years", "10 to 20 years", "more than 20 years"))
names(data)[112] <- "ExperienceHealthcare"
# LimeSurvey Field type: A
data[, 113] <- as.character(data[, 113])
attributes(data)$variable.labels[113] <- "What gender do you most identify with?"
data[, 113] <- factor(data[, 113], levels=c("F","M","D"),labels=c("Female", "Male", "Diverse"))
names(data)[113] <- "Gender"
# LimeSurvey Field type: A
data[, 114] <- as.character(data[, 114])
attributes(data)$variable.labels[114] <- "[Other] What gender do you most identify with?"
names(data)[114] <- "Gender_other"
# LimeSurvey Field type: A
data[, 115] <- as.character(data[, 115])
attributes(data)$variable.labels[115] <- "In which area are you mainly employed at the moment?"
data[, 115] <- factor(data[, 115], levels=c("EMP1","EMP2","EMP3","EMP4","EMP5"),labels=c("Medical/Healthcare", "Service/public service", "Craft/skilled and manual work", "Production", "Agriculture/Farming"))
names(data)[115] <- "Employment"
# LimeSurvey Field type: A
data[, 116] <- as.character(data[, 116])
attributes(data)$variable.labels[116] <- "[Other] In which area are you mainly employed at the moment?"
names(data)[116] <- "Employment_other"

data