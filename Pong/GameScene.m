//
//  GameScene.m
//  Pong
//
//  Created by Felipe Alves on 22/05/17.
//  Copyright © 2017 Bolzaniapps. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKSpriteNode *ball;
    SKSpriteNode *enemy;
    SKSpriteNode *main;
    SKLabelNode *topLabel;
    SKLabelNode *bottomLabel;
    int myScore;
    int enemyScore;
}


- (void)didMoveToView:(SKView *)view {
    ball = (SKSpriteNode*)[self childNodeWithName:@"ball"];
    enemy = (SKSpriteNode*)[self childNodeWithName:@"enemy"];
    main = (SKSpriteNode*)[self childNodeWithName:@"main"];
    topLabel = (SKLabelNode*)[self childNodeWithName:@"topLabel"];
    bottomLabel = (SKLabelNode*)[self childNodeWithName:@"bottomLabel"];
    SKPhysicsBody *border = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    border.friction = 0;
    border.restitution = 1;
    self.physicsBody = border;
    main.position = CGPointMake(0, -(self.frame.size.height/2)+50);
    enemy.position = CGPointMake(0, (self.frame.size.height/2)-50);
    if (self.currentGameType == TwoPlayer) {
        topLabel.zRotation = M_PI;
    }
    [self startGame];
}

- (void)startGame {
    myScore = 0;
    enemyScore = 0;
    bottomLabel.text = [NSString stringWithFormat:@"%d", myScore];
    bottomLabel.text = [NSString stringWithFormat:@"%d", enemyScore];
    [ball.physicsBody applyImpulse:CGVectorMake(10, 10)];
}

- (void)addScoreToPlayer:(SKSpriteNode*)player {
    
    ball.position = CGPointMake(0, 0);
    ball.physicsBody.velocity = CGVectorMake(0, 0);
    
    if (player == main) {
        myScore++;
        bottomLabel.text = [NSString stringWithFormat:@"%d", myScore];
        [ball.physicsBody applyImpulse:CGVectorMake(10, 10)];
    } else if (player == enemy) {
        enemyScore++;
        topLabel.text = [NSString stringWithFormat:@"%d", enemyScore];
        [ball.physicsBody applyImpulse:CGVectorMake(-10, -10)];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch * touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        if (self.currentGameType == TwoPlayer) {
            if (touchLocation.y > 0) {
                [enemy runAction:[SKAction moveToX:touchLocation.x duration:0.2]];
            }
            if (touchLocation.y < 0) {
                [main runAction:[SKAction moveToX:touchLocation.x duration:0.2]];
            }
        } else {
           [main runAction:[SKAction moveToX:touchLocation.x duration:0.2]];
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch * touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        if (self.currentGameType == TwoPlayer) {
            if (touchLocation.y > 0) {
                [enemy runAction:[SKAction moveToX:touchLocation.x duration:0.2]];
            }
            if (touchLocation.y < 0) {
                [main runAction:[SKAction moveToX:touchLocation.x duration:0.2]];
            }
        } else {
            [main runAction:[SKAction moveToX:touchLocation.x duration:0.2]];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    switch (self.currentGameType) {
        case Easy:
            [enemy runAction:[SKAction moveToX:ball.position.x duration:1.3]];
            break;
        case Medium:
            [enemy runAction:[SKAction moveToX:ball.position.x duration:1]];
            break;
        case Hard:
            [enemy runAction:[SKAction moveToX:ball.position.x duration:0.7]];
            break;
        case TwoPlayer:
            break;
    }
    
    if (ball.position.y <= -(self.frame.size.height/2)+ball.size.height) {
        [self addScoreToPlayer:enemy];
    } else if (ball.position.y >= (self.frame.size.height/2)-ball.size.height) {
        [self addScoreToPlayer:main];
    }
}

@end
