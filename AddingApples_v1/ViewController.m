//
//  ViewController.m
//  AddingApples_v1
//
//  Created by Christopher Galindo on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize appleImages = _appleImages;
@synthesize buttons = _buttons;
@synthesize equalsButton = _equalsButton;
@synthesize plusButton = _plusButton;
@synthesize firstNumber = _firstNumber;
@synthesize plusSign = _plusSign;
@synthesize secondNumber = _secondNumber;
@synthesize equalsSign = _equalsSign;
@synthesize possibleAnswer = _possibleAnswer;
@synthesize answerOneImageView = _answerOneImageView;
@synthesize answerTwoImageView = _answerTwoImageView;
@synthesize answerThreeImageView = _answerThreeImageView;
@synthesize answerOneLabel = _answerOneLabel;
@synthesize answerTwoLabel = _answerTwoLabel;
@synthesize answerThreeLabel = _answerThreeLabel;
@synthesize reportView = _reportView;
@synthesize statusLabel = _statusLabel;
@synthesize progressCorrect = _progressCorrect;
@synthesize progressIncorrect = _progressIncorrect;
@synthesize progressAccuracy = _progressAccuracy;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (UIImageView *imageView in self.appleImages)
    {
        [imageView setUserInteractionEnabled:NO];
        [imageView setHidden:TRUE];
    }
    
    [self.equalsButton setEnabled:FALSE];
    [self.plusButton setEnabled:FALSE];
    
    [self.plusSign setHidden:TRUE];
    [self.equalsSign setHidden:TRUE];
    [self.possibleAnswer setHidden:TRUE];
    
    
    [self.answerOneImageView setHidden:YES];
    [self.answerTwoImageView setHidden:YES];
    [self.answerThreeImageView setHidden:YES];
    [self.answerOneLabel setHidden:YES];
    [self.answerTwoLabel setHidden:YES];
    [self.answerThreeLabel setHidden:YES];
    [self.reportView setHidden:YES];
    
    correct = 0;
    incorrect = 0;
    
    mode = [NSMutableString stringWithString:@"clear"];
    NSLog(@"Current mode: %@", mode);
}

- (void)viewDidUnload
{
    [self setFirstNumber:nil];
    [self setPlusSign:nil];
    [self setSecondNumber:nil];
    [self setEqualsSign:nil];
    [self setPossibleAnswer:nil];
    [self setAnswerOneImageView:nil];
    [self setAnswerTwoImageView:nil];
    [self setAnswerThreeImageView:nil];
    [self setAnswerOneLabel:nil];
    [self setAnswerTwoLabel:nil];
    [self setAnswerThreeLabel:nil];
    [self setReportView:nil];
    [self setStatusLabel:nil];
    [self setProgressCorrect:nil];
    [self setProgressIncorrect:nil];
    [self setProgressAccuracy:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.appleImages = nil;
    self.buttons = nil;
    self.equalsButton = nil;
    self.plusButton = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - IBAction Methods
// Each action button shows views depending on which mode the program is in

- (IBAction)button1Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 102)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 102;
        self.firstNumber.text = @"1";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 1)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 1;
        self.secondNumber.text = @"1";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button2Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 103)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 103;
        self.firstNumber.text = @"2";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 2)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 2;
        self.secondNumber.text = @"2";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode); 
}

- (IBAction)button3Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 104)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 104;
        self.firstNumber.text = @"3";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 3)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 3;
        self.secondNumber.text = @"3";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button4Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 105)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 105;
        self.firstNumber.text = @"4";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 4)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 4;
        self.secondNumber.text = @"4";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button5Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 106)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 106;
        self.firstNumber.text = @"5";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 5)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 5;
        self.secondNumber.text = @"5";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button6Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 107)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 107;
        self.firstNumber.text = @"6";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 6)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 6;
        self.secondNumber.text = @"6";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button7Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 108)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 108;
        self.firstNumber.text = @"7";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 7)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 7;
        self.secondNumber.text = @"7";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button8Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 109)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 109;
        self.firstNumber.text = @"8";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 8)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 8;
        self.secondNumber.text = @"8";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)button9Pressed:(id)sender
{
    if ([mode isEqualToString:@"answerSelected"])
        [self buttonClearPressed:self];
    
    if ([mode isEqualToString:@"clear"])
    {
        for (UIImageView *imageView in self.appleImages) 
            if ([imageView tag] < 110)
                [imageView setHidden:FALSE];
        startTagNum = 101;
        endTagNum = 110;
        self.firstNumber.text = @"9";
    }
    else
    {
        if ([mode isEqualToString:@"oneButtonPressed"])
            [self buttonPlusPressed:self];
        
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= endTagNum && [imageView tag] < endTagNum + 9)
                [imageView setHidden:FALSE];
        startTagNum = endTagNum;
        endTagNum += 9;
        self.secondNumber.text = @"9";
    }
    
    [self changeMode];
    [self changeAppleImage:startTagNum withEndTag:endTagNum];
    
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)buttonEqualsPressed:(id)sender
{
    [self changeMode];
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)buttonPlusPressed:(id)sender
{
    [self changeMode];
    NSLog(@"Current mode: %@", mode);
}

- (IBAction)buttonClearPressed:(id)sender
{
    for (UIImageView *imageView in self.appleImages) 
        [imageView setHidden:TRUE];
    
    for (UIButton *button in self.buttons)
        [button setEnabled:TRUE];
    
    mode = [NSMutableString stringWithString:@"clear"];
    [self.equalsButton setEnabled:FALSE];
    [self.plusButton setEnabled:FALSE];
    
    self.firstNumber.text = @"";
    self.secondNumber.text = @"";
    [self.plusSign setHidden:TRUE];
    [self.equalsSign setHidden:TRUE];
    [self.possibleAnswer setHidden:TRUE];
    [self.answerOneImageView setHidden:YES];
    [self.answerTwoImageView setHidden:YES];
    [self.answerThreeImageView setHidden:YES];
    [self.answerOneLabel setHidden:YES];
    [self.answerTwoLabel setHidden:YES];
    [self.answerThreeLabel setHidden:YES];
    [self.reportView setHidden:YES];
    self.possibleAnswer.text = @"?";
    
    NSLog(@"Current mode: %@", mode);
}

/*- (IBAction)checkAnswerPressed:(id)sender
{
    NSString *title;
    NSString *message;
    
    int firstNumber = [self.firstNumber.text intValue];
    int secondNumber = [self.secondNumber.text intValue];
    
    if (answer == firstNumber + secondNumber)
    {
        title = @"Congratulations";
        message = [NSString stringWithFormat:@"%d is correct!", answer];
    }
    else
    {
        title = @"Incorrect";
        message = [NSString stringWithFormat:@"The correct answer is %d", firstNumber + secondNumber];
    }
    
    UIAlertView *resultView = [[UIAlertView alloc] initWithTitle:title 
                                                         message:message 
                                                        delegate:self 
                                               cancelButtonTitle:@"OK" 
                                               otherButtonTitles:nil];
    [resultView show];
} */

#pragma mark - Alert View Delegates
/*- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self buttonClearPressed:self];
    [self.answerTextField resignFirstResponder];
    self.answerTextField.text = @"";
}*/

#pragma mark - Other Methods
- (void)changeMode
{
    if ([mode isEqualToString:@"clear"])
    {
        mode = [NSMutableString stringWithString:@"oneButtonPressed"];
        [self.plusButton setEnabled:TRUE];
    }
    else if ([mode isEqualToString:@"oneButtonPressed"])
    {
        mode = [NSMutableString stringWithString:@"plusPressed"];
        [self.plusButton setEnabled:FALSE];
        [self.plusSign setHidden:FALSE];
    }
    else if ([mode isEqualToString:@"plusPressed"])
    {
        mode = [NSMutableString stringWithString:@"secondButtonPressed"];
        [self.equalsButton setEnabled:TRUE];
        
        for (UIButton *button in self.buttons)
            [button setEnabled:FALSE];
    }
    else if ([mode isEqualToString:@"secondButtonPressed"])
    {
        mode = [NSMutableString stringWithString:@"equalsPressed"];
        [self.equalsButton setEnabled:FALSE];
        [self changeAppleImage:0 withEndTag:0];
        [self.equalsSign setHidden:FALSE];
        [self.possibleAnswer setHidden:FALSE];
        
        [self populateAnswers];
        
        [self.answerOneImageView setHidden:NO];
        [self.answerOneLabel setHidden:NO];
        [self.answerTwoImageView setHidden:NO];
        [self.answerTwoLabel setHidden:NO];
        [self.answerThreeImageView setHidden:NO];
        [self.answerThreeLabel setHidden:NO];
    }
    else if ([mode isEqualToString:@"equalsPressed"])
    {
        mode = [NSMutableString stringWithString:@"answerSelected"];
        [self.reportView setHidden:NO];
        
        for (UIButton *button in self.buttons)
            [button setEnabled:YES];
    }
}

- (void)changeAppleImage:(int)startTag withEndTag:(int)endTag
{
    if ([mode isEqualToString:@"oneButtonPressed"])
    {
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] < endTag)
            {
                [imageView setUserInteractionEnabled:YES];
                [imageView setImage:[UIImage imageNamed:@"red_apple.png"]];
            }
    }
    else if ([mode isEqualToString:@"secondButtonPressed"])
    {
        for (UIImageView *imageView in self.appleImages)
            if ([imageView tag] >= startTagNum && [imageView tag] < endTag)
            {
                [imageView setUserInteractionEnabled:YES];
                [imageView setImage:[UIImage imageNamed:@"green_apple.png"]];
            }
    }
    else if ([mode isEqualToString:@"equalsPressed"])
    {
        for (UIImageView *imageView in self.appleImages)
        {
            if (![imageView isHidden])
                [imageView setImage:[UIImage imageNamed:@"black_apple.png"]];
            if ([imageView isUserInteractionEnabled])
                [imageView setUserInteractionEnabled:NO];
        }
    }
}

- (void)checkAnswer
{
    int firstNumber = [self.firstNumber.text intValue];
    int secondNumber = [self.secondNumber.text intValue];
    
    if (selectedAnswer == firstNumber + secondNumber)
    {
        [self.statusLabel setTextColor:[UIColor greenColor]];
        self.statusLabel.text = @"Correct!";
        correct++;
    }
    else 
    {
        [self.statusLabel setTextColor:[UIColor redColor]];
        self.statusLabel.text = @"Incorrect!";
        incorrect++;
    }
    
    self.possibleAnswer.text = [NSString stringWithFormat:@"%d", firstNumber + secondNumber];
    self.progressCorrect.text = [NSString stringWithFormat:@"%d", correct];
    self.progressIncorrect.text = [NSString stringWithFormat:@"%d", incorrect];
    self.progressAccuracy.text = [NSString stringWithFormat:@"%.1f%%", ((double)correct / (correct + incorrect)) * 100];
    
    [self changeMode];
}

- (void)populateAnswers
{
    int firstNumber = [self.firstNumber.text intValue];
    int secondNumber = [self.secondNumber.text intValue];
    int correctAnswer = firstNumber + secondNumber;
    int incorrectAnswerOne = 1 + (arc4random() % 18);
    int incorrectAnswerTwo = 1 + (arc4random() % 18);
    
    while (incorrectAnswerOne == correctAnswer)
        incorrectAnswerOne = 1 + (arc4random() % 18);
    
    while (incorrectAnswerTwo == correctAnswer || incorrectAnswerTwo == incorrectAnswerOne)
        incorrectAnswerTwo = 1 + (arc4random() % 18);
    
    int answerStyle = 1 + (arc4random() % 6);
    if (answerStyle == 1)
    {
        self.answerOneLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerOne];
        self.answerTwoLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerTwo];
        self.answerThreeLabel.text = [NSString stringWithFormat:@"%d", correctAnswer];
    }
    else if (answerStyle == 2)
    {
        self.answerOneLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerOne];
        self.answerTwoLabel.text = [NSString stringWithFormat:@"%d", correctAnswer];
        self.answerThreeLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerTwo];
    }
    else if (answerStyle == 3)
    {
        self.answerOneLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerTwo];
        self.answerTwoLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerOne];
        self.answerThreeLabel.text = [NSString stringWithFormat:@"%d", correctAnswer];
    }
    else if (answerStyle == 4)
    {
        self.answerOneLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerTwo];
        self.answerTwoLabel.text = [NSString stringWithFormat:@"%d", correctAnswer];
        self.answerThreeLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerOne];
    }
    else if (answerStyle == 5)
    {
        self.answerOneLabel.text = [NSString stringWithFormat:@"%d", correctAnswer];
        self.answerTwoLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerOne];
        self.answerThreeLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerTwo];
    }
    else if (answerStyle == 6)
    {
        self.answerOneLabel.text = [NSString stringWithFormat:@"%d", correctAnswer];
        self.answerTwoLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerTwo];
        self.answerThreeLabel.text = [NSString stringWithFormat:@"%d", incorrectAnswerOne];
    }
}

- (void)appleTouchedWithTag:(int)tag
{
    BOOL isFound = NO;
    
    for (UIImageView *imageView in self.appleImages)
    {
        if ([imageView tag] == tag)
        {
            [imageView setImage:[UIImage imageNamed:@"black_apple.png"]];
            imageView.userInteractionEnabled = NO;
        }
        if([imageView isUserInteractionEnabled])
        {
            isFound = YES;
        }
    }
    
    if (!isFound)
        [self buttonEqualsPressed:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (touch.view.tag == 200)
    {
        selectedAnswer = [self.answerOneLabel.text intValue];
        [self checkAnswer];
    }
    else if (touch.view.tag == 201)
    {
        selectedAnswer = [self.answerTwoLabel.text intValue];
        [self checkAnswer];
    }
    else if (touch.view.tag == 202)
    {
        selectedAnswer = [self.answerThreeLabel.text intValue];
        [self checkAnswer];
    }
    else if (touch.view.tag >= 101 && touch.view.tag <= 118)
    {
        [self appleTouchedWithTag:touch.view.tag];
    }
    
}

@end
