//
//  MassViewController.m
//  Assignment02
//
//  Created by Paruchuru, Lakshmikanth on 10/20/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import "MassViewController.h"
#import "ConversionViewController.h"

@interface MassViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation MassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      _Array = [[NSMutableArray alloc] initWithObjects:@"Kilograms to Pounds",@"Pounds to Kilograms",@"Ounce to Grams",@"Grams to Ounce" ,nil];
    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *Mass = [Defaults objectForKey:@"masskey"];
    NSArray *recent;
    if([Mass count] > 5){
        NSRange limit;
        limit.location = [Mass count] - 5;
        limit.length = 5;
        recent = [Mass subarrayWithRange:limit];
    }
    else{
        recent=Mass;
    }
    _recentArray = recent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated{
    self.viewDidLoad;
    [self.tableView reloadData];
}
//#warning Incomplete implementation, return the number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0)
    {
        return [_Array count];
    }
    else{
        return [_recentArray count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Conversions";
    else
        return @"History";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"masscell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(indexPath.section == 0){
        cell.textLabel.text =[_Array objectAtIndex:indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    else{
        cell.textLabel.text =[_recentArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        [self performSegueWithIdentifier:@"massToconvert" sender:indexPath];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"massToconvert"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        ConversionViewController *Conversion = (ConversionViewController*)segue.destinationViewController;
        Conversion.index = indexPath.row;
        Conversion.sectionIndex = indexPath.section;
        Conversion.segue = segue.identifier;
    }
}


@end
