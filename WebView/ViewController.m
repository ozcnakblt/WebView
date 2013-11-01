//
//  ViewController.m
//  WebView
//
//  Created by Özcan Akbulut on 01.11.13.
//  Copyright (c) 2013 Özcan Akbulut. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView, blockLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [webView loadRequest: [NSURLRequest requestWithURL:
                           [NSURL URLWithString:@"http://www.ozcanakbulut.com"]]];
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.ozcanakbulut.com"];
    UIImageView *RbackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-reachability"]];
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            blockLabel.textColor = [UIColor greenColor];
            blockLabel.text = @"Connected";
            [RbackgroundView removeFromSuperview];
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            blockLabel.textColor = [UIColor redColor];
            blockLabel.text = @"Not Connected";
            
            [self.webView addSubview:RbackgroundView];
            [self.webView bringSubviewToFront:RbackgroundView];
        });
    };
    
    [reach startNotifier];
}


- (void) webViewDidStartLoad:(UIWebView *)webView {
    [self.loadingSign startAnimating];
    self.loadingSign.hidden = NO;
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.loadingSign stopAnimating];
    self.loadingSign.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
