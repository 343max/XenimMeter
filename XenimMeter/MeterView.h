//
//  MeterView.h
//  MeterTest
//
//  Created by Frank Schmitt on 2010-12-04.
//  Copyright © 2011 Laika Systems
// 
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
// 
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
// 
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MeterNeedle : NSObject {
	UIColor *tintColor_;

	float length;
	float width;
}

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) float length;
@property (nonatomic, assign) float width;

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx;

@end

@interface MeterView : UIView {
	float minNumber;
	float maxNumber;
	double startAngle;
	double arcLength;
	CGFloat lineWidth;
	float tickIncrement;
	float minorTickIncrement;
	
	float value;
	
	UILabel *textLabel;
	
	CALayer *needleLayer;
	UILabel *label;
	
	MeterNeedle *needle_;
}

@property (nonatomic, assign) float minNumber;
@property (nonatomic, assign) float maxNumber;
@property (nonatomic, assign) double startAngle;
@property (nonatomic, assign) double arcLength;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) float tickInset;
@property (nonatomic, assign) float tickLength;
@property (nonatomic, assign) float minorTickLength;

@property (nonatomic, assign) float value;

@property (nonatomic, readonly) UILabel *textLabel;
@property (nonatomic, readonly) MeterNeedle *needle;

-(void)initialize;

@end
