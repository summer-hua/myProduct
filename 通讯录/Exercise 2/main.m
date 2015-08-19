//
//  main.m
//  Exercise 2
//
//  Created by lanou3g on 15/6/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "AddressBook.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        AddressBook*bookName=[AddressBook addressBookWithBookName:@"通讯录"];
        Contact*contact1=[Contact contactWithName:@"chen" PhoneNumber:@"13322229999" Sex:@"m" GroupName:@"student" Age:24];
       Contact*contact2=[Contact contactWithName:@"cuyabign"
                                     PhoneNumber:@"17788889999" Sex:@"n" GroupName:@"student" Age:25];
        
        Contact*contact3=[Contact contactWithName:@"linjujie" PhoneNumber:@"19988883333" Sex:@"m" GroupName:@"star" Age:32];
        Contact*contact4=[Contact contactWithName:@"zhoujielun" PhoneNumber:@"14455556666" Sex:@"n" GroupName:@"teacher" Age:37];
        Contact*contact5=[Contact contactWithName:@"wanger" PhoneNumber:@"18877776666" Sex:@"n" GroupName:@"colleagues"  Age:25];

        [bookName addContact:contact1];
        [bookName addContact:contact2];
        [bookName addContact:contact3];
        [bookName addContact:contact4];
        [bookName addContact:contact5];
        

        
       //7,显示所有联系人
        [bookName showAllContacts];
        
       //1,可以添加联系人对象,如果姓名或者电话号码为空,则添加失败.将联系人添加到对应的匹配的分组
        
//        //2,获取某个分组名称下的所有联系人,而且按照姓名升序排序
//        NSLog(@"%@",[bookName getAllContactByGroupName:@"student"]);
//
//        //3,根据电话号码获取联系人
//        NSLog(@"%@",[bookName getContactByPhoneNumber:@"17788889999"]);
//
//        //4,获取所有女性的联系人，并且按照年龄的降序排列
//        NSLog(@"%@",[bookName getAllContactOfWomanBySex:@"n"]);
//
//        //5根据姓名删除某个联系⼈
//        NSLog(@"%d",[bookName deleteContactByName:@"linjujie"]);
//
//        //6,删除某个分组的全部联系人
//        [bookName deleteAllContactByGroupName:@"student"];
        
        //7,修改联系人信息
        Contact*contact7=[[bookName .allContactDict objectForKey:@"W"]objectAtIndex:0];
      BOOL result=  [contact7  changeContactWithName:@"abd"phoneNum:@"17799993333" sex:@"m" age:34];
        NSLog(@"%d",result);
        
        //8,显示所有联系人
        [bookName showAllContacts];
        NSLog(@"%lu",[bookName retainCount]);//1
        NSLog(@"%lu",[contact1 retainCount]);//2
        NSLog(@"%lu",[contact2 retainCount]);//3
        NSLog(@"%lu",[contact3 retainCount]);//2
        NSLog(@"%lu",[contact4 retainCount]);//3
        NSLog(@"%lu",[contact5 retainCount]);//3
//        [bookName release];
    }
    return 0;
}
