//
//  AddressBook.h
//  Exercise 2
//
//  Created by lanou3g on 15/6/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
@interface AddressBook : NSObject


@property(nonatomic,retain)NSString*bookName;

@property(nonatomic,retain)NSMutableDictionary*allContactDict;


-(id)initWithBookName:(NSString*)bookName;
+(id)addressBookWithBookName:(NSString*)bookName;


#pragma mark--方法(功能)
//1,可以添加联系人对象,如果姓名或者电话号码为空,则添加失败.将联系人添加到对应的匹配的分组
-(BOOL)addContact:(Contact*)contact;



//2,获取某个分组名称下的所有联系人,而且按照姓名升序排序
-(NSArray*)getAllContactByGroupName:(NSString*)groupName;

//3,根据电话号码获取联系人
-(Contact*)getContactByPhoneNumber:(NSString*)phoneNumber;

//4,获取所有女性的联系人，并且按照年龄的降序排列
-(NSArray*)getAllContactOfWomanBySex:(NSString*)sex;

//5根据姓名删除某个联系⼈
-(BOOL)deleteContactByName:(NSString*)name;


//6,删除某个分组的全部联系人
-(void)deleteAllContactByGroupName:(NSString*)groupName;

////7,修改联系人信息
//-(BOOL)changeContactWithName:(NSString *)name phoneNum:(NSString *)aNum sex:(NSString *)aSex age:(int) aAge;

//8,显示所有联系人
-(void)showAllContacts;




@end
