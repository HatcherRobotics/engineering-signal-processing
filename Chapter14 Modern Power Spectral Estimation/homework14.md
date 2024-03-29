> 范峻铭 22121286

### 14.11

波形如下图所示：

<img src="/run/user/1000/doc/5331dfca/14_11_1.png" alt="14_11_1" style="zoom: 33%;" />

该试验信号的真实功率谱如下图所示：

<img src="/run/user/1000/doc/52c4a6df/14_11_2.png" alt="14_11_2" style="zoom:33%;" />

可以看出该信号确实有三个频率成分，分别为0.1Hz，0.25Hz，0.26Hz，与设计预期相同。

### 14.12

按要求阶次分别为8，11，14，得到功率谱如下图所示：

<img src="/run/user/1000/doc/f66c6915/14_12_1.png" alt="14_12_1" style="zoom:50%;" />

可以看出pburg算法效果明显较好，谱峰尖锐，曲线光滑，分辨率高，三个主要频率成分成功显示出。

### 14.13

周期图法得到的功率谱如下图所示：

<img src="/run/user/1000/doc/a38a5d62/14_13_1.png" style="zoom:33%;" />

其最高谱峰的频率成分为0.0857，取倒数后为11.67，说明其周期约为11～12年。

Burg法求得的功率谱如下图所示：

<img src="/run/user/1000/doc/7ea9810e/14_13_2.png" alt="14_13_2" style="zoom:33%;" />

可以看到随着阶次的增加，频率成分就越被清晰地分开，但随之而来的是带来一些伪峰，影响频率的分辨。