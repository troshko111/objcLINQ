//
// All rights reserved.
//


#import "Repeat.h"
#import "OLFuncs.h"
#import "OLBlockEnumerator.h"
#import "OLContracts.h"

@implementation NSObject (OLRepeat)

+ (id <NSFastEnumeration>)repeatElement:(id)element count:(NSUInteger)count
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    __block NSInteger i = 0;
    OLGenerator next = ^
    {
        return i++ < count ? element : nil;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end