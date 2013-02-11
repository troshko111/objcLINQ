#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSArray(Where)

-(id<NSFastEnumeration>)where:(OLPredicate)predicate;
-(id<NSFastEnumeration>)whereIndexed:(OLPredicateWithIndex)predicate;

@end