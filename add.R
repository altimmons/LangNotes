











# df$EF<-main$data$`Hemo Data-EF`

# pop() -> temp

# df[!is.na(df$EF),] -> df.ef$EF
# df.ef[(df.ef$Gr2 >= 1), ] -> df.ef
# attach(df)
# subset(df, subset = ((df.ef$GRP >=1)&((!is.na(df.ef$EF)|(!is.na(df.ef$Gr2.f))))), select = c(EF, Gr2.f) ) %>% subset( subset = !is.na(Gr2.f)) %>% subset( subset = !is.na(EF)) -> src

# # detach()
# # SUBSET
# df$RF.EF[!is.na(df$EF),] -> df$RF.EF

# df-> df.c
# # rm(df)
# df.c[(df.c$GRP >= 1),] -> tmp
# dplyr::select(tmp, c(EF, Gr2.f))->tmp
# X("hasEF")
# temp$Gr2
# temp$Gr2.f %>% as.numeric()

# droplevels(temp$Gr2.f, except=c(Pre, Post))

# # with(temp, t.test())
# df.ef$EF
# # `environment<-`(df$EF[!is.na(df$EF)] -> temp, formula)
# stats::t.test( EF ~ Gr2.f, data = tmp,alternative = c("two.sided", "less", "greater"), envir=1) 
# stats::t.test( EF ~ Gr2.f, data = src,alternative = c("two.sided", "less", "greater"), envir=1) %>% 
# T("EF")
# report()

# subset(df.c, subset = (GRP==2))%>%  Hmisc::describe()
# class(df.c)
# class(df.ef)

# dplyr::full_join(df.c, df.xc, by=RecID)
```


### Cardiopulmonary Bypass Used


g <- function(x)c(Mean=mean(x,na.rm=TRUE),Median=median(x,na.rm=TRUE))
 smedian.hilow, conf.int=.5)
 quantile, probs=c(.5,.25,.75),
 quantile, probs=c(.5,.25,.75),
  smean.cl.boot
 g <- function(y) wtd.mean(y[,1],y[,2])
 
# Hmisc::bystats()
```