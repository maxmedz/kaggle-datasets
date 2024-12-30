library(tidyverse)
library(dplyr)
library(ggplot2)
x<-read_csv("Data/Depression Professional Dataset.csv")
glimpse(x)
##since depression is the categorical variable this project is to work with the logistic regression.
##but first, i will need to rename the variables so that it is easier to work
df<-select(x,
          sex = "Gender",
          age = "Age",
          wrkpr = "Work Pressure",
          jobsat = "Job Satisfaction",
          sleep = "Sleep Duration",
          diets = "Dietary Habits",
          suicth = "Have you ever had suicidal thoughts ?",
          wrkhrs = "Work Hours",
          finstr = "Financial Stress",
          gen = "Family History of Mental Illness",
          depression = "Depression")
glimpse(df)
#recoding the variables to prepare them
df<-mutate(df,
           sex=ifelse(sex=="Male",0,1),
           suicth=ifelse(suicth=="Yes",1,0),
           gen=ifelse(gen=="Yes",1,0),
           depression=ifelse(depression=="Yes",1,0),
           sleep=factor(sleep,
                         levels = c("Less than 5 hours","5-6 hours","7-8 hours", "More than 8 hours"),
                         ordered = TRUE
                        ),
           diets=factor(diets,
                       levels = c("Unhealthy","Moderate","Healthy"),
                       ordered = TRUE)
)

