//
//  ConversionViewController.m
//  Assignment02
//
//  Created by Paruchuru, Lakshmikanth on 10/20/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import "ConversionViewController.h"

@interface ConversionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ValueTextField;
@property (weak, nonatomic) IBOutlet UILabel *ConvertedLabel;
@end

@implementation ConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ValueTextField.delegate= self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear{
    [_ValueTextField becomeFirstResponder];
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [_ValueTextField resignFirstResponder];
    return true;
}

- (IBAction)Convert:(id)sender {
    self.Inputvalue = _ValueTextField.text;
    double input = [_Inputvalue doubleValue];
    double output=0;
    NSString *i;
    NSString *o;
    
    if(_sectionIndex == 0){
        if([_segue isEqualToString:@"lengthToconvert"])
        {
            if(_index == 0){
                
                output = input * 0.621371;
                i = @"Kilometers";
                o = @"Miles";
            }
            else if (_index == 1){
                output = input * 1.60934;
                i = @"Miles";
                o = @"Kilometers";}
            else if (_index == 2){
                output = input * 3;
                i = @"Yard";
                o = @"Feets";}
            else if (_index == 3){
                output = input * 0.33333;
                i = @"Feets";
                o = @"Yards";}
            else if (_index == 4){
                output = input * 2.54;
                i = @"Inches";
                o = @"Centimeters";}
            else{
                output = input * 0.3937;
                i = @"Centimeters";
                o = @"Inches";}

        }
        if([_segue isEqualToString:@"liquidToconvert"])
        {
            if(_index == 0){
                output = input * 0.264172;
                i = @"Liters";
                o = @"Gallons";}
            else if (_index == 1){
                output = input * 3.78541;
                i = @"Gallons";
                o = @"Liters";}
            else if (_index == 2){
                output = input * 0.125;
                i = @"Pints";
                o = @"Gallons";}
            else if (_index == 3){
                output = input * 9.60762;
                i = @"Gallons";
                o = @"Pints";}
            else if (_index == 4){
                output = input * 0.20817;
                i = @"Quarts";
                o = @"Gallons";}
            else{
                output = input * 4.80381;
                i = @"Gallons";
                o = @"Quarts";}
        }
        if([_segue isEqualToString:@"temparatureToconvert"])
        {
            if(_index == 0){
                output = (input - 32)*0.5555;
                
                i = @"Fahrenheit";
                o = @"Celsius";}
            else{
                
                output = (input * 1.8) + 32;
                i = @"Celsius";
                o = @"Fahrenheit";}
        }
        if([_segue isEqualToString:@"massToconvert" ])
        {
            if(_index == 0){
                output = input * 2.20462;
                i = @"Kilograms";
                o = @"Pounds";}
            else if (_index == 1){
                output = input * 0.453592;
                i = @"Pounds";
                o = @"Kilograms";}
            else if (_index == 2){
                output = input * 28.3495;
                i = @"Ounce";
                o = @"Grams";}
            else{
                output = input * 0.035274;
                i = @"Grams";
                o = @"Ounce";}
       
        }
    
        NSString *stringValue = [NSString stringWithFormat:@"%lf %@", output,o];
        _ConvertedLabel.text = stringValue;
        NSString *saveValue = [NSString stringWithFormat:@"%lf %@ = %lf %@",input,i,output,o];
     
        if([_segue isEqualToString:@"lengthToconvert" ]){
            NSUserDefaults *lengthDefaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *savedLengthArray = [[lengthDefaults objectForKey:@"lengthkey"] mutableCopy];
            if(savedLengthArray.count == 0){
                savedLengthArray = [[NSMutableArray alloc ] init];}
            [savedLengthArray addObject:saveValue];
            [lengthDefaults setObject:savedLengthArray forKey:@"lengthkey"];
        }
        else if ([_segue isEqualToString:@"liquidToconvert" ]){
            NSUserDefaults *liquidDefaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *savedLiquidArray = [[liquidDefaults objectForKey:@"liquidkey"] mutableCopy];
            if(savedLiquidArray.count == 0){
                savedLiquidArray = [[NSMutableArray alloc ] init];}
            [savedLiquidArray addObject:saveValue];
            [liquidDefaults setObject:savedLiquidArray forKey:@"liquidkey"];
        }
        else if ([_segue isEqualToString:@"temparatureToconvert" ]){
            NSUserDefaults *temparatureDefaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *savedTemparatureArray = [[temparatureDefaults objectForKey:@"temparaturekey"] mutableCopy];
            if(savedTemparatureArray.count == 0){
                savedTemparatureArray = [[NSMutableArray alloc ] init];}
            [savedTemparatureArray addObject:saveValue];
            [temparatureDefaults setObject:savedTemparatureArray forKey:@"temparaturekey"];
        }
        else {
            NSUserDefaults *massDefaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *savedMassArray = [[massDefaults objectForKey:@"masskey"] mutableCopy];
            if(savedMassArray.count == 0){
                savedMassArray = [[NSMutableArray alloc ] init];}
            [savedMassArray addObject:saveValue];
            [massDefaults setObject:savedMassArray forKey:@"masskey"];
        }
    }
}

@end
