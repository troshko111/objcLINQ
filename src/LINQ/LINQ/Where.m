//
// All rights reserved.
//


#import "Where.h"
#import "OLBlockFastEnumerator.h"
#import "Generators.h"

@implementation NSArray (LINQ)

- (id <NSFastEnumeration>)where:(OLPredicate)predicate
{
    if (predicate == nil)
        return nil;
    return [self whereImpl:predicate];
}

- (id <NSFastEnumeration>)whereImpl:(OLPredicate)predicate
{
    OLEnumerator enumerator = OLCreateEnumerator(self);
    OLEnumerator next = ^
    {
        id item = enumerator();
        if (item)
        {
            while (item && !predicate(item))
                item = enumerator();
            return item;
        }
        return (id)nil;
    };

    return [[OLBlockFastEnumerator alloc] initWithBlock:next];
}

@end