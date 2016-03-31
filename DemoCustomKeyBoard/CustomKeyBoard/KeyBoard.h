//
//  Keyboard.h
//  CustomKeyBoard
//
//  Created by Nguyen Ha Giang on 3/30/16.
//  Copyright © 2016 Nguyen Ha Giang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Keyboard : UIView

@property (strong, nonatomic) IBOutlet UIButton *deletekey;
@property (strong, nonatomic) IBOutlet UIButton *globalKey;
@property (strong, nonatomic) IBOutlet UIButton *spaceKey;
@property (strong, nonatomic) IBOutlet UIButton *returnKey;
@property (strong, nonatomic) IBOutlet UIButton *numberKey;
@property (strong, nonatomic) IBOutlet UIButton *upcaseKey;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *keyArrays;

@property (strong, nonatomic) IBOutlet UIView *viewNumberKeyboard;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numArrays;
@property (strong, nonatomic) IBOutlet UIButton *upcaseNum;
@property (strong, nonatomic) IBOutlet UIButton *deleteNum;
@property (strong, nonatomic) IBOutlet UIButton *dotNum;
@property (strong, nonatomic) IBOutlet UIButton *commaNum;
@property (strong, nonatomic) IBOutlet UIButton *questionMark;
@property (strong, nonatomic) IBOutlet UIButton *exclamationNum;
@property (strong, nonatomic) IBOutlet UIButton *quotationMark;
@property (strong, nonatomic) IBOutlet UIButton *spaceNum;
@property (strong, nonatomic) IBOutlet UIButton *returnNum;
@property (strong, nonatomic) IBOutlet UIButton *globalNum;
@property (strong, nonatomic) IBOutlet UIButton *charNum;


@end
