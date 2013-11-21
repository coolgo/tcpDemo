//
//  TCPTest.h
//  tcp-demo
//
//  Created by coolgo on 13-11-21.
//  Copyright (c) 2013年 coolgo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

typedef unsigned char       U8;
typedef unsigned int        U32;







typedef struct{
    U32 len;
    U8  cmd;
    U8  name[2];
    U8  tail;
} TCPInfo;




@interface TCPTest : NSObject<GCDAsyncSocketDelegate>

@property(nonatomic,strong)GCDAsyncSocket *myScoket;


@property(nonatomic,weak) id<GCDAsyncSocketDelegate> socketDelegate;

-(void)setUp;

-(void)sendInfoData;

@end
