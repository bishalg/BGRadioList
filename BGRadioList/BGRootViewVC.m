//
//  BGRootViewVC.m
//  BGRadioList
//
//  Created by Bishal Ghimire on 6/2/13.
//  Copyright (c) 2013 Bishal Ghimire. All rights reserved.
//

#import "BGRootViewVC.h"

@interface BGRootViewVC ()

@end

@implementation BGRootViewVC

#pragma mark Radio List Delegate
-(void)radioView:(BGRadioView *)radioView didSelectOption:(int)optionNo fortag:(int)tagNo{
    NSLog(@"Optio No %d List No %d", optionNo, tagNo);
}

-(void) allocRadioView {
    // Setup 1st radio list with 4 items
    NSMutableArray *sortByItemsArray = [[NSMutableArray alloc] init];
    [sortByItemsArray addObject:@"Price"];
    [sortByItemsArray addObject:@"Modified Date"];
    [sortByItemsArray addObject:@"Most Viewed"];
    [sortByItemsArray addObject:@"Created Date"];
    self.radioViewSortBy.rowItems =  sortByItemsArray;
    self.radioViewSortBy.maxRow = [sortByItemsArray count];
    self.radioViewSortBy.editable = YES;
    self.radioViewSortBy.delegate = self;
    self.radioViewSortBy.tag = 1;
    self.radioViewSortBy.optionNo = 3;
    // set defult optionNo = -1 to select none
    //self.radioView.optionNo = -1;
    
    // Setup 2nd radio list
    NSMutableArray *sortTypeArray = [[NSMutableArray alloc] init];
    [sortTypeArray addObject:@"Ascending"];
    [sortTypeArray addObject:@"Descending"];
    self.radioViewSortingType.rowItems = sortTypeArray;
    self.radioViewSortingType.optionNo = 1;
    self.radioViewSortingType.tag = 2;
    self.radioViewSortingType.delegate = self;
    self.radioViewSortingType.maxRow = [sortTypeArray count];
    self.radioViewSortingType.editable = YES;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self allocRadioView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setRadioViewSortBy:nil];
    [self setRadioViewSortingType:nil];
    [super viewDidUnload];
}
@end
