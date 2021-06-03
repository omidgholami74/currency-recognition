function [train500,train1000,train2000,train5000,train10000,train50000] = load_train()
train500   =[dir('train/500/*.jpg');dir('train/500/*.jpeg');dir('train/500/*.png')];
train1000  =[dir('train/1000/*.jpg');dir('train/1000/*.jpeg');dir('train/1000/*.png')];
train2000  =[dir('train/2000/*.jpg');dir('train/2000/*.jpeg');dir('train/2000/*.png')];
train5000  =[dir('train/5000/*.jpg');dir('train/5000/*.jpeg');dir('train/5000/*.png')];
train10000 =[dir('train/10000/*.jpg');dir('train/10000/*.jpeg');dir('train/10000/*.png')];
train50000 =[dir('train/50000/*.jpg');dir('train/50000/*.jpeg');dir('train/50000/*.png')];
end

