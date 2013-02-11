//
// All rights reserved.
//


#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface NSArray(SelectMany)
-(id<NSFastEnumeration>) selectMany:(OLManySelector)selector;
@end