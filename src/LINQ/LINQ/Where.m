//
// All rights reserved.
//


#import "Where.h"
#import "OLBlockEnumerator.h"
#import "OLGenerators.h"

@implementation NSArray (Where)

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
        id item;
        while ((item = enumerator()) && !predicate(item));
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end