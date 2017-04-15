//
//  ViewController.m
//  01-runtime用途
//
//  Created by vera on 16/8/11.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "NSString+Additional.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark --- 1.动态创建类，动态添加属性、成员变量、方法等

- (void)createClass
{
    /*
     类 --- Class
     方法名 --- SEL
     实现 --- IMP
     成员变量 --- Ivar
     方法(方法名的实现) --- Method
     */
    
    char *type = @encode(NSString *);
    printf("%s",type);
    
    //创建一个Class
    /*
     参数一：父类
     参数二：类名
     参数三：额外分配空间(一般写0)
     */
    Class class = objc_allocateClassPair([NSObject class], "Person", 0);
    
    //添加成员变量
    class_addIvar(class, "_name", sizeof(NSString *), log2(sizeof(NSString *)), "@");
    
    //class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
    
    //注册类：只有注册类后才能使用当前类
    objc_registerClassPair(class);
    
    id person = [[class alloc] init];
    [person setValue:@"xiaoming" forKey:@"_name"];
    
    //NSLog(@"%@",[person valueForKey:@"_name"]);
}

#pragma mark --- 2.实现方法实现的交换(Method Swizzling) - runtime黑魔法

- (void)exchangeImplementations
{
    //viewDidLoad方法
    Method method1 = class_getInstanceMethod([self class], @selector(viewDidLoad));
    
    //test方法
    Method method2 = class_getInstanceMethod([self class], @selector(test));
    
    //交换两个方法的实现：用在看不到别人代码的情况下
    method_exchangeImplementations(method1, method2);
    
    [self viewDidLoad];
}

- (void)test
{
    NSLog(@"test方法调用了");
}

#pragma mark --- 3.动态获取类的属性、方法、成员变量等

- (void)copyPropertiesAndIvarAndMethod
{
    //属性个数
    unsigned int outCount;
    
    //动态获取属性列表
    objc_property_t *properties = class_copyPropertyList(NSClassFromString(@"Dog"), &outCount);
    
    //获取指定类的属性
    //class_getProperty(<#__unsafe_unretained Class cls#>, <#const char *name#>)
    
    for (int i = 0; i < outCount; i++)
    {
        //属性
        objc_property_t property = properties[i];
        
        //属性的名字
        const char *name = property_getName(property);
        const char *type = property_getAttributes(property);
        
        NSLog(@"%s - %s",name,type);
    }
    
#if 0
    //动态获取类的协议
    class_copyProtocolList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
    
    //动态获取方法列表
    class_copyMethodList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
    
    //动态获取成员变量
    class_copyIvarList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
#endif
    
    //动态获取成员变量
    Ivar *ivars = class_copyIvarList(NSClassFromString(@"Dog"), &outCount);
    
    //遍历成员变量
    for (int i = 0; i < outCount; i++)
    {
        //成员变量
        Ivar ivar = ivars[i];
        
        //成员变量的名字
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSLog(@"%s - %s",name,type);
    }
    
    //动态获取方法列表
    Method *methodes = class_copyMethodList(NSClassFromString(@"Dog"), &outCount);
    
    //遍历成员方法列表
    for (int i = 0; i < outCount; i++)
    {
        //方法
        Method method = methodes[i];
        
        //方法的名字
        SEL sel = method_getName(method);
        NSString *methodName = NSStringFromSelector(sel);
        
        //获取实现
//        IMP imp = method_getImplementation(method);
        
        NSLog(@"%@",methodName);
    }
}

#pragma mark --- 4.实现自动归档和解归档

- (void)autoArchive
{
    //归档解档必须遵守NSCoding这个协议
}

#pragma mark --- 5.类别动态添加成员变量

- (void)categoryAddIvar
{
    NSString *str = @"ssss";
    
    str.name = @"小明";
    
    NSLog(@"%@",str.name);
}

#pragma mark --- 6.模型字典相互转化

- (void)dictionaryToModel
{
    NSDictionary *dic = @{@"name":@"xiaoming",@"age":@(20)};
    
    Test *test = [Test testWithDictionary:dic];
    
    NSLog(@"%@ - %ld",test.name,test.age);
    
    //把一个模型转化为字典
    //字典的键就是属性的名字，值就是根据属性[xx valueForKey:]
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     runtime用途：
     1.动态创建类，动态添加属性、成员变量、方法等
     2.实现方法实现的交换(Method Swizzling)
     3.动态获取类的属性、方法、成员变量等
     4.实现自动归档和解归档
     5.类别动态添加成员变量
     6.模型字典的相互转化（JSONModel）
     */
    
    /**
     1.动态创建类，动态添加属性、成员变量、方法等
     */
//    [self createClass];
    
    /*
     2.实现方法实现的交换(Method Swizzling) - runtime黑魔法
     */
//    [self exchangeImplementations];
    
    /*
     3.动态获取类的属性、方法、成员变量等
     */
//    [self copyPropertiesAndIvarAndMethod];
    
    /**
     4.实现自动归档和解归档
     */
//    [self autoArchive];
    
    /**
     5.类别动态添加成员变量
     */
    [self categoryAddIvar];
    
    /**
     6.模型字典相互转化
     */
    [self dictionaryToModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
