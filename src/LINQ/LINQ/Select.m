//
// All rights reserved.
//


#import "Select.h"
#import "OLGenerators.h"
#import "OLBlockEnumerator.h"

@implementation NSArray (Select)

- (id <NSFastEnumeration>)select:(OLSelector)selector
{
    if (selector == nil)
        return nil;
    return [self selectImpl:selector];
}

- (id <NSFastEnumeration>)selectImpl:(OLSelector)selector
{
    OLEnumerator enumerator = OLCreateEnumerator(self);
    OLEnumerator next = ^{return selector(enumerator());};

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end