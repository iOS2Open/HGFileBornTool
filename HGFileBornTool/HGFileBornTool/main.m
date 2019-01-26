//
//  main.m
//  HGFileBornTool
//
//  Created  by hong.zhu on 2019/1/25.
//  Copyright © 2019年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

// 创建 Python 文件
void bornPython(int argc, const char * argv[]) {
    // 包名(就是一个目录)
    NSString *package = [[NSString alloc] initWithUTF8String:argv[1]];
    // 包中的文件
    NSString* fullPath = [NSString stringWithFormat:@"%@/__init__.py", package];
    
    // 这个条件语句就有点饶了
    // 如果 argc == 2 , 就单纯的创建一个 Python 文件
    // 如果 argc  > 2 , 就属于创建一个包文件
    if (argc == 2) {
        fullPath = [NSString stringWithFormat:@"%@.py", package];
        package = nil;
    }
    
    if (package) {
        // 创建包
        [[NSFileManager defaultManager] createDirectoryAtPath:package withIntermediateDirectories:YES attributes:NULL error:NULL];
    }
    
    // 创建具体的文件
    NSError * err = nil;
    NSString *content = @"#!/usr/bin/env python3\n# -*- coding: utf-8 -*-\n";
    [content writeToFile:fullPath atomically:YES encoding:NSUTF8StringEncoding error:&err];
    if (err) {
        NSLog(@"%@", err);
    } else {
        printf("创建成功, 快开启你的 Python 之旅吧\n");
    }
    
    // 上面的逻辑有点非常规, 我也不知道我是怎么想的....
}

// 创建 Shell 文件
void bornShell(int argc, const char * argv[]) {
    // 文件名
    NSString *fileName = [[NSString alloc] initWithUTF8String:argv[1]];
    // 文件全名
    NSString* fullPath = [NSString stringWithFormat:@"%@.sh", fileName];
    
    // 创建具体的文件
    NSError * err = nil;
    NSString *content = @"#!/bin/sh\n";
    [content writeToFile:fullPath atomically:YES encoding:NSUTF8StringEncoding error:&err];
    if (err) {
        NSLog(@"%@", err);
    } else {
        printf("创建成功, 快开启你的 Shell 之旅吧\n");
    }
}

// 返回0：无中文，返回1：有中文
int includeChinese(const char *str) {
    int nRet = 0;
    char c;
    while(c = (*str++)) {
        // 如果字符高位为 1 且下一字符高位也是 1 则有中文字符
        if( (c&0x80) && (*str & 0x80) ) {
            nRet = 1;
            break;
        }
    }
    return nRet;
} // from: https://blog.csdn.net/longfeihufengyun/article/details/50251467

// entry
int main(int argc, const char * argv[]) {
    // 有效性验证
    if (argc == 1) {
        printf("useag: %s [文件名|目录名] [p]\n", argv[0]);
        return 0;
    }
    
    int result = includeChinese(argv[1]);
    if (result > 0) {
        printf("兄die, 文件名不要写成中文\n");
        return 0;
    }
    
    // 通过比较可执行文件, 区分是创建 Python 文件, 还是创建 Shell 文件.
    const char * fileName = argv[0];
    if (!strcmp(fileName, "fpy")) {
        // 当前可执行文件是 fpy
        bornPython(argc, argv);
    } else {
        // 当前可执行文件是 fsh
        bornShell(argc, argv);
    }
    
    return 0;
}
