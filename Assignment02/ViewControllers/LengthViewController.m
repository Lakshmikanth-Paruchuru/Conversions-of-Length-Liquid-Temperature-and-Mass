//
//  LengthViewController.m
//  Assignment02
//
//  Created by Paruchuru, Lakshmikanth on 10/20/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//



#import "ConversionViewController.h"
#import "LengthViewController.h"

@interface LengthViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation LengthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Array = [[NSMutableArray alloc] initWithObjects:@"Kilometeres to Miles",@"Miles to Kilometers",@"Yard to Feet",@"Feet to Yard",@"Inches to Centimeters",@"Centimeters to Inches" ,nil];
    
    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *Length = [Defaults objectForKey:@"lengthkey"];
    NSArray *recent;
    if([Length count] > 5){
        NSRange limit;
        limit.location = [Length count] - 5;
        limit.length = 5;
        recent = [Length subarrayWithRange:limit];
    }
    else{
        recent=Length;
    }
    _recentArray = recent;
    
}
-(void) viewWillAppear:(BOOL)animated{
    self.viewDidLoad;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

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
        return @"Conversions ";
    else
        return @"History";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"lengthcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

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
    if(indexPath.section == 0)
    {
        [self performSegueWithIdentifier:@"lengthToconvert" sender:indexPath];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"lengthToconvert"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        ConversionViewController *Conversion = (ConversionViewController*)segue.destinationViewController;
        Conversion.index = indexPath.row;
        Conversion.sectionIndex = indexPath.section;
        Conversion.segue = segue.identifier;
    }
}

@end

