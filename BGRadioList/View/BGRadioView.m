//
//  BGRadioView.m
//  Listbingo
//
//  Created by Bishal Ghimire on 5/29/13.
//  Copyright (c) 2013 Bishal Ghimire. All rights reserved.
//

#import "BGRadioView.h"

@implementation BGRadioView

@synthesize optionNo;
@synthesize editable;
@synthesize maxRow;
@synthesize rowItems;

@synthesize delegate;
@synthesize tag;
@synthesize rowHeight;

int selectedRow = -1;

#pragma mark - Table View

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return maxRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *labelOne = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 140, 20)];
    [labelOne setBackgroundColor:[UIColor clearColor]];
    [labelOne setTextColor:[UIColor colorWithRed:5/255.f green:5/255.f blue:5/255.f alpha:1]];
    NSString *textString = [[NSString alloc] init];
    textString = @"\u2001  "; // blank unicode char to represent uncheck
    
    if (indexPath.row == optionNo) {
        textString = @"\u2713  "; // check unicode char
        [labelOne setTextColor:[UIColor colorWithRed:35/255.f green:150/255.f blue:200/255.f alpha:1]];
    }
    textString = [textString stringByAppendingString:[rowItems objectAtIndex:indexPath.row]];
    
    labelOne.textAlignment = UITextAlignmentLeft;
    labelOne.text = textString;
    [cell.contentView addSubview:labelOne];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    optionNo = indexPath.row;
    [self.delegate radioView:self didSelectOption:indexPath.row fortag:tag];
    [tableView reloadData];
}

- (void)setRating:(float)rating {
    rating = rating;
}

- (void)handleTouchAtLocation {
    if (!self.editable) return;
    int newRating = 0;
    self.rating = newRating;
}

//  This function gets called whenever the frame of our view changes, and we’re
// expected to set up the frames of all of our subviews to the appropriate size for that space.
- (void)layoutSubviews {
    [super layoutSubviews];
}

/* we support both initWithFrame and initWithCoder so that our view controller
 can add us via a XIB or programatically. */
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}


/* we initialize our instance variables to default values */
-(void) baseInit {
    selectedRow = optionNo;
    optionNo = 0;
    editable = NO;
    // maxRow = 4;
    delegate = nil;
    rowItems = [[NSMutableArray alloc]init];
    
    // Make TableView
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.bounces = NO;
    [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    //[tableView setBackgroundColor:[UIColor grayColor]];
    
    [tableView setBackgroundColor:[UIColor colorWithRed:242/255.f green:235/255.f blue:235/255.f alpha:1]];
    [self addSubview:tableView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
