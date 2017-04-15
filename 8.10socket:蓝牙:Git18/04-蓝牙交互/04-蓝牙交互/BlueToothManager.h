//
//  BlueToothManager.h
//  04-蓝牙交互
//
//  Created by vera on 16/8/10.
//  Copyright © 2016年 deli. All rights reserved.
//

#import <Foundation/Foundation.h>

//导入头文件
#import <CoreBluetooth/CoreBluetooth.h>

/**
 *  扫描外部设备的回调
 *
 *  @param peripherals <#peripherals description#>
 */
typedef void(^BlueToothManagerDidScanSuccessCallBack)(NSArray *peripherals);

/**
 *  连接成功的回调
 *
 *  @param peripheral 当前连接的外部设备
 */
typedef void(^BlueToothManangerDidConnectionSuccessCallBack)(CBPeripheral *peripheral);

/**
 *  连接失败的回调
 *
 *  @param error 错误信息
 */
typedef void(^BlueToothManangerConnectionFailureCallBack)(NSError *error);

/**
 *  收到外设发过来的数据
 *
 *  @param data <#data description#>
 */
typedef void(^BlueToothManangerDidReceiveDataCallBack)(NSData *data);

@interface BlueToothManager : NSObject

+ (instancetype)manager;

/**
 *  扫描外部设备
 *
 *  @param callback <#callback description#>
 */
- (void)scanPeripherals:(BlueToothManagerDidScanSuccessCallBack)callback;

/**
 *  连接指定的外部设备
 *
 *  @param peripheral <#peripheral description#>
 */
- (void)connetionPeripheral:(CBPeripheral *)peripheral;

/**
 *  连接指定外部设备成功的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setBlueToothManangerDidConnectionSuccessCallBack:(BlueToothManangerDidConnectionSuccessCallBack)callback;

/**
 *  连接指定外部设备失败的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setBlueToothManangerConnectionFailureCallBack:(BlueToothManangerConnectionFailureCallBack)callback;

/**
 *  发送数据
 *
 *  @param data       <#data description#>
 *  @param uuidString <#uuidString description#>
 */
- (void)writeData:(NSData *)data uuidString:(NSString *)uuidString;

/**
 *  收到外部设备发过来的数据的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setBlueToothManangerDidReceiveDataCallBack:(BlueToothManangerDidReceiveDataCallBack)callback;

/**
 *  断开与外设的连接
 */
- (void)disconnectWithPeripheral:(CBPeripheral *)peripheral;

@end
