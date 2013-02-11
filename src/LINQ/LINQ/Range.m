//
// All rights reserved.
//


#import "Range.h"
#import "OLFuncs.h"
#import "OLBlockEnumerator.h"

@implementation NSArray(Range)

+ (id <NSFastEnumeration>)range:(NSInteger)start count:(NSUInteger)count
{
    __block NSInteger i = 0;
    OLEnumerator next = ^{return i < count ? [NSNumber numberWithInteger:(start + i++)] : nil;};

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end