//
//  AddressBook.m
//  Exercise 2
//
//  Created by lanou3g on 15/6/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

-(id)init
{
    return [self initWithBookName:nil];
}
-(id)initWithBookName:(NSString*)bookName
{
    self=[super init];
    if (self)
    {
        _bookName=bookName;
        NSMutableArray*keysArray=[NSMutableArray array];
        NSMutableArray*valuesArray=[NSMutableArray array];
        for (int i=65; i<91; i++)
        {
            NSString*str1=[[NSString stringWithFormat:@"%c",i]capitalizedString];
            [keysArray addObject:str1];
            [valuesArray addObject:[NSMutableArray array]];
            _allContactDict=[NSMutableDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
        }
    }
    return self;
}


+(id)addressBookWithBookName:(NSString*)bookName
{
    AddressBook*addressBook=[[AddressBook alloc]initWithBookName:bookName];
    return [addressBook autorelease];
}

#pragma mark--方法(功能)
//1,可以添加联系人对象,如果姓名或者电话号码为空,则添加失败.将联系人添加到对应的匹配的分组
//判断是否已经存在分组,存在直接存储,不存在创建分组后再存储(注意:联系人不能有重名)
-(BOOL)addContact:(Contact*)contact
{
    if ([[contact name]isEqualToString:nil]||[[contact phoneNumber]isEqualToString:nil])
    {
        
        NSLog(@"很抱歉,添加联系人失败");
        return YES;
    }
    else
    {
        NSString*str1=[[[contact name] substringToIndex:1]capitalizedString];
        [_allContactDict[str1]addObject:contact];
        NSLog(@"恭喜你,添加联系人成功");
        return YES;
    }
    return NO;
}
              

//2,获取某个分组名称下的所有联系人,而且按照姓名升序排序
-(NSArray*)getAllContactByGroupName:(NSString*)groupName
{
    NSMutableArray*array1=[NSMutableArray array];
    for (id key in _allContactDict)
    {
        for (Contact*contact in _allContactDict[key])
        {
            if ([[contact groupName]isEqualToString:groupName])
            {
                [array1 addObject:contact];
            }
        }
    }
    [array1 sortUsingSelector:@selector(compareByName:)];
    return array1;
}

//3,根据电话号码获取联系人
-(Contact*)getContactByPhoneNumber:(NSString*)phoneNumber
{
    for (id key in _allContactDict)
    {
        for (Contact*contact in _allContactDict[key])
        {
            if ([[contact phoneNumber]isEqualToString:phoneNumber])
            {
                return contact;
            }
        }
    }
    return nil;
}

//4,获取所有女性的联系人，并且按照年龄的降序排列
-(NSArray*)getAllContactOfWomanBySex:(NSString*)sex
{
    NSMutableArray*array1=[NSMutableArray array];
    for (id key in _allContactDict)
    {
        for (Contact*contact in _allContactDict[key])
        {
            if ([[contact sex]isEqualToString:sex])
            {
                [array1 addObject:contact];
            }
        }
    }
    [array1 sortUsingSelector:@selector(compareByAge:)];
    return array1;
    
}

//5根据姓名删除某个联系⼈
-(BOOL)deleteContactByName:(NSString*)name
{
    for (id key in _allContactDict)
    {
        NSMutableArray*array1=_allContactDict[key];
        for (Contact*contact in _allContactDict[key])
        {
            if ([[contact name]isEqualToString:name])
            {
                [array1 removeObject:contact];
                return YES;
            }
        }
    }
    return NO;
}


//6,删除某个分组的全部联系人
-(void)deleteAllContactByGroupName:(NSString*)groupName
{
    for (id key in _allContactDict)
    {
        NSMutableArray*array1=_allContactDict[key];
        for (int i=0; i<[array1 count]; i++)
        {
            if ([[array1[i]groupName]isEqualToString:groupName])
            {
                [array1 removeObject:array1[i]];
                i--;
            }
        }
        
    }
}


//8,显示所有联系人
-(void)showAllContacts
{
    for (id key in _allContactDict)
    {
        NSArray*valueArray=_allContactDict[key];
        if ([valueArray count]!=0)
        {
            NSLog(@"%@",key);
            for (Contact*contact in _allContactDict[key])
            {
                NSLog(@"%@",contact);
            }
        }
    }
    
}


-(void)dealloc
{
    
    NSLog(@"通讯录这个对象被销毁了");
    [super dealloc];
}
@end
