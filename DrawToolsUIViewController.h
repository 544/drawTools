//
//  DrawToolsUIViewController.h
//  drawTools
//
//  Created by masato.t@gmail.com on 11/03/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSelecter.h"


@interface DrawToolsUIViewController : UIViewController {

	UIView *_colorSelecterView;
	UIImageView* _imageView;
	UIImage* saveImage;
	
	UIButton *_colorButton;
	
	CGPoint touchPoint;
	
}
@property (nonatomic, retain) IBOutlet UIImageView *_imageView;
@property (nonatomic, retain) IBOutlet UIButton *_colorButton;

//- (void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event;
- (IBAction) clickButtonSave:(UIButton*)sender;
- (IBAction) clickButtonLoad:(UIButton*)sender;
- (IBAction) clickButtonColor:(UIButton*)sender;

@end
