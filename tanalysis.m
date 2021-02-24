clearvars;

sub= 'sub-05DB';

filepath= fullfile( 'Data', sub, 'sub-05DB_infer_terror.mat');


data = load(filepath);

xp_cnds = [8,1,7,10,4,5,1,4,4,4,3,9,1,7,9,5,8,9,1,3,1,4,4,4,6,1,5,6,10,4,5,1,5,5,10,9,1,7,1,5,6,4,1,4,4,1,8,5,2,4,1,5,2,6,3,1,10,9,4,4,6,10,4,3,7,8,4,3,3,4,1,4,9,8,6,7,7,1,9,10,2,10,9,7,1,7,6,8,2,8,8,1,8,6,3,1,10,9,3,6,2,4,7,2,6,1,4,3,10,10,2,8,7,2,5,2,3,2,1,9];


means=[mean(terror(idx_1)) mean(terror(idx_2)) mean(terror(idx_3)) mean(terror(idx_4)) mean(terror(idx_5)) mean(terror(idx_6)) mean(terror(idx_7)) mean(terror(idx_8)) mean(terror(idx_9)) mean(terror(idx_10))];

stds=[std(terror(idx_1))/mean(terror(idx_1)) std(terror(idx_2))/mean(terror(idx_2)) std(terror(idx_3))/mean(terror(idx_3)) std(terror(idx_4))/mean(terror(idx_4)) std(terror(idx_5))/mean(terror(idx_5)) std(terror(idx_6))/mean(terror(idx_6)) std(terror(idx_7))/mean(terror(idx_7)) std(terror(idx_8))/mean(terror(idx_8)) std(terror(idx_9))/mean(terror(idx_9)) std(terror(idx_10))/mean(terror(idx_10))];
