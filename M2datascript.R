###I - Charger les librairies ----

library(foreign)
library(questionr)
library(survey)
library(R2HTML)
library(tidyverse)
library(FactoMineR)

###II - Charger les bases ----

epic <- read.csv("repondant.txt", sep="\t") #base de données
epicf <- select(epic, c(AGEM), c(SEXER), c(F_SITLONG), c(F_CS13C), c(F_PNAISCR), c(F_SEPPAR), c(H_NBREL), c(I_DEJA), c(M_CS13), c(C_DIPL1), c(M_NATIOR), c(M_REVENUF), c(P_CHANCE), c(P_EXCLU), c(P_SATSITU))
epicfa <- filter(epicf, AGEM%in%c(25:35))

###III - Recodage des variables ----

#Sexe ----  

epicfa$sexe <- as.factor(epicfa$SEXER)
epicfa$sexe <- fct_recode(epicfa$sexe,
                         "homme"="1",
                         "femme"="2")

table(epicfa$sexe)
table(epicfa$SEXER)