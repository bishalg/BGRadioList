BGRadioList
===========

Radio List for iPhone, using table view to show radio list like radio button.
Just like Wifi - Choose a Network in Wifi Setting on iOS, with check mark on left side. 

Simple radio list to show radio button type option in iOS with using table view and delegates. No Image needed.

![Alt text](http://i4.photobucket.com/albums/y118/Bishal/GitHub/iOSSimulatorScreenshotJun2201361250PM.png "Demo Example")

```  objective-c
//  BGRootViewVC.h
#import "BGRadioView.h"

@interface BGRootViewVC : UIViewController
<BGRadioViewDelegate>

@property (weak, nonatomic) IBOutlet BGRadioView *radioViewSortBy;
@property (weak, nonatomic) IBOutlet BGRadioView *radioViewSortingType;


//  BGRootViewVC.m

@synthesize radioViewSortBy;
@synthesize radioViewSortingType;

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
    radioViewSortBy.rowItems =  sortByItemsArray;
    radioViewSortBy.maxRow = [sortByItemsArray count];
    radioViewSortBy.editable = YES;
    radioViewSortBy.delegate = self;
    radioViewSortBy.tag = 1;
    radioViewSortBy.optionNo = 3;
    // set defult optionNo = -1 to select none
    //self.radioView.optionNo = -1;
    
    // Setup 2nd radio list
    NSMutableArray *sortTypeArray = [[NSMutableArray alloc] init];
    [sortTypeArray addObject:@"Ascending"];
    [sortTypeArray addObject:@"Descending"];
    radioViewSortingType.rowItems = sortTypeArray;
    radioViewSortingType.optionNo = 1;
    radioViewSortingType.tag = 2;
    radioViewSortingType.delegate = self;
    radioViewSortingType.maxRow = [sortTypeArray count];
    radioViewSortingType.editable = YES;
}

