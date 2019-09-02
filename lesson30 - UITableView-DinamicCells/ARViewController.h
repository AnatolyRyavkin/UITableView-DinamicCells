//
//  ARViewController.h
//  lesson30 - UITableView-DinamicCells
//
//  Created by Anatoly Ryavkin on 26/05/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVTableViewHeaderFooterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ARViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak) IBOutlet UITableView*table;
@property BOOL flagFirstRotation;
@property CGFloat heightCell;




@end

NS_ASSUME_NONNULL_END
