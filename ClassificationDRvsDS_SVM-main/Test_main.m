%%%%%%%%%%%%%%%%%%%%%%%%
% THis program is to test the SVM model performance on drug-resistant and
% drug-sensitive classification based on 25 features 
% (including two clinical fetaures and 23 radiological features)
%%%%%%%%%%%%%%%%%%%%%%%%
%% svm classification
load('testData.mat');
load('testDataLabel.mat');
load('TrainData.mat');
load('TrainDataLabel.mat');
SVMModel = fitcsvm(trainDataSMOTE,trainLabelSMOTE,'Standardize',true,'ClassNames',[-1,1],'KernelFunction','RBF','KernelScale','auto');
[predictedLabels,scorePred] = predict(SVMModel,testDataSMOTE);
testlab_aug = testLabelSMOTE;
accuracy = sum(predictedLabels==testlab_aug)/numel(testlab_aug);
sensi = sum(predictedLabels==testlab_aug & testlab_aug==1)/sum(testlab_aug==1);
speci = sum(predictedLabels==testlab_aug & testlab_aug==-1)/sum(testlab_aug==-1);
preci = sum(predictedLabels==testlab_aug & testlab_aug==1)/sum(predictedLabels==1);
f_score = 2*sensi*preci/(sensi+preci);
[X,Y,T,AUC] = perfcurve(testlab_aug,scorePred(:,2),'1') ;
figure;plot(X,Y,'r','LineWidth',2);grid on;hold on;
xlabel('False positive rate');
ylabel('True positive rate');
legend({'Fold1'})
