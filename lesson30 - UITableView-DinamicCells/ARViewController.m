//
//  ARViewController.m
//  lesson30 - UITableView-DinamicCells
//
//  Created by Anatoly Ryavkin on 26/05/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController ()

@end

@implementation ARViewController


-(CGFloat)randomCGFloatAt256{
    return (CGFloat)(((arc4random()*1000)%256) /255.f);
}
-(UIColor*)randomColor{
    CGFloat r = [self randomCGFloatAt256];
    CGFloat g = [self randomCGFloatAt256];
    CGFloat b = [self randomCGFloatAt256];
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flagFirstRotation=YES;
    [self.table registerClass:[AVTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headIdent"];
    [self.table reloadData];
    self.table.sectionHeaderHeight = 100;
    //self.table.sectionFooterHeight = 0;
}


-(void)loadView{
    [super loadView];
    self.table.sectionIndexColor = [UIColor greenColor];
    //self.table.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    self.table.delegate=self;
    self.table.dataSource=self;
    self.table.frame=CGRectMake(0, 0, CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds));
    self.table.backgroundColor = [UIColor grayColor] ;
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.allowsSelection = YES;
    UIEdgeInsets inset = UIEdgeInsetsMake(10,0,0,0);
    self.table.contentInset = inset;
    self.table.scrollIndicatorInsets = inset;
    self.table.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

}

#pragma mark - castom header


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    NSLog(@"section = %li",(long)section);

    AVTableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headIdent"];

    UIImage*image;

    if(section%2==0)
        image = [UIImage imageNamed: @"cat1.png"];
    else
        image = [UIImage imageNamed: @"cat2.png"];
    
    headView = [headView initWithImage:image andTitle:[NSString stringWithFormat:@"section -%li",(long)section]];

    return headView;
}

#pragma mark - UITableDelegat

#pragma mark - Rotation devais

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    int countCells = (int)size.height/self.heightCell;
    UITableViewCell*cellCheck = [self.table.visibleCells objectAtIndex:0];
    NSIndexPath*path = [self.table indexPathForCell:cellCheck];
    NSInteger section = path.section;
    NSInteger row = path.row-1;

    for(int i=-1;i<=countCells;i++){

        if(row==9){
            row = 0;
            section++;
        }else{
            row++;
        }

        NSIndexPath*path = [NSIndexPath indexPathForRow:row inSection:section];
        UITableViewCell*cell;
        if(!([self.table cellForRowAtIndexPath:path])){
            NSLog(@"dont cell");
        }else{
            cell = [self.table cellForRowAtIndexPath:path];
            NSLog(@"yes cell");
        }

        if(!(self.flagFirstRotation)){
            NSLog(@"count= %lu",(unsigned long)cell.subviews.count);
            if(cell.subviews.count==2)
            [[cell.subviews objectAtIndex:1] removeFromSuperview];
        }


        UILabel*viewLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxY(self.view.bounds)-200,
                                                                     CGRectGetMinY(cell.bounds),
                                                                         200,
                                                                      CGRectGetHeight(cell.bounds))];
        viewLab.backgroundColor = [self randomColor];
        viewLab.text = [NSString stringWithFormat:@"float = %.2f",[self randomCGFloatAt256]];
        [cell addSubview:viewLab];
    }
      self.flagFirstRotation=NO;
}

#pragma mark - UITableViewDataSourse

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString* identifier = @"identifier";
    NSString*stringForDetailTextLable;
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell){
        stringForDetailTextLable=[NSString stringWithFormat:@"cell was reause for: section = %li row = %li",(long)indexPath.section,(long)indexPath.row];
    }else{
        stringForDetailTextLable=[NSString stringWithFormat:@"cel did new creaty for: section = %li row = %li",(long)indexPath.section,(long)indexPath.row];
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }

    UIImage*image;
    int randomAt0To3 = arc4random()%3;
    switch (randomAt0To3) {
        case 0:
            image = [UIImage imageNamed:@"cat1.png"];
            break;
        case 1:
            image = [UIImage imageNamed:@"cat2.png"];
            break;
        case 2:
            image = [UIImage imageNamed:@"cat3.png"];
            break;
        default:
            break;
    }

    cell.imageView.image =image;

    CGFloat red,green,blue,alpha=0;
    NSString*numbersRGBColor=[[NSString alloc]init];
    UIColor*color = [self randomColor];
    if([color getRed:&red green:&green blue:&blue alpha:&alpha]){
        numbersRGBColor=[NSString stringWithFormat:@"red=%d  green=%d  blue=%d",(int)(red*255),(int)(green*255),(int)(blue*255)];
    }
    cell.backgroundColor=[color colorWithAlphaComponent:1] ;
    UIFont*font = [UIFont fontWithName:@"Arial" size:20];
    cell.textLabel.font = font;
    cell.textLabel.text = [NSString stringWithFormat:@"section - %lu row - %lu  RGB: %@",(unsigned long)[indexPath indexAtPosition:0],(unsigned long)[indexPath indexAtPosition:1],numbersRGBColor];
    cell.textLabel.backgroundColor = [UIColor greenColor];

    font = [UIFont fontWithName:@"Arial" size:15];
    cell.detailTextLabel.font = font;
    cell.detailTextLabel.text = stringForDetailTextLable;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.backgroundColor = [UIColor yellowColor];

    self.heightCell = cell.bounds.size.height;
    return cell;
}

@end
