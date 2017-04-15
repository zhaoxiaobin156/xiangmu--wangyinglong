/*
 @author: ideawu
 @link: https://github.com/ideawu/Objective-C-RSA
*/

#import <Foundation/Foundation.h>

@interface RSA : NSObject

/*
 publicKey写法：
 -----BEGIN PUBLIC KEY-----
 
 -----END PUBLIC KEY----- */

/**
*  加密
*
*  @param str    要字符串
*  @param pubKey 公钥
*
*  @return <#return value description#>
*/
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
/**
 *  加密
 *
 *  @param data   要加密的NSData
 *  @param pubKey 公钥
 *
 *  @return <#return value description#>
 */
+ (NSString *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

@end
