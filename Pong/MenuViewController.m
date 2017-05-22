//
//  MenuViewController.m
//  Pong
//
//  Created by Felipe Alves on 22/05/17.
//  Copyright © 2017 Bolzaniapps. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GameViewController *gameVC = (GameViewController*)[segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"segueTwoPlayers"]) {
        gameVC.currentGameType = TwoPlayer;
    } else if ([segue.identifier isEqualToString:@"segueEasy"]) {
        gameVC.currentGameType = Easy;
    } else if ([segue.identifier isEqualToString:@"segueMedium"]) {
        gameVC.currentGameType = Medium;
    } else if ([segue.identifier isEqualToString:@"segueHard"]) {
        gameVC.currentGameType = Hard;
    }
}

@end
