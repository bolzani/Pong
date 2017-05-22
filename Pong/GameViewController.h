//
//  GameViewController.h
//  Pong
//
//  Created by Felipe Alves on 22/05/17.
//  Copyright © 2017 Bolzaniapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "MenuViewController.h"

@interface GameViewController : UIViewController
@property (nonatomic, assign) GameType currentGameType;
@end
