%% Q3 DATA1
clear;clc
%% A
%% SVM
load data1.mat
figure(1);subplot(121)
theta_svm=svm_train(X,y);
test_err_svm = svm_test(theta_svm',X,y);
fprintf(sprintf("svm error for data1 is: %2.f precent\n",test_err_svm));
plot_points_and_boundary(X,y,theta_svm);hold on;
xx=min(X(:,1))-10:0.5:max(X(:,2));
y1=-xx*theta_svm(1)/theta_svm(2);
plot(xx,y1);
[line1,line2]=Find_Margins(X,y,theta_svm,y1);
plot(xx,line1,'--',xx,line2,'--');hold off;title("Svm for data1 with Margin");
%% perceptron
subplot(122)
[theta_Per] = perceptron_train_2020(X,y,false);
test_err_per=my_peceptron_test(theta_Per,1,X,y);
fprintf(sprintf("perceptron error for data1 is: %2.f precent\n",test_err_per));
plot_points_and_boundary(X,y,theta_Per);hold on;
xx=min(X(:,1))-10:0.5:max(X(:,2));
y2=-xx*theta_Per(1)/theta_Per(2);
plot(xx,y2);
[line1,line2]=Find_Margins(X,y,theta_Per,y2);
plot(xx,line1,'--');
plot(xx,line2,'--');
hold off;title("Perceptron for data1 with margin");
%% B
%% SVM
r1=gammaGeom(X,theta_svm);
figure(2);subplot(121);plot_points_and_boundary(X,y,theta_svm);hold on;
plot(xx,y1);plot(xx,y1+r1,'--');plot(xx,y1-r1,'--');hold off;;title("Svm for data1 with gamma geometry");
%% perceptron
r2=gammaGeom(X,theta_Per);
subplot(122);plot_points_and_boundary(X,y,theta_Per);hold on;
plot(xx,y2);plot(xx,y2+r2,'--');plot(xx,y2-r2,'--');hold off;
title("Perceptron for data1 with gamma geometry");

