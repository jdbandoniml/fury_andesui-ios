//
//  CoachmarkObjCViewController.m
//  AndesUI-demoapp
//
//  Created by JONATHAN DANIEL BANDONI on 01/09/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "CoachmarkObjCViewController.h"

@interface CoachmarkObjCViewController ()
@property (weak, nonatomic) IBOutlet UIView *upView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CoachmarkObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCoachmark];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.coachmark start];
}

- (void)setupCoachmark {
    AndesCoachMarkStepEntity *upStep = [[AndesCoachMarkStepEntity alloc] initWithTitle:@"Primer paso" description:@"Se dibuja la flecha arriba a la izquierda." view:_upView style:HighlightStyleRectangle nextText:@"Siguiente"];
    
    AndesCoachMarkStepEntity *leftStep = [[AndesCoachMarkStepEntity alloc] initWithTitle:@"Segundo paso" description:@"Se dibuja la flecha abajo a la izquierda." view:_leftView style:HighlightStyleRectangle nextText:@"Siguiente"];
    
    AndesCoachMarkStepEntity *rightStep = [[AndesCoachMarkStepEntity alloc] initWithTitle:@"Tercer paso" description:@"Se dibuja la flecha arriba a la derecha." view:_rightView style:HighlightStyleRectangle nextText:@"Siguiente"];
    
    AndesCoachMarkStepEntity *downStep = [[AndesCoachMarkStepEntity alloc] initWithTitle:@"Cuarto paso" description:@"Se dibuja la flecha abajo a la derecha." view:_downView style:HighlightStyleRectangle nextText:@"Siguiente"];
    
    AndesCoachMarkEntity *model = [[AndesCoachMarkEntity alloc] initWithSteps:@[upStep,leftStep,rightStep,downStep] scrollView:_scrollView completionHandler:NULL];
    
    self.coachmark = [[AndesCoachMarkView alloc] initWithModel:model];
}


@end
