//
// All rights reserved.
//


#import "Repeat.h"
#import "OLFuncs.h"
#import "OLBlockEnumerator.h"

@implementation NSArray(Repeat)

+ (id <NSFastEnumeration>)repeat:(id)element count:(NSUInteger)count
{
    __block NSInteger i = 0;
    OLEnumerator next = ^{return i++ < count ? element : nil;};

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end