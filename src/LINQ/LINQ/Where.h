#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSObject (OLWhere)

- (id <NSFastEnumeration>)where:(OLPredicate)predicate;
- (id <NSFastEnumeration>)whereIndexed:(OLPredicateWithIndex)predicate;

@end