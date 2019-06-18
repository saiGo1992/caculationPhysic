%Helmholtz椭圆方程
function[u,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,tol,MaxIter)
    %求解区域D=[x0,xf,y0,yf]={(x,y)|x0<=x<=xf,y0<=y<=yf}
    %边界条件
    %u(x0,y)=bx0(y), u(xf,y)=bxf(y), u(x,y0)=by0(x), u(x,yf)=byf(x)
    %Mx: x方向网格数 My:y方向网格数
    %tol 容忍误差; MaxIter:最大迭代数
    x0=D(1);
    xf=D(2);
    y0=D(3);
    yf=D(4);
    dx=(xf-x0)/Mx;x=x0+[0:Mx]*dx;%生成行坐标，xf-x0步进为dx，这里即将求解的x范围分成Mx+1个点
    dy=(yf-x0)/My;y=y0+[0:My]'*dy;%同理将求解的y范围分解为My+1个点,不同的是这个是列向量
    Mx1=Mx+1;
    My1=My+1;
    %边界条件
    for m=1:My1
        u(m,[1 Mx1])=[bx0(y(m)) bxf(y(m))]; %这里的意思是矩阵u的第m行第1列赋值为bx0(y(m)),
                                            %第m行第My1列赋值为bxf(y(m))
                                            %即意味着u的行号代表y值，列号代表x值
    end
    for n=1:Mx1
        u([1 My1],n)=[by0(x(n));byf(x(n))];%这里的意思是矩阵u的第1行第n列赋值为bx0(y(m)),
                                           %第My1行第n列赋值为bxf(y(m))
                                           %即意味着u的行号代表y值，列号代表x值
    end
    %边界平均值作为迭代初值
    % 这里的意思是将边界值除了区域四个角加起来
    sum_of_bv=sum([sum(u(2:My,[1 Mx1])) sum(u([1 My1],2:Mx)')]);%sum函数如果输入的参数只有行向量则全部元素相加，如果是矩阵默认是列相加形成行向量
    u(2:My,2:Mx)=sum_of_bv/(2*(Mx+My-2));%取边界值的平均值然后除了边界外所有点都赋这个值(为什么？)
    for i=1:My
        for j=1:Mx
            %设置g和f函数对应的矩阵
            F(i,j)=f(x(j),y(i));
            G(i,j)=g(x(j),y(i));
        end
    end
    %设置好公式中的系数
    dx2=dx*dx;
    dy2=dy*dy;
    dxy2=2*(dx2+dy2);
    rx=dx2/dxy2;
    ry=dy2/dxy2;
    rxy=rx*dy2;
    for itr=1:MaxIter
        for j=2:Mx
            for i=2:My
                u(i,j)=ry*(u(i,j+1)+u(i,j-1))+rx*(u(i+1,j)+u(i-1,j))+rxy*(G(i,j)*u(i,j)-F(i,j));
            end
        end
        if itr>1 & max(max(abs(u-u0))) < tol %相对变化小于tol迭代停止
            break;
        end
        u0=u;
    end
end