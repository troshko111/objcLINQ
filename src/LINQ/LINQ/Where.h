//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Funcs.h"

@interface NSArray(LINQ)

-(id<NSFastEnumeration>)where:(OLPredicate)predicate;

@end