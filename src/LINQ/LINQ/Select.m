//
// All rights reserved.
//


#import "Select.h"
#import "OLBlockEnumerator.h"
#import "OLGenerators.h"

@implementation NSArray (Select)

- (id <NSFastEnumeration>)select:(OLSelector)selector
{
    if (!selector)
        return nil;

    return [self selectImpl:selector];
}

- (id <NSFastEnumeration>)selectIndexed:(OLSelectorWithIndex)selector
{
    if (!selector)
        return nil;

    return [self selectIndexedImpl:selector];
}

- (id <NSFastEnumeration>)selectImpl:(OLSelector)selector
{
    OLEnumerator enumerator = OLCreateEnumerator(self);

    OLEnumerator next = ^
    {
        id item = enumerator();
        return item ? selector(item) : nil;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)selectIndexedImpl:(OLSelectorWithIndex)selector
{
    OLEnumerator enumerator = OLCreateEnumerator(self);

    __block NSInteger index = 0;
    OLEnumerator next = ^
    {
        id item = enumerator();
        return item ? selector(item, index++) : nil;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end