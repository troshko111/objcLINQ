//
// All rights reserved.
//


#import "Select.h"
#import "OLBlockEnumerator.h"
#import "OLGenerators.h"
#import "OLContracts.h"

@implementation NSObject (OLSelect)

- (id <NSFastEnumeration>)select:(OLSelector)selector
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!selector)
        return nil;

    return [self selectImpl:selector];
}

- (id <NSFastEnumeration>)selectIndexed:(OLSelectorWithIndex)selector
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!selector)
        return nil;

    return [self selectIndexedImpl:selector];
}

- (id <NSFastEnumeration>)selectImpl:(OLSelector)selector
{
    OLGenerator generator = OLCreateGenerator(self);

    OLGenerator next = ^
    {
        id item = generator();
        return item ? selector(item) : nil;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)selectIndexedImpl:(OLSelectorWithIndex)selector
{
    OLGenerator generator = OLCreateGenerator(self);

    __block NSUInteger index = 0;
    OLGenerator next = ^
    {
        id item = generator();
        return item ? selector(item, index++) : nil;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end