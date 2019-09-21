//
//  slovo.h
//  Neda
//
//  Created by Valeriy Petrenko on 08/03/09.

//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface slovo : NSObject {
	// Opaque reference to the underlying database.
    sqlite3 *database;

    // Primary key in the database.
    NSInteger primaryKey;
    // Attributes.
    NSString *title;
    NSString *copyright;
    NSString *author;
    // Internal state variables. Hydrated tracks whether attribute data is in the object or the database.
    BOOL hydrated;
    // Dirty tracks whether there are in-memory changes to data which have no been written to the database.
    BOOL dirty;
    NSData *data;
	
}

// Property exposure for primary key and other attributes. The primary key is 'assign' because it is not an object, 
// nonatomic because there is no need for concurrent access, and readonly because it cannot be changed without 
// corrupting the database.
@property (assign, nonatomic, readonly) NSInteger primaryKey;
// The remaining attributes are copied rather than retained because they are value objects.
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *copyright;
@property (copy, nonatomic) NSString *author;

// Finalize (delete) all of the SQLite compiled queries.
+ (void)finalizeStatements;
// Creates the object with primary key and title is brought into memory.
- (id)initWithPrimaryKey:(NSInteger)pk database:(sqlite3 *)db;
// Inserts the data into the database and stores its primary key.


// Brings the rest of the object data into memory. If already in memory, no action is taken (harmless no-op).
- (void)hydrate;
// Flushes all but the primary key and title out to the database.
- (void)dehydrate;
// Remove the data complete from the database. In memory deletion to follow...
- (void)deleteFromDatabase;

@end

