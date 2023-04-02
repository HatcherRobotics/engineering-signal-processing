> 22121286范峻铭
>
> https://github.com/HatcherRobotics/engineering-signal-processing

#### 7.1     7.3

使用remez函数设计FIR滤波器

<img src="/run/user/1000/doc/72c79dac/7_1_1.png" style="zoom:25%;" />

<img src="/run/user/1000/doc/1c1cdfe5/7_1_2.png" style="zoom:25%;" />

<img src="/run/user/1000/doc/8517bac8/7_1_3.png" style="zoom:25%;" />

滤波器以及其幅频响应和相频响应如上图所示，其相频响应在通带内满足严格的线性相位。

#### 7.2    7.3

<img src="/run/user/1000/doc/abf2fa95/7_2_1.png" style="zoom:25%;" />

<img src="/run/user/1000/doc/4434b917/7_2_2.png" style="zoom:25%;" />

<img src="/run/user/1000/doc/92cfe6c6/7_2_3.png" style="zoom:25%;" />

滤波器以及其幅频响应和相频响应如上图所示，其相频响应在通带内满足严格的线性相位。

#### 7.5

当权重都为1时

<img src="/run/user/1000/doc/6cb01d8f/7_5_1.png" style="zoom:25%;" />

当权重为[1 10 1 10 1]时，即通带权重较大时

<img src="/run/user/1000/doc/d6733803/7_5_2.png" style="zoom:25%;" />

当权重为[10 1 10 1 10]时，即阻带权重较大时

<img src="/run/user/1000/doc/80faf60f/7_5_3.png" style="zoom:25%;" />

阻带权重大时，其衰减速度更快；通带权重大时，其通带更为平稳。

#### 7.6

矩形窗、哈明窗、汉宁窗以及其频谱图如图所示：

<img src="/run/user/1000/doc/e0e87786/7_6.png" style="zoom: 50%;" />

矩形窗相当于不加窗，其主瓣最窄，旁瓣最高；汉宁窗和哈明窗在不过多增加主瓣宽度的情况下降低旁瓣高度，从时域上看它们的原则为信号两端不发生突变。

#### 7.7

Papoulis窗及其归一化频谱图如下图所示：

<img src="/run/user/1000/doc/3ad65a54/7_7.png" style="zoom: 50%;" />

A：-47.0436

B：0.039