#import "_Pdf.h"

@interface Pdf : _Pdf

@property (nonatomic, strong) NSData *pdf;

+(instancetype)pdfWithURL:(NSString *)pdfURL inContext:(NSManagedObjectContext *)context;

@end
