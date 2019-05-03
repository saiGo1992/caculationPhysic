function df = multipoint(func,x0,h,type)
y0 = subs(sym(func), findsym(sym(func)),x0);
y1 = subs(sym(func), findsym(sym(func)),x0+h);
y2 = subs(sym(func), findsym(sym(func)),x0+2*h);
y_1 = subs(sym(func), findsym(sym(func)),x0-h);
y_2 = subs(sym(func), findsym(sym(func)),x0-2*h);
switch type
    case 1,
        df = (y1-y0)/h;
    case 2,
        df = (y0-y_1)/h;
    case 3,
        df = (y1-y_1)/(2*h);
    case 4,
        df = (-3*y0+4*y1-y2)/(2*h);
    case 5,
        df = (3*y0-4*y_1+y_2)/(2*h);
end
