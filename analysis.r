### Cada Variable ###

## Repeticiones
rep <- dataset$REP_RATIO
repM <- rep[dataset$TYPE==1]
repH <- rep[dataset$TYPE==0]
# Descriptiva
summary(repM)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.00000 0.03178 0.04301 0.05033 0.05792 0.98419
summary(repH)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.00000 0.02381 0.03536 0.04540 0.05350 0.74948

# Hipotesis
# H0: u1 = u2
# Num
repMn = length(repM) # 25000
repHn = length(repH) # 25000
# Media
repMmean = mean(repM) # 0.05033079
repHmean = mean(repH) # 0.04539921
# Desviacion Estandar
repSDM = sd(repM) # 0.03753718
repSDH = sd(repH) # 0.04102671
# Estadistico
repZ = (repMmean - repHmean)/sqrt(((repSDM**2)/repMn) + ((repSDH**2)/repHn))
# 14.02232

# Test
t.test(repM, repH)
# 	Welch Two Sample t-test
# data:  repM and repH
# t = 14.022, df = 49608, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  0.004242252 0.005620903
# sample estimates:
#  mean of x  mean of y 
# 0.05033079 0.04539921

# Histograma
par(mfrow=c(2,1))
hist(repM, main="Repeticiones (GPT-2)", xlim=c(0,0.1), ylim=c(0, 600), breaks = 1000)
hist(repH, main="Repeticiones (Humanos)", xlim=c(0,0.1),ylim=c(0, 600), breaks = 1000)
# Test de normalidad
par(mfrow=c(2,1))
qqnorm(repM, main="Repeticiones QQNORM (GPT-2)", xlim=c(0,4), ylim=c(0, 1))
qqline(repM)
qqnorm(repH, main="Repeticiones QQNORM (Humanos)", xlim=c(0,4), ylim=c(0, 1))
qqline(repH)

## Longitud media de las Frases
avglen <- dataset$AVG_LENGTH
avglenM <- avglen[dataset$TYPE==1]
avglenH <- avglen[dataset$TYPE==0]
# Descriptiva
summary(avglenM)
# Min.   1st Qu. Median  Mean    3rd Qu. Max.
# 1.00   19.12   23.24   23.78   27.50   812.00
summary(avglenH)
# Min.   1st Qu. Median  Mean    3rd Qu. Max.
# 1.92   16.49   20.81   22.27   25.24   734.00

# Hipotesis
# H0: u1 = u2
# Num
avglenMn = length(avglenM) # 25000
avglenHn = length(avglenH) # 25000
# Media
avglenMmean = mean(avglenM) # 23.78365
avglenHmean = mean(avglenH) # 22.26629
# Desviacion Estandar
avglenSDM = sd(avglenM) # 12.09851
avglenSDH = sd(avglenH) # 19.28607
# Estadistico
avglenZ = (avglenMmean - avglenHmean)/sqrt(((avglenSDM**2)/avglenMn) + ((avglenSDH**2)/avglenHn))
# 10.53802

# Test
t.test(avglenM, avglenH)
# 	Welch Two Sample t-test
# data:  avglenM and avglenH
# t = 10.538, df = 42036, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  1.235144 1.799590
# sample estimates:
# mean of x mean of y 
#  23.78365  22.26629

# Histograma
par(mfrow=c(2,1))
hist(avglenM, main="Longitud Media de las frases (GPT-2)", xlim=c(0,40), ylim=c(0, 1700), breaks = 1000)
hist(avglenH, main="Longitud Media de las frases (Humanos)", xlim=c(0,40), ylim=c(0, 1700), breaks = 1000)
# Test de normalidad
par(mfrow=c(2,1))
qqnorm(avglenM, main="Longitud media de las Frases QQNORM (GPT-2)", xlim=c(0,4), ylim=c(0, 800))
qqline(avglenM)
qqnorm(avglenH, main="Longitud media de las Frases QQNORM (Humanos)", xlim=c(0,4), ylim=c(0, 800))
qqline(avglenH)

## Palabras fuera del Vocabulario
odd <- dataset$ODD_RATIO
oddM <- odd[dataset$TYPE==1]
oddH <- odd[dataset$TYPE==0]
# Descriptiva
summary(oddM)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.00000 0.02964 0.04712 0.05244 0.06604 0.98806
summary(oddH)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.00000 0.03836 0.05722 0.06826 0.08108 0.94554

# Hipotesis
# H0: u1 = u2
# Num
oddMn = length(oddM) # 25000
oddHn = length(oddH) # 25000
# Media
oddMmean = mean(oddM) # 0.05243896
oddHmean = mean(oddH) # 0.06825689
# Desviacion Estandar
oddSDM = sd(oddM) # 0.03982363
oddSDH = sd(oddH) # 0.05616775
# Estadistico
oddZ = (oddMmean - oddHmean)/sqrt(((oddSDM**2)/oddMn) + ((oddSDH**2)/oddHn))
# -36.32423

# Test
t.test(oddM, oddH)
# 	Welch Two Sample t-test
# data:  oddM and oddH
# t = -36.324, df = 45063, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -0.01667144 -0.01496440
# sample estimates:
#  mean of x  mean of y 
# 0.05243896 0.06825689

# Histograma
par(mfrow=c(2,1))
hist(oddM, main="Palabras fuera del Vocabulario (GPT-2)", xlim=c(0,0.2), ylim=c(0, 500), breaks = 1000)
hist(oddH, main="Palabras fuera del Vocabulario (Humanos)", xlim=c(0,0.2), ylim=c(0, 500), breaks = 1000)
# Test de normalidad
par(mfrow=c(2,1))
qqnorm(oddM, main="Palabras fuera del Vocabulario QQNORM (GPT-2)", xlim=c(0,4), ylim=c(0, 1))
qqline(oddM)
qqnorm(oddH, main="Palabras fuera del Vocabulario QQNORM (Humanos)", xlim=c(0,4), ylim=c(0, 1))
qqline(oddH)

## Correlacion entre los pares de variables
rep_ratio = dataset$REP_RATIO
avg_len = dataset$AVG_LENGTH
odd_ratio = dataset$ODD_RATIO

# REP_RATIO~AVG-LENGTH
corRepAvglenH = cor(rep_ratio[dataset$TYPE==0], avg_len[dataset$TYPE==0])
# 0.1064229
corRepAvglenM = cor(rep_ratio[dataset$TYPE==1], avg_len[dataset$TYPE==1])
# -0.04806003

# REP_RATIO~ODD_RATIO
corRepOddH = cor(rep_ratio[dataset$TYPE==0], odd_ratio[dataset$TYPE==0])
# 0.4114389
corRepOddM = cor(rep_ratio[dataset$TYPE==1], odd_ratio[dataset$TYPE==1])
# 0.2794138

# AVG_LENGTH~ODD_RATIO
corAvglenOddH = cor(avg_len[dataset$TYPE==0], odd_ratio[dataset$TYPE==0])
# 0.2147293
corAvglenOddM = cor(avg_len[dataset$TYPE==1], odd_ratio[dataset$TYPE==1])
# 0.1281372

## Rating
rat <- rating$RATING
ratM <- rat[rating$TYPE==1]
ratH <- rat[rating$TYPE==0]
# Descriptiva
summary(ratM)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.000   2.000   4.000   3.867   5.000   9.000
summary(ratH)
# Min.    1st Qu. Median  Mean    3rd Qu. Max.
# 0.000   1.000   3.000   3.667   6.000   10.000

# Num
ratMn = length(ratM) # 30
ratHn = length(ratH) # 30
# Media
ratMmean = mean(ratM) # 3.866667
ratHmean = mean(ratH) # 3.666667
# Desviacion Estandar
ratSDM = sd(ratM) # 2.330211
ratSDH = sd(ratH) # 3.110974
# Estadistico
ratZ = (ratMmean - ratHmean)/sqrt(((ratSDM**2)/ratMn) + ((ratSDH**2)/ratHn))
# 0.2818295

# Test
t.test(ratM, ratH)
# 	Welch Two Sample t-test
# data:  ratM and ratH
# t = 0.28183, df = 53.75, p-value = 0.7792
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -1.222912  1.622912
# sample estimates:
# mean of x mean of y 
#  3.866667  3.666667

# Histograma
par(mfrow=c(2,1))
hist(ratM, main="Rating 0(Humano)-10(GPT-2) (GPT-2)", ylim=c(0, 13))
hist(ratH, main="Rating 0(Humano)-10(GPT-2) (Humanos)", ylim=c(0, 13))
# Test de normalidad
par(mfrow=c(2,1))
qqnorm(ratM, main="Rating QQNORM (GPT-2)", xlim=c(-2,2), ylim=c(0, 10))
qqline(ratM)
qqnorm(ratH, main="Rating QQNORM (Humanos)", xlim=c(-2,2), ylim=c(0, 10))
qqline(ratH)

### Pares de Variables ###

## Palabras fuera del Vocab ~ Rating
# Recta de Regresión
plot(RATING~ODD_RATIO, rating, main="Recta de Regresión")
modOddvsRat <- lm(RATING~ODD_RATIO, rating)
abline(modOddvsRat, col=2)

summary(modOddvsRat)
# Call:
# lm(formula = RATING ~ ODD_RATIO, data = rating)
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -3.7712 -2.0249  0.1689  2.2111  6.2262 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   3.7421     0.5781   6.473 2.24e-08 ***
# ODD_RATIO     0.4599     8.5408   0.054    0.957    
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# Residual standard error: 2.75 on 58 degrees of freedom
# Multiple R-squared:  5e-05,	Adjusted R-squared:  -0.01719 
# F-statistic: 0.0029 on 1 and 58 DF,  p-value: 0.9572

# Correlacion
corOddRat <- cor(rating$ODD_RATIO, rating$RATING)
# 0.007071066

# Validacion del modelo lineal
par(mfrow=c(2,2))
plot(lm(ODD_RATIO~RATING, rating),c(2,1)) # QQ-Norm i Standard Residuals vs. Fitted
hist(rstandard(lm(ODD_RATIO~RATING, rating))) # Histograma Residuos Estandarizados
plot (rstandard(lm(ODD_RATIO~RATING, rating)),type="l") # Orden de los Residuos

## Rating ~ Repeticiones
# Recta de Regresión
plot(RATING~REP_RATIO, rating, main="Recta de Regresión")
modRepvsRat <- lm(RATING~REP_RATIO, rating)
abline(modRepvsRat, col=2)

summary(modRepvsRat)
# Call:
# lm(formula = RATING ~ REP_RATIO, data = rating)
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -4.5271 -1.9635 -0.1591  1.6107  5.5942 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   2.3233     0.6583   3.529 0.000823 ***
# REP_RATIO    31.5875    12.3809   2.551 0.013391 *  
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# Residual standard error: 2.608 on 58 degrees of freedom
# Multiple R-squared:  0.1009,	Adjusted R-squared:  0.0854 
# F-statistic: 6.509 on 1 and 58 DF,  p-value: 0.01339

# Correlacion
corRepRat <- cor(rating$REP_RATIO, rating$RATING)
# 0.3176534

# Validacion del modelo lineal
par(mfrow=c(2,2))
plot(lm(REP_RATIO~RATING, rating),c(2,1)) # QQ-Norm i Standard Residuals vs. Fitted
hist(rstandard(lm(REP_RATIO~RATING, rating))) # Histograma Residuos Estandarizados
plot (rstandard(lm(REP_RATIO~RATING, rating)),type="l") # Orden de los Residuos

# Prediccion
predict(modRepvsRat, data.frame(REP_RATIO=0.2), interval='prediction')
# fit      lwr      upr
# 8.640848 2.134714 15.14698

## Rating ~ Longitud Media de las frases
# Recta de Regresión
plot(RATING~AVG_LENGTH, rating, main="Recta de Regresión")
modAvglenvsRat <- lm(RATING~AVG_LENGTH, rating)
abline(modAvglenvsRat, col=2)

summary(modAvglenvsRat)
# Call:
# lm(formula = RATING ~ AVG_LENGTH, data = rating)
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -4.6381 -2.1564 -0.1018  2.0629  5.1195 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  6.78207    1.29278   5.246 2.29e-06 ***
# AVG_LENGTH  -0.13547    0.05605  -2.417   0.0188 *  
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# Residual standard error: 2.622 on 58 degrees of freedom
# Multiple R-squared:  0.09149,	Adjusted R-squared:  0.07583 
# F-statistic: 5.841 on 1 and 58 DF,  p-value: 0.01882

# Correlacion
corAvglenRat <- cor(rating$AVG_LENGTH, rating$RATING)
# -0.3024741

# Validacion del modelo lineal
par(mfrow=c(2,2))
plot(lm(AVG_LENGTH~RATING, rating),c(2,1)) # QQ-Norm i Standard Residuals vs. Fitted
hist(rstandard(lm(AVG_LENGTH~RATING, rating))) # Histograma Residuos Estandarizados
plot (rstandard(lm(AVG_LENGTH~RATING, rating)),type="l") # Orden de los Residuos

# Prediccion
predict(modAvglenvsRat, data.frame(AVG_LENGTH=10), interval='prediction')
# fit      lwr         upr
# 5.427356 -0.03957255 10.89429

## Palabras fuera del Vocabulario ~ Longitud Media de las frases
# Humano
# Recta de Regresión
plot(ODD_RATIO~AVG_LENGTH, dataset[dataset$TYPE==0,], main="Recta de Regresión (Humanos)")
modAvglenvsOddH <- lm(ODD_RATIO~AVG_LENGTH, dataset[dataset$TYPE==0,])
abline(modAvglenvsOddH, col=2)

summary(modAvglenvsOddH)
# Call:
# lm(formula = ODD_RATIO ~ AVG_LENGTH, data = dataset[dataset$TYPE == 0, ])
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -0.33554 -0.02967 -0.01113  0.01347  0.86595 
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 5.433e-02  5.299e-04  102.52   <2e-16 ***
# AVG_LENGTH  6.254e-04  1.799e-05   34.76   <2e-16 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# Residual standard error: 0.05486 on 24998 degrees of freedom
# Multiple R-squared:  0.04611,	Adjusted R-squared:  0.04607 
# F-statistic:  1208 on 1 and 24998 DF,  p-value: < 2.2e-16

# Validacion del modelo lineal
par(mfrow=c(2,2))
plot(lm(AVG_LENGTH~ODD_RATIO, dataset[dataset$TYPE==0,]),c(2,1)) # QQ-Norm i Standard Residuals vs. Fitted
hist(rstandard(lm(AVG_LENGTH~ODD_RATIO, dataset[dataset$TYPE==0,]))) # Histograma Residuos Estandarizados
plot (rstandard(lm(AVG_LENGTH~ODD_RATIO, dataset[dataset$TYPE==0,])),type="l") # Orden de los Residuos

# Prediccion
predict(modAvglenvsOddH, data.frame(AVG_LENGTH=10), interval='prediction')
# fit        lwr         upr
# 0.06058596 -0.04694326 0.1681152

# GPT2
# Recta de Regresión
plot(ODD_RATIO~AVG_LENGTH, dataset[dataset$TYPE==1,], main="Recta de Regresión (GPT-2)")
modAvglenvsOddM <- lm(ODD_RATIO~AVG_LENGTH, dataset[dataset$TYPE==1,])
abline(modAvglenvsOddM, col=2)

summary(modAvglenvsOddM)
# Call:
# lm(formula = ODD_RATIO ~ AVG_LENGTH, data = dataset[dataset$TYPE == 1, ])
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -0.25558 -0.02258 -0.00577  0.01319  0.93085 
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 4.241e-02  5.510e-04   76.97   <2e-16 ***
# AVG_LENGTH  4.218e-04  2.065e-05   20.43   <2e-16 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# Residual standard error: 0.0395 on 24998 degrees of freedom
# Multiple R-squared:  0.01642,	Adjusted R-squared:  0.01638 
# F-statistic: 417.3 on 1 and 24998 DF,  p-value: < 2.2e-16

# Validacion del modelo lineal
par(mfrow=c(2,2))
plot(lm(AVG_LENGTH~ODD_RATIO, dataset[dataset$TYPE==1,]),c(2,1)) # QQ-Norm i Standard Residuals vs. Fitted
hist(rstandard(lm(AVG_LENGTH~ODD_RATIO, dataset[dataset$TYPE==1,]))) # Histograma Residuos Estandarizados
plot (rstandard(lm(AVG_LENGTH~ODD_RATIO, dataset[dataset$TYPE==1,])),type="l") # Orden de los Residuos

# Prediccion
predict(modAvglenvsOddM, data.frame(AVG_LENGTH=10), interval='prediction')
# fit        lwr         upr
# 0.04662532 -0.03079298 0.1240436
