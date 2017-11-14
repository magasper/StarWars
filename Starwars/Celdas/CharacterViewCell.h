//
//  CharacterViewCell.h
//  starwars
//
//  Created by Amalia Gastelum on 11/12/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterViewCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UILabel *index;
    @property (weak, nonatomic) IBOutlet UILabel *name;
    
@end
