//
//  DetailPersonViewController.m
//  Tabla1
//
//  Created by Silvestre Garcia on 9/26/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "DetailPersonViewController.h"

@interface DetailPersonViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;

@property (weak, nonatomic) IBOutlet UILabel *lblDetailName;
@property (weak, nonatomic) IBOutlet UILabel *lblDetailAge;
@property (weak, nonatomic) IBOutlet UILabel *lblDetailDescription;
@end

@implementation DetailPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailImage.image=self.personInfo[@"image"];
    self.lblDetailAge.text=self.personInfo[@"age"];
    self.lblDetailName.text=self.personInfo[@"name"];
    self.lblDetailDescription.text=self.personInfo[@"description"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
