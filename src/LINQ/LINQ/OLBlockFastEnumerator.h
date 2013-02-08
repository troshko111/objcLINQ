//
// All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Funcs.h"

@interface OLBlockFastEnumerator : NSObject <NSFastEnumeration>

- (id)initWithBlock:(OLEnumerator)next;

@end