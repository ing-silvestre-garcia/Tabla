//
//  ViewController.m
//  Tabla1
//
//  Created by Silvestre Garcia on 9/20/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"
#import "NewPersonViewController.h"

@interface Home () <NewPersonDelegate>

@property NSMutableArray *characters;
@property NSDictionary *charactersInfo;
@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.characters = [[NSMutableArray alloc] init];
    [self.characters addObject:@{
                                 @"name":@"Tyrion Lanniester",
                                 @"age":@"38 anios",
                                 @"image":[UIImage imageNamed:@"tyrion.jpg"],
                                 @"description":@"Descripcion Tyrion Lanniester"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Danerys Targaryen",
                                 @"age":@"22 anios",
                                 @"image":[UIImage imageNamed:@"danerys.jpg"],
                                 @"description":@"Descripcion Danerys"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Jon Snow",
                                 @"age":@"25 anios",
                                 @"image":[UIImage imageNamed:@"jon.jpg"],
                                 @"description":@"Descripcion Jon Snow"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Arya Stark",
                                 @"age":@"16 anios",
                                 @"image":[UIImage imageNamed:@"arya.jpg"],
                                 @"description":@"Descripcion Arya"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Cersei Lanniser",
                                 @"age":@"42 anios",
                                 @"image":[UIImage imageNamed:@"cersei.jpg"],
                                 @"description":@"Descripcion Cersei"
                                 }];

}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    NSDictionary *posicionDictionary = self.characters[indexPath.row];
    cell.userName.text       = posicionDictionary[@"name"];
    cell.userAge.text        = posicionDictionary[@"age"];
    cell.userImage.image      = posicionDictionary[@"image"];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Pending
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddPressed:(id)sender {
    /**
     [self.userNames addObject:@"Walter"];
     [self.userAges addObject:@"37 años"];
     [self.userImages addObject:@"jon.jpg"];
     [self.tblMain reloadData];
     */
    [self performSegueWithIdentifier:@"toNewPerson" sender:nil];
}

#pragma mark - NewPersonDelegate
- (void)didAddPersonName:(NSString *)name andImageSelected:(UIImage *)image addPersonAge:(NSString *)age {
    [self.characters addObject:@{
                                 @"name":name,
                                 @"age":age,
                                 @"image":image
                                 }];
    [self.tablePrincipal reloadData];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toNewPerson"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        NewPersonViewController *personVC = [[navigationController viewControllers]firstObject];
        personVC.delegate = self;
    }
}


@end
