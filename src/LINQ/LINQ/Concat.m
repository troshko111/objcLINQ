//
// All rights reserved.
//


#import "Concat.h"
#import "OLFuncs.h"
#import "OLGenerators.h"
#import "OLBlockEnumerator.h"
#import "OLContracts.h"

@implementation NSObject (OLConcatWith)

- (id <NSFastEnumeration>)concatWith:(id <NSFastEnumeration>)second
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    OLGenerator firstGenerator = OLCreateGenerator(self);
    OLGenerator secondGenerator = OLCreateGenerator(second);

    OLGenerator next = ^
    {
        id item;

        while ((item = firstGenerator()))
            return item;

        while ((item = secondGenerator()))
            return item;

        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end