//
//  CharactersViewController.m
//  starwars
//
//  Created by Amalia Gastelum on 11/12/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import "CharactersViewController.h"
#import "CharacterViewCell.h"
#import "SWObject.h"
#import "CharacterDetailViewController.h"

@interface CharactersViewController ()
@property (strong, nonatomic) NSMutableArray *characters;
@end

@implementation CharactersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.characters = [[NSMutableArray alloc]init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self getPeople];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CharacterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characterCell"];
    SWObject *current = [self.characters objectAtIndex:indexPath.row];
    cell.index.text = [NSString stringWithFormat:@"%li", indexPath.row + 1];
    cell.name.text = current.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"toDetail" sender:[self.characters objectAtIndex:indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toDetail"]) {
        CharacterDetailViewController *detail = [segue destinationViewController];
        detail.character = sender;
    }
}
- (IBAction)btnUpdate:(UIBarButtonItem *)sender {
    [self getPeople];
}

    //********************************************************************************************
#pragma mark                            Data methods
    //********************************************************************************************

- (void)getPeople{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPeople:^(NSMutableArray<SWObject> *peoples) {
        
        if(peoples){
            [self.characters removeAllObjects];
            [self.characters addObjectsFromArray:peoples];
            [self.tableView reloadData];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

@end
