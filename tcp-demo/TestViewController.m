//
//  TestViewController.m
//  tcp-demo
//
//  Created by coolgo on 13-11-21.
//  Copyright (c) 2013年 coolgo. All rights reserved.
//

#import "TestViewController.h"
#import "GCDAsyncSocket.h"

#import "TCPTest.h"
@interface TestViewController ()<GCDAsyncSocketDelegate>

@property(nonatomic,strong)TCPTest *tcpTest;

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tcpTest=[[TCPTest alloc] init];
    
    [_tcpTest setUp];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action_send:(id)sender {
    if ([_lab_connectStatus.text isEqualToString:@"connected"]) {
         [self.tcpTest sendInfoData];   
    }
}

#pragma mark GCDAsyncSocketDelegate

#pragma mark GCDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    NSLog(@"连接已经建立");
    _lab_connectStatus.text=@"connected";

}

//返回数据解析
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
}


- (IBAction)action_conntect:(id)sender {
    if (_txt_hostName.text.length==0 || _txtPort.text.length==0) {
        return;
    }


    [self.tcpTest.myScoket connectToHost:_txt_hostName.text onPort:[_txtPort.text intValue] error:nil];
    _lab_connectStatus.text=@"connecting...";
}
@end
