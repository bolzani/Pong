//
//  GameViewController.m
//  Pong
//
//  Created by Felipe Alves on 22/05/17.
//  Copyright © 2017 Bolzaniapps. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    NSString *title = @"";
    
    switch (self.currentGameType) {
        case TwoPlayer:
            title = @"Dois Jogadores";
            break;
        case Easy:
            title = @"Fácil";
            break;
        case Medium:
            title = @"Médio";
            break;
        case Hard:
            title = @"Difícil";
            break;
        default:
            break;
    }
    self.navigationItem.title = title;
    
    // Load the SKScene from 'GameScene.sks'
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    scene.currentGameType = self.currentGameType;
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.size = self.view.bounds.size;
    
    SKView *skView = (SKView *)self.view;
    
    // Present the scene
    [skView presentScene:scene];
    
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
