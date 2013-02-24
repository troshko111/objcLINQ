//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSObject (OLSelectMany)

- (id <NSFastEnumeration>)selectMany:(OLManySelector)selector;
- (id <NSFastEnumeration>)selectManyIndexed:(OLManySelectorWithIndex)selector;

- (id <NSFastEnumeration>)selectMany:(OLManySelector)selector reducer:(OLReducer)reducer;
- (id <NSFastEnumeration>)selectManyIndexed:(OLManySelectorWithIndex)selector reducer:(OLReducer)reducer;

@end