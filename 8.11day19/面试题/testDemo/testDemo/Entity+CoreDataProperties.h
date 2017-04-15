//
//  Entity+CoreDataProperties.h
//  testDemo
//
//  Created by vera on 16/8/12.
//  Copyright © 2016年 deli. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Entity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Entity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
