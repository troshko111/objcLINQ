//
// All rights reserved.
//


#import "SelectMany.h"
#import "OLGenerators.h"
#import "OLBlockEnumerator.h"

@implementation NSArray(SelectMany)

- (id <NSFastEnumeration>)selectMany:(OLManySelector)selector
{
    if (!selector)
        return nil;

    return [self selectManyImpl:selector];
}

- (id <NSFastEnumeration>)selectManyImpl:(OLManySelector)selector
{
}

@end