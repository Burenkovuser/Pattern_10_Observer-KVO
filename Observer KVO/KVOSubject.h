//
//  KVOSubject.h
//  Observer KVO
//
//  Created by Vasilii on 15.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVOSubject : NSObject

@property (nonatomic, strong) NSString *changeableProperty;

@end
