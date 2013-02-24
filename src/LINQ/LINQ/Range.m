//
// All rights reserved.
//


#import "Range.h"
#import "OLFuncs.h"
#import "OLBlockEnumerator.h"
#import "OLContracts.h"

@implementation NSObject (OLRange)

+ (id <NSFastEnumeration>)rangeFrom:(NSInteger)start count:(NSUInteger)count
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    __block NSInteger i = 0;
    OLGenerator next = ^
    {
        return i < count ? [NSNumber numberWithInteger:(start + i++)] : nil;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end