//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSArray(Where)

-(id<NSFastEnumeration>)where:(OLPredicate)predicate;

@end