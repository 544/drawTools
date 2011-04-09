//
//  DrawToolsUIViewController.m
//  drawTools
//
//  Created by  masato.t@gmail.com on 11/03/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawToolsUIViewController.h"
#import "ColorSelecter.h"

@implementation DrawToolsUIViewController
@synthesize _imageView;
@synthesize _colorButton;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	saveImage = nil;
	
	//ColorButton初期化???TODO
	//UIImage* buttonImage = [[UIImage alloc] initwith
	
	
    [super viewDidLoad];
}

ColorSelecter *colorSelecter;
- (IBAction) clickButtonColor:(UIButton*)sender {
    NSLog(@"Color");
	// アニメーション処理
	[UIView beginAnimations:nil context:NULL];
	// 0.75秒で
	[UIView setAnimationDuration:0.75];
	// クルッと回る
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
	
    colorSelecter = [[ColorSelecter alloc] initWithNibName:@"ColorSelecter" bundle:nil];

    [self.view addSubview:colorSelecter.view];
	
	[UIView commitAnimations]; 
}

- (IBAction) clickButtonSave:(UIButton*)sender {
		
	//アラート表示
	NSLog(@"save");
	saveImage = _imageView.image.copy;
	
	if(saveImage==nil) return;

	//　UIImageからNSDataを作成
	NSData *imageData = 
	[
	 [
	  [NSData alloc] 
	  initWithData:UIImagePNGRepresentation( saveImage )
	  ] 
	 autorelease
	 ];
	
	//　アプリのdocumentフォルダに保存
	[imageData writeToFile:[@"~/test.jpg" stringByExpandingTildeInPath] atomically:YES];
	/*
	 stringByExpandingTildeInPath->チルダ付きのパスをフルパスにして返します
	 atomically->パスで指定したファイルに辞書の内容を書き込みます 
	 */
	
//	フォトアルバムへの保存ならこれでよい。
//	UIImageWriteToSavedPhotosAlbum(saveImage, self, nil, nil);
}

- (IBAction) clickButtonLoad:(UIButton*)sender {
	//アラート表示
	NSLog(@"load");
	
	NSData *imageData =
	[NSData dataWithContentsOfFile:[@"~/test.jpg" stringByExpandingTildeInPath]];
	
	_imageView.image = [[UIImage alloc] initWithData:imageData];
	
	
//	_imageView.image = saveImage;
}


// ファーストアペンダーにするのに必要？
- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

// シェイクを検知して画像を削除。
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
	_imageView.image = nil;
}

// タッチ開始イベントの処理
- (void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event {
	
    UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:_imageView];
	
}

- (void) touchesMoved:(NSSet*) touches withEvent:(UIEvent*) event {
    UITouch *touch = [touches anyObject]; 
    CGPoint currentPoint = [touch locationInView:_imageView];
    
    UIGraphicsBeginImageContext(_imageView.frame.size);
    
    [_imageView.image drawInRect:CGRectMake(0, 0, _imageView.frame.size.width, _imageView.frame.size.height)];
	
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
//	CGContextSetStrokeColorWithColor(<#CGContextRef c#>, <#CGColorRef color#>)
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
	
    _imageView.image = UIGraphicsGetImageFromCurrentImageContext();
	
    UIGraphicsEndImageContext();
	
    touchPoint = currentPoint;
}

- (void) touchesEnded:(NSSet*) touches withEvent:(UIEvent*) event {
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
