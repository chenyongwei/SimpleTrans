//
//  SimpleTranslator.m
//  SimpleTranslation
//
//  Created by Yongwei.Chen on 6/23/14.
//  Copyright (c) 2014 KW. All rights reserved.
//

#import "SimpleTranslator.h"

@interface SimpleTranslator()

@property (nonatomic, strong) NSMutableDictionary *transDict;

@end

@implementation SimpleTranslator


+(instancetype)translator
{
    static SimpleTranslator *translator = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        translator = [[SimpleTranslator alloc] init];
    });
    
    return translator;
}

-(void)initWithCultureCode:(NSString *)cultureCode
{
    NSString *transFileName = [NSString stringWithFormat:@"trans-%@", cultureCode];
    NSString *transFilePath =     [[NSBundle mainBundle] pathForResource:transFileName ofType:@"txt"];
    NSString *transString = [NSString stringWithContentsOfFile:transFilePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *transArray = [transString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    self.transDict = [NSMutableDictionary dictionary];
    for (NSString *trans in transArray) {
        NSArray *transKeyValue = [trans componentsSeparatedByString:@"=>"];
        NSString *transKey = transKeyValue[0];
        NSString *transValue = transKeyValue[1];
        
        [self.transDict setObject:transValue forKey:transKey];
    }
}

-(NSString *)getTrans:(NSString *)key
{
    NSString *transValue = [self.transDict objectForKey:key];
    if (!transValue) {
        transValue = key;
    }
    return transValue;
}

-(void)transChildViews:(UIView *)view
{
    if ([view.class isSubclassOfClass:[UILabel class]]) {
        UILabel *lb = (UILabel *)view;
        NSString *txt = lb.text;
        lb.text = [[SimpleTranslator translator] getTrans:txt];
    }
    else if (view.subviews.count > 0) {
        for (UIView *subview in view.subviews) {
            [self transChildViews:subview];
        }
    }
}

@end
