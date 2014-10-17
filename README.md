![Skates](http://static.wixstatic.com/media/04a4fc_bbd24139a63647388379754366962dec.jpg_srz_p_980_460_75_22_0.50_1.20_0.00_jpg_srz)


# ACTON 风火轮 iOS SDK 开发指南

ACTON 风火轮是由 ACTON 公司自主设计研发的全球第一款智能可穿戴电动鞋。风火轮使用时无需特殊鞋子，无需任何遥控设备。内置高效锂电、电机及智能控制系统，用户前倾加速，后倾减速及制动，并有多种滑行模式可选。

通过移动端 app 相连，用户可实时查看风火轮状态，跟踪滑行路径，更有基于地理位置的现实互动游戏。

本文档介绍了如何在您的 iOS app 中使用 ACTON 风火轮 SDK。

## 系统需求

ACTON 风火轮通过低功耗蓝牙 (Bluetooth Low Energy) 与智能设备通讯。本 SDK 仅支持 iOS6.0 或更高版本。

使用本 SDK 时，需要有蓝牙4.0的apple设备

## SDK 安装和使用

1. 从 [发布页面](https://github.com/ActonInc/RocketSkates-iOS-SDK/releases) 下载最新版 SDK，或者克隆此 repo。

2. 将 `RocketSkates-iOS-SDK` 放进 iOS 项目里。

3. 在工程中添加`CoreBluetooth.framework`。

4. 在需要的文件里 `#include RocketSkates_iOS_SDK.h`.

完成以上步骤后，您就可以使用 ACTON 风火轮 SDK 提供的接口了。

## 示例

1. 搜索并连接附近的 ACTON 风火轮。

 ![sample1](https://github.com/ActonInc/RocketSkates-iOS-SDK/raw/master/img/scan.jpg)

2. 获取风火轮的实时状态，切换运行模式。
 
 ![sample2](https://github.com/ActonInc/RocketSkates-iOS-SDK/raw/master/img/info.jpg)

3. 使用手机遥控风火轮

 ![sample3](https://github.com/ActonInc/RocketSkates-iOS-SDK/raw/master/img/remotecontrol.jpg)

 可以直接下载运行这个示例工程，并且可以复制里面的代码到你的工程如果有需要的话。

## FAQ