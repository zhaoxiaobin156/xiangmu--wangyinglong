//
//  BlueToothManager.m
//  04-蓝牙交互
//
//  Created by vera on 16/8/10.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "BlueToothManager.h"

#define kSeriveUUID @"00000aF0-0000-1000-8000-00805f9b34fb"

@interface BlueToothManager ()<CBCentralManagerDelegate, CBPeripheralDelegate>
{
    BlueToothManagerDidScanSuccessCallBack _blueToothManagerDidScanSuccessCallBack;
    
    BlueToothManangerDidConnectionSuccessCallBack _blueToothManangerDidConnectionSuccessCallBack;
    BlueToothManangerConnectionFailureCallBack _blueToothManangerConnectionFailureCallBack;
    
    BlueToothManangerDidReceiveDataCallBack _blueToothManangerDidReceiveDataCallBack;
}

/**
 *  中心角色
 */
@property (nonatomic, strong) CBCentralManager *centralMananger;

/**
 *  外部设备
 */
@property (nonatomic, strong) CBPeripheral *peripheral;

/**
 *  保存扫描到的外部设备
 */
@property (nonatomic, strong) NSMutableArray *peripheralArray;

/**
 *  保存扫描到的特征
 */
@property (nonatomic, strong) NSMutableArray *characteristicArray;

@end

@implementation BlueToothManager

+ (instancetype)manager
{
    static BlueToothManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (NSMutableArray *)peripheralArray
{
    if (!_peripheralArray)
    {
        _peripheralArray = [NSMutableArray array];
    }
    
    return _peripheralArray;
}

- (NSMutableArray *)characteristicArray
{
    if (!_characteristicArray)
    {
        _characteristicArray = [NSMutableArray array];
    }
    
    return _characteristicArray;
}

#pragma mark --- 扫描外部设备

- (void)scanPeripherals:(BlueToothManagerDidScanSuccessCallBack)callback
{
    _blueToothManagerDidScanSuccessCallBack = callback;
    
    //创建中心角色：会自动触发CBCentralManagerDelegate代理方法
    _centralMananger = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
}

#pragma mark --- CBCentralManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    //当前手机的状态
    CBCentralManagerState state = central.state;
    
    if (state == CBCentralManagerStateUnsupported)
    {
        NSLog(@"当前手机不支持蓝牙");
        
        return;
    }
    else if (state == CBCentralManagerStatePoweredOff)
    {
        NSLog(@"当前手机蓝牙没有打开");
        
        return;
    }
    else if (state == CBCentralManagerStatePoweredOn)
    {
        //如果当前手机已经打开蓝牙，开始扫描外部设备
        //参数一：扫描指定的外部设备的UUID，如果传nil表示扫描外部所有的设备
        [_centralMananger scanForPeripheralsWithServices:@[kSeriveUUID] options:nil];
    }
}

#pragma mark --- 已经发现了外部设备会触发
 
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    //RSSI：信号强度(值越大，信号强度越强)

    if (![self.peripheralArray containsObject:peripheral])
    {
        //外部设置的名字
//        peripheral.name;
        
        //把外部设备对象添加到数组
        [self.peripheralArray addObject:peripheral];
        
        if (_blueToothManagerDidScanSuccessCallBack)
        {
            //扫描结果回调
            _blueToothManagerDidScanSuccessCallBack(self.peripheralArray);
        }
    }
}

#pragma mark --- 连接指定的外部设备

- (void)connetionPeripheral:(CBPeripheral *)peripheral
{
    /**
     *  连接指定的外部设备
     */
    [self.centralMananger connectPeripheral:peripheral options:nil];
}

#pragma mark --- 连接指定的外部设备成功会触发

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    //1.连接成功的回调
    if (_blueToothManangerDidConnectionSuccessCallBack)
    {
        _blueToothManangerDidConnectionSuccessCallBack(peripheral);
    }
    
    //2.记录当前的外部设备
    self.peripheral = peripheral;
    
    //3.设置外部设备代理
    self.peripheral.delegate = self;
    
    //4.扫描外部设备的服务(参数传nil表示扫描当前外部设备中所有的服务)
    [self.peripheral discoverServices:nil];
}

#pragma mark --- 连接指定的外部设备失败会触发

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error
{
    //连接失败的回调
    if (_blueToothManangerConnectionFailureCallBack)
    {
        _blueToothManangerConnectionFailureCallBack(error);
    }
}

#pragma mark --- CBPeripheralDelegate

/**
 *  已经扫描到外部设备中的服务
 *
 *  @param peripheral <#peripheral description#>
 *  @param error      <#error description#>
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error
{
    //1.获取当前外设的服务
    NSArray<CBService *> *services = peripheral.services;
    
    //2.遍历每个服务，然后扫描服务中的特征
    for (CBService *service in services)
    {
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

/**
 *  已经扫描到指定服务的特征
 *
 *  @param peripheral <#peripheral description#>
 *  @param service    <#service description#>
 *  @param error      <#error description#>
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(nullable NSError *)error
{
    //1.获取特征
    NSArray *characterArr = service.characteristics;
    
    //2.遍历添加到数组中
    for (CBCharacteristic *c in characterArr)
    {
        if (![self.characteristicArray containsObject:c])
        {
            [self.characteristicArray addObject:c];
        }
    }
}

#pragma mark --- 发送数据

- (void)writeData:(NSData *)data uuidString:(NSString *)uuidString
{
    CBCharacteristic *c = [self characteristicWithUUIDString:uuidString];
    
    if (!c)
    {
        return;
    }
    
    /*
     参数一：发送到外部设备的数据
     参数二：特征
     参数三：是否需要response
     */
    [self.peripheral writeValue:data forCharacteristic:c type:CBCharacteristicWriteWithResponse];
}

/**
 *  查找指定UUID的特征
 *
 *  @param uuidString <#uuidString description#>
 *
 *  @return <#return value description#>
 */
- (CBCharacteristic *)characteristicWithUUIDString:(NSString *)uuidString
{
    for (CBCharacteristic *c in self.characteristicArray)
    {
        if ([c.UUID.UUIDString isEqualToString:uuidString])
        {
            return c;
        }
    }
    
    return nil;
}

#pragma mark --- 发送数据到外部设备成功的回调

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    NSLog(@"数据发送成功");
}

#pragma mark --- 收到外部设备发来的消息会触发

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    //回调
    if (_blueToothManangerDidReceiveDataCallBack)
    {
        _blueToothManangerDidReceiveDataCallBack(characteristic.value);
    }
}

#pragma mark --- 断开与外设的连接

- (void)disconnectWithPeripheral:(CBPeripheral *)peripheral
{
    [self.centralMananger cancelPeripheralConnection:peripheral];
}

#pragma mark --- setter方法

/**
 *  设置连接指定外部设备成功的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setBlueToothManangerDidConnectionSuccessCallBack:(BlueToothManangerDidConnectionSuccessCallBack)callback
{
    _blueToothManangerDidConnectionSuccessCallBack = callback;
}

/**
 *  设置连接外部设备失败的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setBlueToothManangerConnectionFailureCallBack:(BlueToothManangerConnectionFailureCallBack)callback
{
    _blueToothManangerConnectionFailureCallBack = callback;
}

/**
 *  设置收到外部设备发过来的数据的回调
 *
 *  @param callback <#callback description#>
 */
- (void)setBlueToothManangerDidReceiveDataCallBack:(BlueToothManangerDidReceiveDataCallBack)callback
{
    _blueToothManangerDidReceiveDataCallBack = callback;
}

@end
