y1_mat=cell2mat(y1);
y2_mat=cell2mat(y2);
y12_mat = [y1_mat, y2_mat];

yc_mat = cell2mat(yc);

% Threshold the NN y output
threshold = 0.5;
y_thresh = y12_mat;
y_thresh(y12_mat < threshold) = 0;
y_thresh(y12_mat > threshold) = 1;



% save thresholded output
ys = delayed_all3_short(1:end-2,1); % actual signal of the rupture - not predicted
save('script\y.txt', 'ys', '-ASCII')
ys=y_thresh'; % thresholded prediction
save('script\y_pred.txt', 'ys', '-ASCII')