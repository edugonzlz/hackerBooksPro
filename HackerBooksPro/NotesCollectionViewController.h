//
//  NotesCollectionViewController.h
//  HackerBooksPro
//
//  Created by Edu González on 14/9/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "AGTCoreDataCollectionViewController.h"
@class Book;

@interface NotesCollectionViewController : AGTCoreDataCollectionViewController

@property (nonatomic, strong) Book *book;

@property (nonatomic, strong) NSManagedObjectContext *context;

-(id)initWithBook:(Book *)book inContext:(NSManagedObjectContext *)context;

@end
