//
// All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLFuncs.h"

@interface OLBlockEnumerator : NSObject <NSFastEnumeration>

- (id)initWithBlock:(OLGenerator)next;

@end