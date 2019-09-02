//
//  AVTableViewHeaderFooterView.m
//  lesson30 - UITableView-DinamicCells
//
//  Created by Anatoly Ryavkin on 28/05/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVTableViewHeaderFooterView.h"

@implementation AVTableViewHeaderFooterView

-(id)init{
    self = [super init];
        if(self){
            /*self.image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bk.png"]];
            self.lable = [[UILabel alloc]init];
            self.lable.backgroundColor = [UIColor redColor];
            self.lable.textColor = [UIColor greenColor];
            self.lable.text = @"0";
            self.image.frame = CGRectMake(0, 0, 50, 50);
            self.lable.frame = CGRectMake(100, 0, 300, 50);
            [self.contentView addSubview:self.image];
            [self.contentView addSubview:self.lable];
             */
        }
    return self;
}


#pragma mark - HEADER custom, need register child at UITableViewHeader... for UITableView!!!!!!!!!!!!!!

-(instancetype)initWithImage:(UIImage*) image andTitle:(NSString*) text{

    if(self.contentView.subviews.count>=2){
        [[self.contentView.subviews objectAtIndex:0] removeFromSuperview];
        [[self.contentView.subviews objectAtIndex:0] removeFromSuperview];
        NSLog(@"%@",self.subviews);
    }

        self.image = [[UIImageView alloc]initWithImage:image];
        self.lable = [[UILabel alloc]init];
        self.lable.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.5];
        self.lable.textColor = [UIColor greenColor];
        self.lable.text = text;
        self.image.frame = CGRectMake(0, 0, 100, 100);
        self.lable.frame = CGRectMake(100, 0, 300, 100);
        self.contentView.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.5];

        [self.contentView addSubview:self.image];
        [self.contentView addSubview:self.lable];
    return self;
}

@end
