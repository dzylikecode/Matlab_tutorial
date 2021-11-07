

输入 A 和 b

测 A 的阶数，对 k = 1，2，... , n - 1 循环

 1. 按列主元 

 $$
\alpha = \max \limits_{k\le x\le n} \left\vert a_{i_k} \right\vert
 $$

保存主元所在行的指标 $ i_k $

2. 若 $ \alpha = 0 $ , 则系数矩阵奇异,返回出错信息，计算停止；否则，顺序进行

3. 若 $ i_k = k $ , 否则转向 4 ； 否则换行

$$
a_{i_k j} \leftrightarrow a_{k j} , j = k + 1, ... , n , b_{i_k} \leftrightarrow  b_k
$$

4. 计算乘子:

$$
m_{i k} = a_{i k} / a_{k k}
$$

5. 消元:

$$
a_{i j} = a_{i j} - m_{i k} a_{i k} , i = k + 1, ..., n, j = k + 1, ..., n
$$


回代

$$
b_i = (b_i - \sum_{j=i-1}^{n} a_{i j} b_j) / a_{i i} , i = n, n-1, ... , 1
$$

