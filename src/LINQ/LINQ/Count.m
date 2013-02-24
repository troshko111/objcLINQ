//
// All rights reserved.
//


#import "Count.h"
#import "OLGenerators.h"
#import "OLContracts.h"

@implementation NSObject (OLCount)

- (NSUInteger)count
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    OLGenerator generator = OLCreateGenerator(self);

    NSUInteger count = 0;
    while (generator())
        count++;

    return count;
}

- (NSUInteger)countMatchingPredicate:(OLPredicate)predicate
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!predicate)
        return 0;

    return [self countPassingTestImpl:predicate];
}

- (NSUInteger)countPassingTestImpl:(OLPredicate)predicate;
{
    OLGenerator generator = OLCreateGenerator(self);

    id item;
    NSUInteger count = 0;
    while ((item = generator()))
    {
        if (predicate(item))
            count++;
    }

    return count;
}

@end