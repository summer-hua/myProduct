//
//  Contact.m
//  Exercise 2
//
//  Created by lanou3g on 15/6/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Contact.h"
@class AddressBook;
@implementation Contact


-(id)initWithName:(NSString*)name PhoneNumber:(NSString*)phoneNumber Sex:(NSString*)sex GroupName:(NSString *)groupName Age:(int)age
{
    self=[super init];
    if (self)
    {
        self.name=name;
        self.phoneNumber=phoneNumber;
        self.sex=sex;
        self.groupName=groupName;
        self.age=age;
        
        
    }
    return self;
}

+(id)contactWithName:(NSString*)name PhoneNumber:(NSString*)phoneNumber Sex:(NSString*)sex GroupName:(NSString*)groupName Age:(int)age
{
    Contact*contact=[[Contact alloc]initWithName:name PhoneNumber:phoneNumber Sex:sex GroupName:groupName Age:age];
    return [contact autorelease];
}

-(NSComparisonResult)compareByAge:(Contact*)contact
{
    if (self.age>contact.age)
    {
        return -1;
    }
    else if (self.age<contact.age)
    {
        return 1;
    }
    return 0;
}

-(NSString*)description
{
    NSString*string=[NSString stringWithFormat:@"name=%@,phoneNumber=%@,sex=%@,groupName=%@,age=%d",_name,_phoneNumber,_sex,_groupName,_age];
    return string;
    
}



-(void)dealloc
{
    NSLog(@"联系人这个对象被销毁了");
    [super dealloc];
}


-(NSComparisonResult)compareByName:(Contact *)contact
{
    return [self.name compare:contact.name];
}


//7,修改联系人信息
-(BOOL)changeContactWithName:(NSString *)name phoneNum:(NSString *)aNum sex:(NSString *)aSex age:(int) aAge
{
    {
            [self setSex:aSex];
            [self setName:name];
            [self setPhoneNumber:aNum];
            [self setAge:aAge];
    
            return YES;
    }
    return NO;
}

@end
