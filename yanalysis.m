clearvars;

sub= 'sub-02PC';

filepath= fullfile( 'Data', sub, 'sub-02PC_infer_yerror.mat');


yerror = load(filepath);
yerror=yerror.yerror;

xp_cnds = [8,1,7,10,4,5,1,4,4,4,3,9,1,7,9,5,8,9,1,3,1,4,4,4,6,1,5,6,10,4,5,1,5,5,10,9,1,7,1,5,6,4,1,4,4,1,8,5,2,4,1,5,2,6,3,1,10,9,4,4,6,10,4,3,7,8,4,3,3,4,1,4,9,8,6,7,7,1,9,10,2,10,9,7,1,7,6,8,2,8,8,1,8,6,3,1,10,9,3,6,2,4,7,2,6,1,4,3,10,10,2,8,7,2,5,2,3,2,1,9];

idx_1=xp_cnds==1;
idx_2=xp_cnds==2;
idx_3=xp_cnds==3;
idx_4=xp_cnds==4;
idx_5=xp_cnds==5;
idx_6=xp_cnds==6;
idx_7=xp_cnds==7;
idx_8=xp_cnds==8;
idx_9=xp_cnds==9;
idx_10=xp_cnds==10;

means=[mean(yerror(idx_1)) mean(yerror(idx_2)) mean(yerror(idx_3)) mean(yerror(idx_4)) mean(yerror(idx_5)) mean(yerror(idx_6)) mean(yerror(idx_7)) mean(yerror(idx_8)) mean(yerror(idx_9)) mean(yerror(idx_10))];

stds=[std(yerror(idx_1))/mean(yerror(idx_1)) std(yerror(idx_2))/mean(yerror(idx_2)) std(yerror(idx_3))/mean(yerror(idx_3)) std(yerror(idx_4))/mean(yerror(idx_4)) std(yerror(idx_5))/mean(yerror(idx_5)) std(yerror(idx_6))/mean(yerror(idx_6)) std(yerror(idx_7))/mean(yerror(idx_7)) std(yerror(idx_8))/mean(yerror(idx_8)) std(yerror(idx_9))/mean(yerror(idx_9)) std(yerror(idx_10))/mean(yerror(idx_10))];
