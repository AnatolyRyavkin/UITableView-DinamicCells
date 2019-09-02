//
//  AVTableViewHeaderFooterView.h
//  lesson30 - UITableView-DinamicCells
//
//  Created by Anatoly Ryavkin on 28/05/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVTableViewHeaderFooterView : UITableViewHeaderFooterView

@property UILabel * lable;
@property UIImageView*  image;
-(instancetype)initWithImage:(UIImage*) image andTitle:(NSString*) text;
@end

NS_ASSUME_NONNULL_END
