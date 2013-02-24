//
// All rights reserved.
//


#import "Any.h"
#import "OLGenerators.h"
#import "OLContracts.h"

@implementation NSObject (OLAny)

- (BOOL)any
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    return OLCreateGenerator(self)() != nil;
}

- (BOOL)anyMatches:(OLPredicate)predicate
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!predicate)
        return NO;

    return [self anyMatchesImpl:predicate];
}

- (BOOL)anyMatchesImpl:(OLPredicate)predicate
{
    OLGenerator generator = OLCreateGenerator(self);

    id item;
    while ((item = generator()))
    {
        if (predicate(item))
            return YES;
    }
    return NO;
}

@end