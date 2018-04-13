//
//  TemparatureViewController.m
//  Assignment02
//
//  Created by Paruchuru, Lakshmikanth on 10/20/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import "TemparatureViewController.h"
#import "ConversionViewController.h"


@interface TemparatureViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation TemparatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      _Array = [[NSMutableArray alloc] initWithObjects:@"Fahrenheit to Celsius",@"Celsius to Fahrenheit",nil];
    
    NSUserDefaults *Defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *Temparature = [Defaults objectForKey:@"temparaturekey"];
    NSArray *recent;
    if([Temparature count] > 5){
        NSRange limit;
        limit.location = [Temparature count] - 5;
        limit.length = 5;
        recent = [Temparature subarrayWithRange:limit];
    }
    else{
        recent= Temparature;
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

//#pragma mark - Table view data source
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
    static NSString *CellIdentifier = @"temparaturecell";
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
        [self performSegueWithIdentifier:@"temparatureToconvert" sender:indexPath];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"temparatureToconvert"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        ConversionViewController *Conversion = (ConversionViewController*)segue.destinationViewController;
        Conversion.index = indexPath.row;
        Conversion.sectionIndex = indexPath.section;
        Conversion.segue = segue.identifier;
    }
}


@end
