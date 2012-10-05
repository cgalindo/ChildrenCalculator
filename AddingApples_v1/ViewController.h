//
//  ViewController.h
//  AddingApples_v1
//
//  Created by Christopher Galindo on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    NSMutableString *mode;
    int endTagNum;
    int startTagNum;
    int withTagNumber;
    int selectedAnswer;
    int correct;
    int incorrect;
    double accuracy;
}

@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *appleImages;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *buttons;
@property (strong, nonatomic) IBOutlet UIButton *equalsButton;
@property (strong, nonatomic) IBOutlet UIButton *plusButton;
@property (strong, nonatomic) IBOutlet UILabel *firstNumber;
@property (strong, nonatomic) IBOutlet UILabel *plusSign;
@property (strong, nonatomic) IBOutlet UILabel *secondNumber;
@property (strong, nonatomic) IBOutlet UILabel *equalsSign;
@property (strong, nonatomic) IBOutlet UILabel *possibleAnswer;
@property (strong, nonatomic) IBOutlet UIImageView *answerOneImageView;
@property (strong, nonatomic) IBOutlet UIImageView *answerTwoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *answerThreeImageView;
@property (strong, nonatomic) IBOutlet UILabel *answerOneLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerTwoLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerThreeLabel;
@property (strong, nonatomic) IBOutlet UIView *reportView;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *progressCorrect;
@property (strong, nonatomic) IBOutlet UILabel *progressIncorrect;
@property (strong, nonatomic) IBOutlet UILabel *progressAccuracy;


// IBActions for when buttons are pressed
- (IBAction)button1Pressed:(id)sender;
- (IBAction)button2Pressed:(id)sender;
- (IBAction)button3Pressed:(id)sender;
- (IBAction)button4Pressed:(id)sender;
- (IBAction)button5Pressed:(id)sender;
- (IBAction)button6Pressed:(id)sender;
- (IBAction)button7Pressed:(id)sender;
- (IBAction)button8Pressed:(id)sender;
- (IBAction)button9Pressed:(id)sender;
- (IBAction)buttonEqualsPressed:(id)sender;
- (IBAction)buttonPlusPressed:(id)sender;
- (IBAction)buttonClearPressed:(id)sender;


// methods
- (void)changeMode;
- (void)checkAnswer;
- (void)changeAppleImage:(int)startTag withEndTag:(int)endTag;

@end
