//
//  MovieDetailViewController.m
//  rottenTomatoesDemo
//
//  Created by Raylene Yung on 10/13/14.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = self.movieData[@"title"];
    self.synopsisLabel.text = self.movieData[@"synopsis"];
    
    // Low-res url
    NSString *thumbnailPosterUrl = [self.movieData valueForKeyPath:@"posters.thumbnail"];
    // Get high-res image url hack
    NSString *highResPosterUrl = [thumbnailPosterUrl stringByReplacingOccurrencesOfString:@"tmb"
                                         withString:@"ori"];
    
    // Question -- is it better to only kick off loading the high-res image after the thumbnail req
    // finishes? How are these requests related, given docs say: "Any previous image request for the
    // receiver will be cancelled."
    [self.posterImageView setImageWithURL:[NSURL URLWithString:thumbnailPosterUrl]];
    [self.posterImageView setImageWithURL:[NSURL URLWithString:highResPosterUrl]];
    
    self.scrollView.contentSize = CGSizeMake(320, 1000);
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
