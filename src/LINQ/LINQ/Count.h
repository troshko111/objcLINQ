//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSArray(Count)
-(NSUInteger) count;
-(NSUInteger) countPassingTest:(OLPredicate)predicate;
@end