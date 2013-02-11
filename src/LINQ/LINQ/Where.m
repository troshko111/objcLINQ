#import "Where.h"
#import "OLBlockEnumerator.h"
#import "OLGenerators.h"

@implementation NSArray (Where)

- (id <NSFastEnumeration>)where:(OLPredicate)predicate
{
    if (!predicate)
        return nil;

    return [self whereImpl:predicate];
}

- (id <NSFastEnumeration>)whereIndexed:(OLPredicateWithIndex)predicate
{
    if (!predicate)
        return nil;

    return [self whereIndexedImpl:predicate];
}

- (id <NSFastEnumeration>)whereImpl:(OLPredicate)predicate
{
    OLEnumerator enumerator = OLCreateEnumerator(self);

    OLEnumerator next = ^
    {
        id item;
        while ((item = enumerator()) && !predicate(item));
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)whereIndexedImpl:(OLPredicateWithIndex)predicate
{
    OLEnumerator enumerator = OLCreateEnumerator(self);

    __block NSUInteger index = 0;
    OLEnumerator next = ^
    {
        id item;
        while ((item = enumerator()))
        {
            if (predicate(item, index++))
                return item;
        }
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end