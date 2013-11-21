//
//  TCPTest.m
//  tcp-demo
//
//  Created by coolgo on 13-11-21.
//  Copyright (c) 2013年 coolgo. All rights reserved.
//

#import "TCPTest.h"


@implementation TCPTest



-(void)setUp{
    _myScoket=[[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
}





-(void)sendInfoData{
    TCPInfo info;
    memset(&info, 0, sizeof(TCPInfo));
    
    info.len=2;   //这里你要注意高地位的
    info.cmd=0x11;
    
    NSString *name=@"大";
    
    memcpy(&info.name, [name UTF8String], 2);
    
    info.tail=0x00;
    
    NSData *sendData=[NSData dataWithBytes:&info length:sizeof(TCPInfo)];
    
    //发送数据
    [self.myScoket writeData:sendData withTimeout:-1 tag:0];
}


#pragma mark GCDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    NSLog(@"连接已经建立");
    
    [self.socketDelegate socket:sock didConnectToHost:host port:port];
}

//返回数据解析
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    [self.socketDelegate socket:sock didReadData:data withTag:tag];
}



@end
