//
// All rights reserved.
//


#import "All.h"
#import "OLContracts.h"
#import "OLGenerators.h"

@implementation NSObject (OLAll)

- (BOOL)allMatch:(OLPredicate)predicate
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!predicate)
        return NO;

    return [self allMatchImpl:predicate];
}

- (BOOL)allMatchImpl:(OLPredicate)predicate
{
    OLGenerator generator = OLCreateGenerator(self);

    id item;
    while ((item = generator()))
    {
        if (!predicate(item))
            return NO;
    }
    return YES;
}

@end