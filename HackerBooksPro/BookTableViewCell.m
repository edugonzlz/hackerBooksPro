//
//  BookTableViewCell.m
//  HackerBooksPro
//
//  Created by Edu González on 20/9/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "BookTableViewCell.h"
#import "Book.h"
#import "Author.h"
#import "PhotoCover.h"

@interface BookTableViewCell ()

@property (strong, nonatomic)Book *book;

@end

@implementation BookTableViewCell

+(NSString *)cellId{
    return NSStringFromClass(self);
}

+(NSArray *)observableKeys{

    return @[@"photoCover.imageData"];
}

+(CGFloat)cellHeight{
    return 72.0f;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)observeBook:(Book *)book{

    self.book = book;

    for (NSString *key in [BookTableViewCell observableKeys]) {
        [self.book addObserver:self
                    forKeyPath:key
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
    }

    [self syncModelView];
}
-(void)prepareForReuse{
    for (NSString *key in [BookTableViewCell observableKeys]) {
        [self.book removeObserver:self
                       forKeyPath:key];
    }

    // Reseteamos la celda para que la usen de nuevo
    self.book = nil;
    [self syncModelView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{

    [self syncModelView];
}

-(void)syncModelView{

    self.titleLabel.text = self.book.title;
//    NSMutableArray *authors = [[NSMutableArray alloc]init];
//    for (Author *author in self.book.authors) {
//        [authors addObject:author.name];
//    }
//    self.subTitleLabel.text = [[authors valueForKey:@"description"] componentsJoinedByString:@", "];;

    UIImage *image;
    if (self.book.photoCover.image == nil) {
        image = [UIImage imageNamed:@"bookIcon.png"];
    }else{
        image = self.book.photoCover.image;
    }
    self.imageView.image = image;
}

@end
