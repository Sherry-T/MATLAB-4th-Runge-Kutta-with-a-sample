%% The motion of a small ring under a constrained trajectory %%
%% 
% ver 1.1.3

%% Basic parameter modification %%
clc;  clear;
close all;
ip();
global w; global s; global gr;
gr=9.8;  % Acceleration of gravity
start_time=0;  
%%%%%%%%
end_time=40;  % Calculating time
%%%%%%%%
step=0.01;  % RK4 step

%% Matlab ode45 (for comparison) %%
t=[start_time,end_time];
[t,r] = ode45(@fun,t,[0;1]);
% x(:)=r(:,1).*cos(w*t);
% y(:)=r(:,1).*sin(w*t);
% z(:)=r(:,1).^2;
% plot3(x(:),y(:),z(:),'LineWidth',1.1);
% title('ode45 solution');
% xlabel('x'); ylabel('y'); zlabel('z');
% grid on

%% RK4 %%
[t1,r1]=RK(@fun,[0;1],step,start_time,end_time);
figure;
% GifImCount=0;
x1(:)=r1(1,:).*cos(w*t1);
y1(:)=r1(1,:).*sin(w*t1);
z1(:)=r1(1,:).^2;
% location=[x1' y1' z1'];
plot3(x1(:),y1(:),z1(:),'r','LineWidth',1.1,'Color',[0.2 0.8 0.8]);
title(['RK Solution'],['\omega = ',num2str(w),', s = ',num2str(s)]);
xlabel('x'); ylabel('y'); zlabel('z');
grid on
hold on
% filename = 'out.gif';
for i=1:size(x1)
    comet3(x1,y1,z1);
    hold on
%     interval=0.1; 
%     pause(interval)
%     frame = getframe(gcf);
%     im = frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
%     if GifImCount == 1
%         imwrite(imind,cm,filename,'gif','DelayTime',interval, 'Loopcount',inf);
%     else
%         imwrite(imind,cm,filename,'gif','DelayTime',interval, 'WriteMode','append');
%     end
%     GifImCount = GifImCount + 1; 
end

%% r-t/r'-t image %%
figure;
set(gcf,'position',[360 100 700 380])
grid on

subplot(1,2,1)
plot(t(:),r(:,1),t1(:),r1(1,:),'LineWidth',1.1);
title(["r-t"],['\omega = ',num2str(w),', s = ',num2str(s)]);
title('r-t'); xlabel('t'); ylabel('r');
legend('ode45','RK4');
set(gca,'position',[0.07 0.21 0.4 0.6])

subplot(1,2,2)
plot(t(:),r(:,2),t1(:),r1(2,:),'LineWidth',1.1);
title(["r'-t"],['\omega = ',num2str(w),', s = ',num2str(s)]);
title("r'-t"); xlabel('t'); ylabel("r'");
legend('ode45','RK4');
set(gca,'position',[0.57 0.21 0.4 0.6])
