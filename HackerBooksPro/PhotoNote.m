#import "PhotoNote.h"
#import "Note.h"

@interface PhotoNote ()

// Private interface goes here.

@end

@implementation PhotoNote

-(void)setImage:(UIImage *)image{

    // lo pasamos a segundo plano porque tarda bastante tiempo
    // aunque hemos redimensionado la imagen en el PickerVC y viene con menos resolucion
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        self.imageData = UIImagePNGRepresentation(image);
    });

}
-(UIImage *)image{

    return [UIImage imageWithData:self.imageData];
}

+(instancetype)photoNoteForNote:(Note *)note{

    PhotoNote *photo = [NSEntityDescription insertNewObjectForEntityForName:[PhotoNote entityName]
                                                     inManagedObjectContext:note.managedObjectContext];

    return photo;
}

+(instancetype)photoNoteForNote:(Note *)note withImage:(UIImage *)image{

    PhotoNote *photo = [PhotoNote photoNoteForNote:note];

    photo.imageData = UIImagePNGRepresentation(image);

    return photo;
}

@end
