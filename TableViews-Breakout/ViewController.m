//
//  ViewController.m
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "ViewController.h"
#import "Genre.h"
#import "Movie.h"
#import "MovieTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary<NSNumber*,Genre*> *genresById;
@property (strong, nonatomic) NSMutableDictionary<NSNumber*,NSMutableArray<Movie*>*> *moviesByGenreId;
@property (strong, nonatomic) NSMutableArray<Movie*> *movies;
@property (strong, nonatomic) NSMutableOrderedSet<NSNumber*> *genreIds;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.genresById = @{
      @1: [[Genre alloc]initWithId:@1 andName:@"Crime"],
      @2: [[Genre alloc]initWithId:@2 andName:@"Action"],
      @3: [[Genre alloc]initWithId:@3 andName:@"Comedy"],
      @4: [[Genre alloc]initWithId:@4 andName:@"Thriller"],
      @5: [[Genre alloc]initWithId:@5 andName:@"Drama"],
      @6: [[Genre alloc]initWithId:@6 andName:@"XXX"],
      @7: [[Genre alloc]initWithId:@7 andName:@"Horror"],
      @8: [[Genre alloc]initWithId:@8 andName:@"Animated"],
      @9: [[Genre alloc]initWithId:@9 andName:@"Family"]
      };
    
    
    self.movies = [NSMutableArray arrayWithObjects:
                   [[Movie alloc]initWithTitle:@"Fargo" andGenre:@1 andSynopsis:@"Self-made real estate mogul Emmit Stussy seemingly has it all -- a successful business, which has earned him the nickname \"Parking Lot King of Minnesota,\" and a perfect family. That doesn't sit well with slightly younger brother Ray, who has always lived in Emmit's shadow and blames his brother for the less-than-ideal hand he's been dealt as a balding, pot-bellied parole officer. Things appear to be on the upswing for Ray when Nikki, one of his parolees, offers to help turn his fortunes around by stealing back his good karma. The situation quickly gets out of hand, and petty theft leads to murder. When the ordeal crosses county lines, Eden Valley Police Chief Gloria Burgle investigates the case, which takes an unexpectedly personal turn for her. Meanwhile, Emmit gets an unwelcome business proposal from mysterious loner V.M., whose bosses plan to partner with Emmit whether he wants to or not. Golden Globe-nominated actor Ewan McGregor stars in a dual role as Emmit and Ray." andCover:[UIImage imageNamed:@"fargo"]],
                   [[Movie alloc]initWithTitle:@"Rush Hour" andGenre:@3 andSynopsis:@"Jackie Chan and Chris Tucker do stupid stuff" andCover:[UIImage imageNamed:@"rushhour"]],
                   [[Movie alloc]initWithTitle:@"Fast and Furious" andGenre:@2 andSynopsis:@"Vin Diesel races cars" andCover:[UIImage imageNamed:@"fastfurious"]], nil];
    
    self.genreIds = [[NSMutableOrderedSet alloc]init];
    self.moviesByGenreId = [[NSMutableDictionary alloc]init];
    for (Movie *movie in self.movies) {
        if ([self.moviesByGenreId objectForKey:movie.genreId] == nil) {
            [self.moviesByGenreId setObject:[NSMutableArray arrayWithObjects:movie, nil] forKey:movie.genreId];
        } else {
            [[self.moviesByGenreId objectForKey:movie.genreId] addObject:movie];
        }
        [self.genreIds addObject:movie.genreId];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.moviesByGenreId.allKeys.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSNumber *genreId = [self.genreIds objectAtIndex:section];
    Genre *genre = self.genresById[genreId];
    return genre.name;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSNumber *genreId = self.genreIds[section];
    NSMutableArray *movies = [self.moviesByGenreId objectForKey:genreId];
    return movies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *genreId = self.genreIds[indexPath.section];
    NSArray<Movie*> *movies = self.moviesByGenreId[genreId];
    Movie *movie = movies[indexPath.row];
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieTableViewCell" forIndexPath:indexPath];
    cell.movie = movie;
    [cell updateInfo];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *genreId = self.genreIds[indexPath.section];
    NSArray<Movie*> *movies = self.moviesByGenreId[genreId];
    Movie *movie = movies[indexPath.row];
    [self performSegueWithIdentifier:@"GoToDetailViewController" sender:movie];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"GoToDetailViewController"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.movie = sender;
    }
}

@end
