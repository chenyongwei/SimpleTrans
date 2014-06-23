//
//  SimpleTranslator.h
//  SimpleTranslation
//
//  Created by Yongwei.Chen on 6/23/14.
//  Copyright (c) 2014 KW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleTranslator : NSObject

+(instancetype)translator;
-(void)initWithCultureCode:(NSString *)cultureCode;
-(NSString *)getTrans:(NSString *)key;
-(void)transChildViews:(UIView *)view;

@end
