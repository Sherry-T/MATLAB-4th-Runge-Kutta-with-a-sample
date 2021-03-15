function [t,r] = RK(func,r0,h,tstart,tend)
    n=floor((tend-tstart)/h); 
    t(1)=tstart; 
    r(:,1)=r0;
    for i=1:n
        t(i+1)=t(i)+h;    
        k1=func(t(i),r(:,i));  
        k2=func(t(i)+h/2,r(:,i)+h*k1/2);    
        k3=func(t(i)+h/2,r(:,i)+h*k2/2);   
        k4=func(t(i)+h,r(:,i)+h*k3);   
        r(:,i+1)=r(:,i)+h*(k1+2*k2+2*k3+k4)/6;
    end
end