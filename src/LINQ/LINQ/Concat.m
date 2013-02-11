//
// All rights reserved.
//


#import "Concat.h"
#import "OLFuncs.h"
#import "OLGenerators.h"
#import "OLBlockEnumerator.h"

@implementation NSArray(Concat)

- (id <NSFastEnumeration>)concat:(id <NSFastEnumeration>)second
{
    OLEnumerator firstEnumerator = OLCreateEnumerator(self);
    OLEnumerator secondEnumerator = OLCreateEnumerator(second);

    OLEnumerator next = ^
    {
        id item;

        while ((item = firstEnumerator()))//TODO avoid calling first before every call to second
            return item;

        while ((item = secondEnumerator()))
            return item;

        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end