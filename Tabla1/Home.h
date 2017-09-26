//
//  ViewController.h
//  Tabla1
//
//  Created by Silvestre Garcia on 9/20/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tablePrincipal;
- (IBAction)btnAddPressed:(id)sender;

@end

