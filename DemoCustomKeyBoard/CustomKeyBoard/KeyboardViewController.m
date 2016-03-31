//
//  KeyboardViewController.m
//  CustomKeyBoard
//
//  Created by Nguyen Ha Giang on 3/30/16.
//  Copyright © 2016 Nguyen Ha Giang. All rights reserved.
//

#import "KeyboardViewController.h"
#import "Keyboard.h"

@interface KeyboardViewController ()
@property (strong, nonatomic) Keyboard *keyboard;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Perform custom UI setup here
    isUpCaseString = NO;
    self.keyboard = [[[NSBundle mainBundle] loadNibNamed:@"Keyboard" owner:nil options:nil] objectAtIndex:0];
    [self addGesturesToKeyboard];
    self.inputView = self.keyboard;
    numArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", @"-", @"/", @":", @";", @"(", @")", @"₫", @"&", @"@", @"\""];
    symbolArray = @[@"[", @"]", @"{", @"}", @"#", @"%", @"^", @"*", @"+", @"=", @"_", @"\\", @"|", @"~", @"<", @">", @"$", @"¥", @"€", @"•"];
    for (UIButton *num in self.keyboard.numArrays) {
        NSInteger numTag = num.tag;
        [num setTitle:[numArray objectAtIndex:numTag - 100] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    
}

- (void)addGesturesToKeyboard{
    [self.keyboard.deletekey.layer setCornerRadius:3.0];
    [self.keyboard.globalKey.layer setCornerRadius:3.0];
    [self.keyboard.numberKey.layer setCornerRadius:3.0];
    [self.keyboard.upcaseKey.layer setCornerRadius:3.0];
    [self.keyboard.returnKey.layer setCornerRadius:3.0];
    [self.keyboard.spaceKey.layer setCornerRadius:3.0];
    [self.keyboard.upcaseNum.layer setCornerRadius:3.0 ];
    [self.keyboard.deleteNum.layer setCornerRadius:3.0 ];
    [self.keyboard.dotNum.layer setCornerRadius:3.0 ];
    [self.keyboard.commaNum.layer setCornerRadius:3.0 ];
    [self.keyboard.questionMark.layer setCornerRadius:3.0 ];
    [self.keyboard.exclamationNum.layer setCornerRadius:3.0 ];
    [self.keyboard.quotationMark.layer setCornerRadius:3.0 ];
    [self.keyboard.charNum.layer setCornerRadius:3.0 ];
    [self.keyboard.globalNum.layer setCornerRadius:3.0 ];
    [self.keyboard.spaceNum.layer setCornerRadius:3.0 ];
    [self.keyboard.returnNum.layer setCornerRadius:3.0 ];
    
    
    [self.keyboard.deletekey addTarget:self action:@selector(pressDeleteKey) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.globalKey addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.numberKey addTarget:self action:@selector(pressNumberKey) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.upcaseKey addTarget:self action:@selector(pressUpcaseKey) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.returnKey addTarget:self action:@selector(pressReturnKey) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.spaceKey addTarget:self action:@selector(pressSpaceKey) forControlEvents:UIControlEventTouchUpInside];
    
    [self.keyboard.upcaseNum addTarget:self action:@selector(pressUpcaseNum) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.deleteNum addTarget:self action:@selector(pressDeleteKey) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.dotNum addTarget:self action:@selector(pressDotNum) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.commaNum addTarget:self action:@selector(pressCommaNum) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.questionMark addTarget:self action:@selector(pressQuestionMark) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.exclamationNum addTarget:self action:@selector(pressExclamationNum) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.quotationMark addTarget:self action:@selector(pressQuotationMark) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.charNum addTarget:self action:@selector(pressCharNum) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.globalNum addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.spaceNum addTarget:self action:@selector(pressSpaceKey) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboard.returnNum addTarget:self action:@selector(pressReturnKey) forControlEvents:UIControlEventTouchUpInside];
    
    //    @property (strong, nonatomic) IBOutlet UIView *viewNumberKeyboard;
    //    @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numArrays;
    
    for (UIButton *key in self.keyboard.keyArrays) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
        [key.layer setCornerRadius:3.0];
    }
    
    for (UIButton *num in self.keyboard.numArrays) {
        [num addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
        [num.layer setCornerRadius:3.0];
    }
}

#pragma mark Handler View keyboard numberic
- (void)pressUpcaseNum{
    if (isUpCaseString == NO) {
        for (UIButton *num in self.keyboard.numArrays) {
            NSInteger numTag = num.tag;
            [num setTitle:[symbolArray objectAtIndex:numTag - 100] forState:UIControlStateNormal];
        }
        isUpCaseString = YES;
    } else {
        for (UIButton *num in self.keyboard.numArrays) {
            NSInteger numTag = num.tag;
            [num setTitle:[numArray objectAtIndex:numTag - 100] forState:UIControlStateNormal];
        }
        isUpCaseString = NO;
    }
    
}

- (void)pressDotNum{
    [self.textDocumentProxy insertText:@"."];
}

- (void)pressCommaNum{
    [self.textDocumentProxy insertText:@","];
}

- (void)pressQuestionMark{
    [self.textDocumentProxy insertText:@"?"];
}

- (void)pressExclamationNum{
    [self.textDocumentProxy insertText:@"!"];
}

- (void)pressQuotationMark{
    [self.textDocumentProxy insertText:@"'"];
}

-(void)pressCharNum{
    [self.keyboard.viewNumberKeyboard setHidden:YES];
    for (UIButton *num in self.keyboard.numArrays) {
        NSInteger numTag = num.tag;
        [num setTitle:[numArray objectAtIndex:numTag - 100] forState:UIControlStateNormal];
    }
    isUpCaseString = NO;
}

#pragma mark handler view keyboard character
- (void)pressDeleteKey{
    [self.textDocumentProxy deleteBackward];
}

- (void)pressNumberKey{
    [self.keyboard.viewNumberKeyboard setHidden:NO];
    for (UIButton *key in self.keyboard.keyArrays) {
        NSString *titleString = [[key currentTitle] uppercaseString];
        [key setTitle:titleString forState:UIControlStateNormal];
    }
    isUpCaseString = NO;
}

- (void)pressUpcaseKey{
    if (isUpCaseString == NO) {
        for (UIButton *key in self.keyboard.keyArrays) {
            NSString *titleString = [[key currentTitle] uppercaseString];
            [key setTitle:titleString forState:UIControlStateNormal];
        }
        isUpCaseString = YES;
    } else {
        for (UIButton *key in self.keyboard.keyArrays) {
            NSString *titleString = [[key currentTitle] lowercaseString];
            [key setTitle:titleString forState:UIControlStateNormal];
        }
        isUpCaseString = NO;
    }
    //    self.textDocumentProxy
}

- (void)pressReturnKey{
    [self.textDocumentProxy insertText:@"\n"];
}

- (void)pressSpaceKey{
    [self.textDocumentProxy insertText:@" "];
}

- (void)pressKey:(UIButton*)key{
    [self.textDocumentProxy insertText:[key currentTitle]];
}

@end