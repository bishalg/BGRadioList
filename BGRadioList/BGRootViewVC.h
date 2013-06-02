//
//  BGRootViewVC.h
//  BGRadioList
//
//  Created by Bishal Ghimire on 6/2/13.
//  Copyright (c) 2013 Bishal Ghimire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGRadioView.h"

@interface BGRootViewVC : UIViewController
<BGRadioViewDelegate>

@property (weak, nonatomic) IBOutlet BGRadioView *radioViewSortBy;
@property (weak, nonatomic) IBOutlet BGRadioView *radioViewSortingType;

@end
