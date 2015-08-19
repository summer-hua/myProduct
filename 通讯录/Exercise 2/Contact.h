//
//  Contact.h
//  Exercise 2
//
//  Created by lanou3g on 15/6/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject



@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString*phoneNumber;

@property(nonatomic,retain)NSString*sex;
@property(nonatomic,retain)NSString*groupName;
@property(nonatomic,assign)int age;


-(id)initWithName:(NSString*)name PhoneNumber:(NSString*)phoneNumber Sex:(NSString*)sex GroupName:(NSString*)groupName Age:(int)age;

+(id)contactWithName:(NSString*)name PhoneNumber:(NSString*)phoneNumber Sex:(NSString*)sex GroupName:(NSString*)groupName Age:(int)age;



-(NSComparisonResult)compareByAge:(Contact*)contact;


-(NSComparisonResult)compareByName:(Contact *)contact;


//7,修改联系人信息
-(BOOL)changeContactWithName:(NSString *)name phoneNum:(NSString *)aNum sex:(NSString *)aSex age:(int) aAge;





@end
