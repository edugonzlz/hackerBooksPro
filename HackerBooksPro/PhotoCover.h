#import "_PhotoCover.h"
#import <UIKit/UIKit.h>

@interface PhotoCover : _PhotoCover

@property (nonatomic, strong) UIImage *image;

+(instancetype)photoCoverWithURL:(NSString *)photoCoverURL inContext:(NSManagedObjectContext *)context;

@end
