function input_parameter=ip()
    global w; global s;
    fprintf('#小环在约束轨迹下的运动#\n');
    fprintf('[#The motion of a ring under a constrained trajectory#]\n\n');
    w=input('请输入角速度w\n[Please input the angular velocity w]\n-> ');  % 角速度
    if w>0 || w<0
    else
        w=input('您的输入可能有误！请重新输入\n[Error! Please input again]\n-> ');
    end
    s=input('请输入抛物线几何参数s\n[Please input geometric parameter of the parabola s(z=r^2/2s)]\n-> ');  % 环的几何参数（抛物线参数）
end