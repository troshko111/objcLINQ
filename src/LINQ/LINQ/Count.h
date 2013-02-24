//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSObject (OLCount)

- (NSUInteger)count;
- (NSUInteger)countMatchingPredicate:(OLPredicate)predicate;

@end