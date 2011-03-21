//
//  DrawToolsUIViewController.h
//  drawTools
//
//  Created by 塚越 雅斗 on 11/03/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawToolsUIViewController : UIViewController {

	UIView *_colorSelecterView;
	UIImageView* _imageView;
	UIImage* saveImage;
	
	UIButton *_colorButton;
	
	CGPoint touchPoint;
	
}
@property (nonatomic, retain) IBOutlet UIImageView *_imageView;
@property (nonatomic, retain) IBOutlet UIView *_colorSelecterView;
@property (nonatomic, retain) IBOutlet UIButton *_colorButton;

//- (void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event;
- (IBAction) clickButtonSave:(UIButton*)sender;
- (IBAction) clickButtonLoad:(UIButton*)sender;
- (IBAction) clickButtonColor:(UIButton*)sender;

@end
