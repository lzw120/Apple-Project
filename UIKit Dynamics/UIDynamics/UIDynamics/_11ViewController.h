//
//  _11ViewController.h
//  UIDynamics
//
//  Created by zewenli on 1/9/14.
//  Copyright (c) 2014 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _11ViewController : UIViewController <UICollisionBehaviorDelegate>

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id)item
   withBoundaryIdentifier:(id)identifier atPoint:(CGPoint)p ;

- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p;

@end
