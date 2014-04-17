//
//  RJBookListViewController.h
//  RJTxtReader
//
//  Created by joey on 12-8-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJBookData.h"

@interface RJBookListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    RJBookData* bookData;
    NSArray * books ;
}

@property(nonatomic,retain) UITableView * tableView;

@end
