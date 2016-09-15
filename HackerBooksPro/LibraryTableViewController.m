//
//  LibraryTableViewController.m
//  HackerBooksPro
//
//  Created by Edu González on 13/9/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "LibraryTableViewController.h"
#import "Book.h"
#import "PhotoCover.h"
#import "Tag.h"
#import "BookViewController.h"

@implementation LibraryTableViewController

-(id)initWithContext:(NSManagedObjectContext *)context{

    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[Book entityName]];

    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BookAttributes.title ascending:YES]];

    NSFetchedResultsController *fr = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:context
                                                                           sectionNameKeyPath:@"tagsString"
                                                                                    cacheName:nil];

    if (self = [super initWithFetchedResultsController:fr
                                                style:UITableViewStylePlain]) {
        self.fetchedResultsController = fr;
        self.context = context;
    }

    return self;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellId = @"bookCell";
    //book
    Book *book = [self.fetchedResultsController objectAtIndexPath:indexPath];

    //celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
    }

    cell.textLabel.text = book.title;
    cell.imageView.image = book.photoCover.image;
    cell.detailTextLabel.text = book.tagsString;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Book *book = [self.fetchedResultsController objectAtIndexPath:indexPath];

    BookViewController *bVC = [[BookViewController alloc]initWithModel:book];

    [self saveLastBookSelected: book];

    [self.navigationController pushViewController:bVC animated:true];
}

-(void)saveLastBookSelected:(Book *)book{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSURL *bookId = [book.objectID URIRepresentation];
    [defaults setURL:bookId forKey:@"lastSelectedBook"];

    [defaults synchronize];
}

-(Book *)lastSelectedBook{

    // TODO: - que hacer cuando aun no se ha guardado ningun ultimo seleccionado
    // En el caso de que usemos un splitView en un ipad, cargar el ultimo book en la vista de detalle
    NSURL *bookId = [[NSUserDefaults standardUserDefaults]URLForKey:@"lastSelectedBook"];

    NSManagedObjectID *id = [self.context.persistentStoreCoordinator managedObjectIDForURIRepresentation:bookId];

    NSError *error;
    Book *book = [self.context existingObjectWithID:id
                                              error:&error];

    return book;
}

@end
