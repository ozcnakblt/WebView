//
//  ViewController.h
//  WebView
//
//  Created by Özcan Akbulut on 01.11.13.
//  Copyright (c) 2013 Özcan Akbulut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingSign;
@property (assign, nonatomic) IBOutlet UILabel * blockLabel;

@end
