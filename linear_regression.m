clc;
clear all;
close all;
warning off;

%load dataset
df = readtable("Cancer_Statistics/cancer_data.csv");

%Split data
X = [df.new_cases_number, df.new_cases_rank, df.new_case_percent, df.new_cases_cum_risk, df.death_rank, df.death_percentage, df.Deaths_cum_risk, df.risk_of_prevalence_5yr, df.per100k_5yr_prevalence];

%build linear regession model
linreg = fitlm(X, df.DeathsNumber, 'linear')

%check coefficient of model
linreg.Coefficients

%Check number observation of model
anova(linreg, 'summary')

%Visualize linear regression model
plot(linreg)