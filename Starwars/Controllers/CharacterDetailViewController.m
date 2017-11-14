//
//  CharacterDetailViewController.m
//  starwars
//
//  Created by Amalia Gastelum on 11/12/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import "CharacterDetailViewController.h"

@interface CharacterDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hairColor;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *bornDate;
@property (weak, nonatomic) IBOutlet UILabel *mass;
@property (weak, nonatomic) IBOutlet UILabel *skinColor;
@property (weak, nonatomic) IBOutlet UILabel *eyeColor;
@property (weak, nonatomic) IBOutlet UILabel *homeWorld;
@property (weak, nonatomic) IBOutlet UILabel *films;
@property (weak, nonatomic) IBOutlet UILabel *species;
@property (weak, nonatomic) IBOutlet UILabel *vehicles;


@end

@implementation CharacterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.character != nil) {
        self.name.text = self.character.name;
        self.height.text = self.character.height;
        self.gender.text = self.character.gender;
        self.bornDate.text = self.character.birth_year;
        self.hairColor.text = self.character.hair_color;
        self.mass.text = self.character.mass	;
        self.skinColor.text = self.character.skin_color;
        self.eyeColor.text = self.character.eye_color;
        self.homeWorld.text = self.character.homeworld;
        self.films.text = [NSString stringWithFormat:@"%li",self.character.films.count];
        self.species.text = [NSString stringWithFormat:@"%li",self.character.species.count];
        self.vehicles.text = [NSString stringWithFormat:@"%li",self.character.vehicles.count];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
