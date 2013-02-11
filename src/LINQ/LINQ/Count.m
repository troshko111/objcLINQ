//
// All rights reserved.
//


#import "Count.h"
#import "OLGenerators.h"

@implementation NSArray (Count)

- (NSUInteger)count
{
    OLEnumerator enumerator = OLCreateEnumerator(self);

    NSUInteger count = 0;
    while (enumerator())
        count++;

    return count;
}

- (NSUInteger)countPassingTest:(OLPredicate)predicate
{
    if (!predicate)
        return 0;

    return [self countPassingTestImpl:predicate];
}

- (NSUInteger)countPassingTestImpl:(OLPredicate)predicate;
{
    OLEnumerator enumerator = OLCreateEnumerator(self);

    id item;
    NSUInteger count = 0;
    while ((item = enumerator()))
    {
        if (predicate(item))
            count++;
    }

    return count;
}

@end