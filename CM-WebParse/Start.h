//
//  ViewController.h
//  CM-WebParse
//
//  Created by 0x00 on 16/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "UIImageView+WebCache.h"

#define nURLNews @"http://www.chivasdecorazon.com.mx/noticias/tag/primer-equipo"

//Debug
#define nDebugEnable        1
#define print(x)            if(nDebugEnable){(x);}


@interface Start : UIViewController <UIWebViewDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imgNoticia;
@property (strong, nonatomic) IBOutlet UILabel *lblTexto;

- (IBAction)btnCargar:(id)sender;

@end

