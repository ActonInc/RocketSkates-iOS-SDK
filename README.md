![Skates](http://static.wixstatic.com/media/04a4fc_bbd24139a63647388379754366962dec.jpg_srz_p_980_460_75_22_0.50_1.20_0.00_jpg_srz)


# ACTON RocketSkates SDK - iOS Developer Guide

ACTON RocketSkates™, the world’s first smart electric skates, are designed to be lightweight, hands-free and tons of fun. RocketSkates are also packed with smart technology and they can connect with apps on users’ smartphones via Bluetooth.

This document introduces how to integrate ACTON RocketSkates SDK into your iOS app project.

本文档中文版: https://github.com/ActonInc/RocketSkates-iOS-SDK/tree/cn

## Requirements

ACTON RocketSkates uses Bluetooth Low Energy to communicate with smart phones. In order to utilize this SDK, your iOS project's target API level must be equal to or higher than iOS 6.0.

Also, please make sure your device have Bluetooth 4.0.

## SDK Installation

1. Download the latest version of ACTON RocketSkates SDK from our [release page](https://github.com/ActonInc/RocketSkates-iOS-SDK/releases), or clone this project.

2. Copy `RocketSkates-iOS-SDK` under your project.

3. Add `CoreBluetooth.framework` into your project.

4. Then add `#include RocketSkates_iOS_SDK.h` wherever you want to use this SDK.

## Sample

We created a sample project for you to start with:

1. Scan for RocketSkates and connect to them.

 ![sample1](https://github.com/ActonInc/RocketSkates-iOS-SDK/raw/master/img/scan.jpg)

2. Retrieve RocketSkates' real-time status, and change their mode.
 
 ![sample2](https://github.com/ActonInc/RocketSkates-iOS-SDK/raw/master/img/info.jpg)

3. Remote-control your RocketSkates.

 ![sample3](https://github.com/ActonInc/RocketSkates-iOS-SDK/raw/master/img/remotecontrol.jpg)

You can download and run this demo project directly, and simply copy some of its code into your project.

## FAQ