//
//  ViewController.m
//  DemoShareExtension
//
//  Created by Nguyen Ha Giang on 3/30/16.
//  Copyright © 2016 Nguyen Ha Giang. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
static NSString *const AppGroupId = @"group.tag.shareapp";

@interface ViewController ()
{
    NSMutableArray *arrSites;
    NSUserDefaults *sharedUserDefaults;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:AppGroupId];
    arrSites = [NSMutableArray arrayWithArray:[sharedUserDefaults valueForKey:@"SharedExtension"]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSites.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.lblSite.text = [[arrSites objectAtIndex:indexPath.row] valueForKey:@"URL"];
    cell.lblContent.text = [[arrSites objectAtIndex:indexPath.row] valueForKey:@"Text"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[arrSites objectAtIndex:indexPath.row] valueForKey:@"URL"]]];
}
@end
