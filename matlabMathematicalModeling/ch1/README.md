# 基本介绍

创建等差数列

- start:step:end
- linspace(start, end, num)

等比数列

logspace(start, end, num)  //start 实际为 10^start end 为 10^end

eg: logspace(0, log10(32), 6)

`> 1 2 4 8 16 32`


创建三维数组

- 使用下标 
> eg: A(2,2,2) = 10  <br>
> B(3,4,:) = 2:5; //则 (3,4,:) 依次填满 2 3 4 5, 其他补0  <br>
> C(:,:,1) = D1 ; C(:,:,2) = D2 ;

- 通过函数

> cat(dim, A, B) //cat 是在 dim 维度的方向上进行串联数组  <br>

<details><summary>Example</summary> 

```
A = cat(4, [9 2;6 5], [7 1; 8 4]) 
A(:,:,1,1) =

     9     2
     6     5

A(:,:,1,2) =

     7     1
     8     4

# 在第4个维度方向上串联
```

</details>


> repmat(A, list) // list 描述的各个维度上重复 A 的次数，维度依次为 行 列 页  <br>
> reshape(A, list) // list 按维度顺序(看起来就是一列一列排列)分解A, 再用其去构造成新的矩阵  <br>
> - zeros
> - ones
> - eye  (identity matrix)
> - magic  //幻方矩阵 
> - randn
> - gallery

获取属性

> - size(A) // return list
> - ndims(A)
> - whos

访问

- A(:,:,1)
- A(1,2,3)
- A(27)

重塑

permute(A, order) // 将 A 元素对应的下标, 按照 order 进行置换
ipermute(A, order) // 逆置换

统计性质

> - sum     // 对第一个不为1的维度方向上进行求和
> - mean    // 同上 -> 求平均
> - sin cos // 对每个元素求
> - eig     // 求特征值,指定一个二维矩阵

<details><summary> Example </summary>


```
A = randn(2,5,2)

A(:,:,1) =

    0.5377   -2.2588    0.3188   -0.4336    3.5784
    1.8339    0.8622   -1.3077    0.3426    2.7694


A(:,:,2) =

   -1.3499    0.7254    0.7147   -0.1241    1.4090
    3.0349   -0.0631   -0.2050    1.4897    1.4172


eig(A(:,[1 2],1))

ans =

   0.6999 + 2.0288i
   0.6999 - 2.0288i

```

</details>

变量

> - 常量  <br>

<details><summary> Example </summary>

- i or j  // 虚数单位

- Inf or inf // 正无穷

- NaN    // 不定  如 0 * inf or 0 / 0 etc.

- pi

- eps   // 容差变量, 用于浮点数,比较相等 -> 类似无穷小量

- Realmin or realmin

- Realmax or realmax



</details>

> - 变量名  <br>
> C 语言风格


构造复数

```
eg: C = A + i * B // 矩阵表示

c = complex(a, b)

> b = 3 + 0i

> isreal(b)

true

> c = complex(3, 0)

> isreal(c)

false

```

符号化

- sym

> A = sym('[a, b, c; Jack, HelpMe, NOWAY]')  <br>
> B = sym('lena') 


- syms

> syms a b c Jack HelpMe NOWAY   //using space to split instead of ','  <br>
> A = [a, b, c; Jack, HelpMe, NOWAY]


- subs  

> subs(function, oldVarList, newVarList)  //替换变量

- double

> double(function)

```

>c = sym('sqrt(2)*log(7)')
>double(c)

```

> vpa

```
>c = sym('sqrt(2)*log(7)')
> vpa(c, 8)

// 等价于

> digits 8
> vpa(c)

```

- numeric

// 2016b 不存在此函数


符号表达式的处理

- factor 分解

```

> factor(252)
      2     2     3     3     7

> factor(sym('252'))
     [ 2, 2, 3, 3, 7]

> syms x
> f = x^3 + x^2 - x - 1
> factor(f)
[ x - 1, x + 1, x + 1]


```

- expand 展开

- collect 合并

```

collect(function, item) //将指定的项进行合并

collect(function) //由 findsym 确定的默认变量进行合并


```

- simplify  化简

- simple  化简

```

[res, how] = simple(function)

```

- numden  通分

```

[num, den] = numden(f)

res = num/den

```

- horner 秦九韶分解多项式

- char 转化为字符串

- pretty 习惯输出


function

exp //对每个元素求值
expm //泰勒展开,带入矩阵计算

同理 log logm

triu //抽取矩阵的上三角

[L exitflag] = logm(A) // exitflag


abs // 模长

conj // 共轭


清除

- clear 清除工作空间


复合函数

```

compose(f, g) //f(x), g(y) -> f(g(y))

compose(f, g, x, z) // f(x), g(y) -> f(g(z))

compose(f, g, t, z) //  f(t), g(y) -> f(g(z))  

compose(f, g, t, u, z) //  f(t), g(u) -> f(g(z))  选取 t u 作为自变量

```

反函数

g = finverse(function, v)  // g = Inverse(f(v))