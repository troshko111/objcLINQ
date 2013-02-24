//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSObject (OLSelect)

- (id <NSFastEnumeration>)select:(OLSelector)selector;
- (id <NSFastEnumeration>)selectIndexed:(OLSelectorWithIndex)selector;

@end