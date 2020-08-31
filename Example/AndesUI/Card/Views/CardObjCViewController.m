//
//  CardObjCViewController.m
//  AndesUI-demoapp
//
//  Created by Martin Victory on 22/07/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "CardObjCViewController.h"
#import <AndesUI-Swift.h>

@interface CardObjCViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation CardObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    __weak typeof(self) weakSelf = self;
    
    self.stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    // Basic card without any title
    AndesCard *card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                                    title: nil
                                                  padding:AndesCardPaddingSmall
                                                hierarchy:AndesCardHierarchyPrimary
                                                    style:AndesCardStyleElevated
                                                     type:AndesCardTypeNone];
   [self.stackView addArrangedSubview:card];
    
    // Basic card with button
     card = [[AndesCard alloc] initWithCardView: [self buildCardViewWithButton]
                                          title: nil
                                        padding:AndesCardPaddingSmall
                                      hierarchy:AndesCardHierarchyPrimary
                                          style:AndesCardStyleElevated
                                           type:AndesCardTypeNone];
    [self.stackView addArrangedSubview:card];

    // Card with title
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: @"Title here!"
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeNone];
    [card setCardActionWithHandler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Card"];
    }];
    [self.stackView addArrangedSubview:card];
    
    // Card with link
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: nil
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeNone];
    [card setLinkAction:@"Link" handler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Link"];
    }];
    [self.stackView addArrangedSubview:card];
    
    // Card with title and link
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: @"Title here!"
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeNone];
    [card setLinkAction:@"Link" handler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Link"];
    }];
    [card setCardActionWithHandler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Card"];
    }];
    [self.stackView addArrangedSubview:card];
    
    // Card with style outline
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: @"Title here!"
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleOutline
                                          type:AndesCardTypeNone];
    [self.stackView addArrangedSubview:card];
    
    // Card with padding large
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: nil
                                       padding:AndesCardPaddingLarge
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeNone];
    [self.stackView addArrangedSubview:card];
    
    // Card with hierarchy secondary
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: @"Some title"
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchySecondary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeNone];
    [card setCardActionWithHandler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Card"];
    }];
    [self.stackView addArrangedSubview:card];
    
    // Card with hierarchy secondary and type success
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: nil
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchySecondary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeSuccess];
    [card setCardActionWithHandler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Card"];
    }];
    [self.stackView addArrangedSubview:card];
    
    // Card with type highlight
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: nil
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleElevated
                                          type:AndesCardTypeHighlight];
    [card setCardActionWithHandler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Card"];
    }];
    [self.stackView addArrangedSubview:card];
    
    // Card with style outline and type error
    card = [[AndesCard alloc] initWithCardView: [self buildCardView]
                                         title: @"Title here!"
                                       padding:AndesCardPaddingSmall
                                     hierarchy:AndesCardHierarchyPrimary
                                         style:AndesCardStyleOutline
                                          type:AndesCardTypeError];
    [card setCardActionWithHandler: ^(AndesCard *andesCard) {
        [weakSelf handleActionTap:andesCard actionType: @"Card"];
    }];
    [self.stackView addArrangedSubview:card];
}

- (UIView *)buildCardView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"item-example" inBundle:nil compatibleWithTraitCollection:nil]];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *constraints = @[
        [imageView.heightAnchor constraintEqualToConstant:80],
        [imageView.widthAnchor constraintEqualToConstant:80],
    ];
    [NSLayoutConstraint activateConstraints: constraints];
    
    imageView.layer.cornerRadius = 40;
    imageView.clipsToBounds = YES;
    
    UILabel *textLbl = [[UILabel alloc] init];
    textLbl.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    textLbl.numberOfLines = 0;
    
    AndesFontStyle * font = [[AndesFontStyle alloc] initWithTextColor:AndesStyleSheetManager.styleSheet.textColorPrimary
                                                                 font:[AndesStyleSheetManager.styleSheet regularSystemFontWithSize:16]
                                                          lineSpacing:1];
    [textLbl setAndesStyleWithStyle:font];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[imageView, textLbl]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 30;
    stackView.alignment = UIStackViewAlignmentTop;
    
    return stackView;
}

- (UIView *)buildCardViewWithButton {
    UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"item-example" inBundle:nil compatibleWithTraitCollection:nil]];
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    
    NSArray *constraints = @[
        [imageView.heightAnchor constraintEqualToConstant:80],
        [imageView.widthAnchor constraintEqualToConstant:80],
    ];
    [NSLayoutConstraint activateConstraints: constraints];
    
    imageView.layer.cornerRadius = 40;
    imageView.clipsToBounds = YES;
    
    UILabel *textLbl = [[UILabel alloc] init];
    textLbl.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    textLbl.numberOfLines = 0;
    
    AndesFontStyle * font = [[AndesFontStyle alloc] initWithTextColor:AndesStyleSheetManager.styleSheet.textColorPrimary
                                                                 font:[AndesStyleSheetManager.styleSheet regularSystemFontWithSize:16]
                                                          lineSpacing:1];
    [textLbl setAndesStyleWithStyle:font];
    
    AndesButton *button = [[AndesButton alloc] initWithText:@"Button" hierarchy:AndesButtonHierarchyLoud size:AndesButtonSizeMedium icon:nil];
    [button addTarget:self action:@selector(cardButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIStackView *verticalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[textLbl, button]];
    verticalStackView.axis = UILayoutConstraintAxisVertical;
    verticalStackView.spacing = 10;
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[imageView, verticalStackView]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 30;
    stackView.alignment = UIStackViewAlignmentTop;
    
    return stackView;
}

- (void)cardButtonTapped {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"Button pressed"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)handleActionTap:(AndesCard*)card actionType:(NSString *)actionType {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle: [actionType stringByAppendingString:@" action pressed"]
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
