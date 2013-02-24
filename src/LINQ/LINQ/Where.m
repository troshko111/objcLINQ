#import "Where.h"
#import "OLBlockEnumerator.h"
#import "OLGenerators.h"
#import "OLContracts.h"

@implementation NSObject (OLWhere)

- (id <NSFastEnumeration>)where:(OLPredicate)predicate
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!predicate)
        return nil;

    return [self whereImpl:predicate];
}

- (id <NSFastEnumeration>)whereIndexed:(OLPredicateWithIndex)predicate
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!predicate)
        return nil;

    return [self whereIndexedImpl:predicate];
}

- (id <NSFastEnumeration>)whereImpl:(OLPredicate)predicate
{
    OLGenerator generator = OLCreateGenerator(self);

    OLGenerator next = ^
    {
        id item;
        while ((item = generator()) && !predicate(item));
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)whereIndexedImpl:(OLPredicateWithIndex)predicate
{
    OLGenerator generator = OLCreateGenerator(self);

    __block NSUInteger index = 0;
    OLGenerator next = ^
    {
        id item;
        while ((item = generator()))
        {
            if (predicate(item, index++))
                return item;
        }
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end