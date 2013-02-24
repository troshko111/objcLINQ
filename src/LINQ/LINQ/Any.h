//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSObject (OLAny)

- (BOOL)any;
- (BOOL)anyMatches:(OLPredicate)predicate;

@end