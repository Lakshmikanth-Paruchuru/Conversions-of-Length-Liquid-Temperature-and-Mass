//
//  ConversionViewController.h
//  Assignment02
//
//  Created by Paruchuru, Lakshmikanth on 10/20/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConversionViewController : UIViewController <UITextFieldDelegate>

    @property (nonatomic, copy) NSString *Inputvalue;
    @property (nonatomic, assign ) NSUInteger *index;
    @property (nonatomic, assign ) NSUInteger *sectionIndex;
    @property (nonatomic, assign ) NSString *segue;
    
@end
