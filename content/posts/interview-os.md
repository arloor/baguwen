---
title: "面试：操作系统"
date: 2022-12-08T15:57:04+08:00
draft: false
categories: [ "undefined"]
tags: ["undefined"]
weight: 10
subtitle: ""
description : ""
keywords:
- 刘港欢 arloor moontell
---

[CS-Notes操作系统](http://www.cyc2018.xyz/%E8%AE%A1%E7%AE%97%E6%9C%BA%E5%9F%BA%E7%A1%80/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%E5%9F%BA%E7%A1%80/%E8%AE%A1%E7%AE%97%E6%9C%BA%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%20-%20%E7%9B%AE%E5%BD%95.html)

## 操作系统的特性

- 并发：并发是指宏观上在**一段时间内**能同时运行**多个程序**，而并行则指**同一时刻**能运行**多个指令**。
- 共享：资源是被进程共享的。分为互斥共享和同时共享，**互斥共享**的被称为**临界资源**，需要**同步机制**来保护，即信号量/管程
- 虚拟：将物理实体映射成逻辑实体。时分复用：将CPU时间虚拟化时间片，分给进程。空分复用：将物理内存虚拟成逻辑空间，段页式访问物理内存。
- 异步：进程不是一次性执行完毕，而是断断续续地向前

## 进程管理

### 进程状态的转换

![](/img/ProcessState.png)

- 就绪状态（ready）：等待被调度
- 运行状态（running）
- 阻塞状态（waiting）：等待资源

应该注意以下内容：

- 只有就绪态和运行态可以相互转换，其它的都是单向转换。就绪状态的进程通过调度算法从而获得 CPU 时间，转为运行状态；而运行状态的进程，在分配给它的 CPU 时间片用完之后就会转为就绪状态，等待下一次调度。
- 阻塞状态是**缺少需要的资源**从而由运行状态转换而来，但是该资源不包括 CPU 时间，**缺少 CPU 时间会从运行态转换为就绪态**。

### 进程调度算法

#### 批处理系统

#### 交互式系统

时间片轮转算法。基于先来先服务的思想，线程会在队列中等待，时间片先给对首的线程，用完后中断该线程并会放到队尾。

时间片轮转算法的效率和时间片的大小有很大关系：

- 因为进程切换都要保存进程的信息并且载入新进程的信息，如果时间片太小，会导致进程切换得太频繁，在进程切换上就会花过多时间。
- 而如果时间片过长，那么实时性就不能得到保证。

#### 实时系统

### 同步和互斥

[看完了进程同步与互斥机制，我终于彻底理解了 PV 操作](https://cloud.tencent.com/developer/article/1803377)

**异步**是操作系统的特性之一，操作系统是没办法保证多个任务的执行先后的。而我们的软件经常有A需要等待B完成之后再执行，这种就需要同步机制。

互斥是指同一时刻只能有一个线程使用某资源，需要互斥访问的资源叫临界资源，互斥访问的过程叫临界区。

两种原语：

- 信号量：semaphore
- 管程：java的condition，在条件上等待，条件满足时进行signal

###