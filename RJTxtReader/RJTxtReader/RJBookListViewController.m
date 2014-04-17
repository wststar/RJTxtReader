//
//  RJBookListViewController.m
//  RJTxtReader
//
//  Created by joey on 12-8-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RJBookListViewController.h"
#import "KDBooKViewController.h"


@interface RJBookListViewController ()

@end

@implementation RJBookListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"书架";
    
    bookData = [RJBookData sharedRJBookData];
    books = bookData.books;
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}



/**
 * 当用ios7的虚拟机显示的时候会出现UINavigationItem遮挡TableView的问题
 */

-(void) readBook:(NSInteger)i
{
    KDBooKViewController *bookVC = [[[KDBooKViewController alloc]init]autorelease];
	bookVC.bookIndex = i;
	[self.navigationController pushViewController:bookVC animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [books count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier: SimpleTableIdentifier] autorelease];
    }
    RJSingleBook* singleBook = [bookData.books objectAtIndex:indexPath.row];
    
    [cell.imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:singleBook.icon ofType:nil]]];
    cell.textLabel.text =singleBook.name;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//选择事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self readBook:indexPath.row];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
