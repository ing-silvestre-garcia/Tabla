//
//  NewPersonViewController.h
//  Tabla1
//
//  Created by Silvestre Garcia on 9/25/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewPersonDelegate <NSObject>
- (void)didAddPersonName:(NSString *)name andImageSelected:(UIImage *)image addPersonAge:(NSString *)age;
@end

@interface NewPersonViewController : UIViewController
@property (nonatomic, weak) id <NewPersonDelegate> delegate;

@end
