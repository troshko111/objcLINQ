//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSArray(Select)

-(id<NSFastEnumeration>)select:(OLSelector)selector;
-(id<NSFastEnumeration>)selectIndexed:(OLSelectorWithIndex)selector;

@end