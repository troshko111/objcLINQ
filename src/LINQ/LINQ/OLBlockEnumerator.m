//
// All rights reserved.
//


#import "OLBlockEnumerator.h"

@implementation OLBlockEnumerator
{
    OLEnumerator _next;
}

- (id)initWithBlock:(OLEnumerator)next
{
    self = [super init];
    if (self)
        _next = next;
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(__unsafe_unretained id[])buffer
                                    count:(NSUInteger)len
{
    if (state->state == 0)
    {
        state->mutationsPtr = (__bridge void*)self;
        state->state = 1;
    }

    __unsafe_unretained id current = _next();
    if (!current)
        return 0;

    state->itemsPtr = &current;
    return 1;
}

@end