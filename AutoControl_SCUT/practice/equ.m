%%
syms x
eq1 = x^2+100*x+99 == 0;
result = solve(eq1 , x);
result
%%
syms x y
eq1 = x^2+y^2 == 10;
eq2 = 2*x+3*y == 0;
[x,y]=solve(eq1, eq2 ,x, y);
x
y
