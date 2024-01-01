% Load the second data file
data1 = load('data/data_vov_gmnidn_M7.dat');
vgs1 = data1(:, 1);
ids1 = data1(:, 2);
new_ids1=0.2;
new_vgs1=interp1(ids1, vgs1, new_ids1, 'spline');
vgs1 = [vgs1; new_vgs1];
ids1 = [ids1; new_ids1];
[ids1_sorted, idx1] = sort(ids1);
vgs1_sorted=vgs1(idx1);
ids1=ids1_sorted;
vgs1=vgs1_sorted;

% Load the first data file
data = load('data/data_idnW_gmnidn_M7.dat');
vgs = data(:, 1);
ids = data(:, 2);
new_vgs=new_vgs1;
new_ids=interp1(vgs, ids, new_vgs, 'spline');
vgs = [vgs; new_vgs];
ids = [ids; new_ids];
[vgs_sorted, idx] = sort(vgs);
ids_sorted=ids(idx);
ids=ids_sorted;
vgs=vgs_sorted;

% Create a figure with subplots
figure;
subplot(2, 1, 1);
plot(vgs, ids, 'b', 'LineWidth', 2);
grid on;
title('$i_{dn}/W$ v/s $g_{mn}/i_{dn}$', 'Interpreter', 'latex');
xlabel('$g_{mn}/i_{dn} \ (V^{-1})$', 'Interpreter', 'latex');
ylabel('$i_{dn}/W \ (A/m)$', 'Interpreter', 'latex');
legend('M7 $g_{mn}/i_{dn}$', 'Interpreter', 'latex');

subplot(2, 1, 2);
plot(vgs1, ids1, 'r', 'LineWidth', 2);
grid on;
title('$V_{OV}$ v/s $g_{mn} / i_{dn}$', 'Interpreter', 'latex');
xlabel('$g_{mn} / i_{dn} \ (V^{-1})$', 'Interpreter', 'latex');
ylabel('$V_{OV} \ (V)$', 'Interpreter', 'latex');
legend('M7 $V_{OV}$', 'Interpreter', 'latex');



% Load the second data file
data3 = load('data/data_vov_gmnidn_M34.dat');
vgs3 = data3(:, 1);
ids3 = data3(:, 2);
% new_ids3=0.200;
% new_vgs3=interp1(ids3, vgs3, new_ids3, 'spline');
% vgs3 = [vgs3; new_vgs3];
% ids3 = [ids3; new_ids3];
% [ids3_sorted, idx3] = sort(ids3);
% vgs3_sorted=vgs3(idx3);
% ids3=ids3_sorted;
% vgs3=vgs3_sorted;

% Load the first data file
data2 = load('data/data_idnW_gmnidn_M34.dat');
vgs2 = data2(:, 1);
ids2 = data2(:, 2);
% new_vgs2=new_vgs3;
% new_ids2=interp1(vgs2, ids2, new_vgs2, 'spline');
% vgs2 = [vgs2; new_vgs2];
% ids2 = [ids2; new_ids2];
% [vgs2_sorted, idx2] = sort(vgs2);
% ids2_sorted=ids2(idx2);
% ids2=ids2_sorted;
% vgs2=vgs2_sorted;


% Create a figure with subplots
figure;
subplot(2, 1, 1);
plot(vgs2, ids2, 'b', 'LineWidth', 2);
grid on;
title('$i_{dn}/W$ v/s $g_{mn}/i_{dn}$', 'Interpreter', 'latex');
xlabel('$g_{mn}/i_{dn} \ (V^{-1})$', 'Interpreter', 'latex');
ylabel('$i_{dn}/W \ (A/m)$', 'Interpreter', 'latex');
legend('M3/M4 $g_{mn}/i_{dn}$', 'Interpreter', 'latex');

subplot(2, 1, 2);
plot(vgs3, ids3, 'r', 'LineWidth', 2);
grid on;
title('$V_{OV}$ v/s $g_{mn} / i_{dn}$', 'Interpreter', 'latex');
xlabel('$g_{mn} / i_{dn} \ (V^{-1})$', 'Interpreter', 'latex');
ylabel('$V_{OV} \ (V)$', 'Interpreter', 'latex');
legend('M3/M4 $V_{OV}$', 'Interpreter', 'latex');



% Load the second data file
data5 = load('data/data_vov_gmnidn_M1.dat');
vgs5 = data5(:, 1);
ids5 = data5(:, 2);
new_vgs5=10;
new_ids5=interp1(vgs5, ids5, new_vgs5, 'spline');
vgs5 = [vgs5; new_vgs5];
ids5 = [ids5; new_ids5];
[vgs5_sorted, idx5] = sort(vgs5);
ids5_sorted=ids5(idx5);
ids5=ids5_sorted;
vgs5=vgs5_sorted;

% Load the first data file
data4 = load('data/data_idnW_gmnidn_M1.dat');
vgs4 = data4(:, 1);
ids4 = data4(:, 2);
new_vgs4=new_vgs5;
new_ids4=interp1(vgs4, ids4, new_vgs4, 'spline');
vgs4 = [vgs4; new_vgs4];
ids4 = [ids4; new_ids4];
[vgs4_sorted, idx4] = sort(vgs4);
ids4_sorted=ids4(idx4);
ids4=ids4_sorted;
vgs4=vgs4_sorted;


% Create a figure with subplots
figure;
subplot(2, 1, 1);
plot(vgs4, ids4, 'b', 'LineWidth', 2);
grid on;
title('$i_{dn}/W$ v/s $g_{mn}/i_{dn}$', 'Interpreter', 'latex');
xlabel('$g_{mn}/i_{dn} \ (V^{-1})$', 'Interpreter', 'latex');
ylabel('$i_{dn}/W \ (A/m)$', 'Interpreter', 'latex');
legend('M1/M2 $g_{mn}/i_{dn}$', 'Interpreter', 'latex');

subplot(2, 1, 2);
plot(vgs5, ids5, 'r', 'LineWidth', 2);
grid on;
title('$V_{OV}$ v/s $g_{mn} / i_{dn}$', 'Interpreter', 'latex');
xlabel('$g_{mn} / i_{dn} \ (V^{-1})$', 'Interpreter', 'latex');
ylabel('$V_{OV} \ (V)$', 'Interpreter', 'latex');
legend('M1/M2 $V_{OV}$', 'Interpreter', 'latex');

ibias=1.5e-6; %desired value for bias current source
idnwm7=ids(find(round(vgs,3)==10));
wm7=ibias/idnwm7;
lm7=1e-6;
im8=1e-6; %current in M8 
lm8=ibias*lm7/im8;
fprintf('The parameters for M7 are W=%e and L=%e\n',wm7,lm7)
fprintf('The parameters for M8 are W=%e and L=%e\n',wm7,lm8) 
%for convenience designing the current mirror, wm8=wm7
%also, for the transistor to handle the current as it should, 
%making it bigger works best, so we are multiplying both dimensions by 4

idnwm34=ids2(find(round(vgs2,2)==10.17));
im34=ibias/2;
wm34_first=im34/idnwm34;
lm34_first=8e-7;
wm34=5e-6;
lm34=(wm34*lm34_first)/wm34_first;


fprintf('The parameters for M3 and M4 are W=%e and L=%e\n',wm34,lm34)

idnwm12=ids4(find(round(vgs4,4)==13.0012));
%the highest gm/id possible without resulting in a really wide transistor
im12=ibias/2;
wm12_first=im12/idnwm12;
lm12_first=3e-7;
% wm12=5e-6;
% lm12=(wm12*lm12_first)/wm12_first;
% 

fprintf('The parameters for M1 and M2 are W=%e and L=%e\n',wm12_first,lm12_first)
