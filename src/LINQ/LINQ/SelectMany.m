//
// All rights reserved.
//

#import "SelectMany.h"
#import "OLContracts.h"
#import "OLBlockEnumerator.h"
#import "OLGenerators.h"

@implementation NSObject (OLSelectMany)

- (id <NSFastEnumeration>)selectMany:(OLManySelector)selector
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!selector)
        return nil;

    return [self selectManyImpl:selector];
}

- (id <NSFastEnumeration>)selectManyIndexed:(OLManySelectorWithIndex)selector
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!selector)
        return nil;

    return [self selectManyIndexedImpl:selector];
}

- (id <NSFastEnumeration>)selectMany:(OLManySelector)selector reducer:(OLReducer)reducer
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!selector)
        return nil;
    if (!reducer)
        return nil;

    return [self selectManyImpl:selector reducer:reducer];
}

- (id <NSFastEnumeration>)selectManyIndexed:(OLManySelectorWithIndex)selector reducer:(OLReducer)reducer
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration

    if (!selector)
        return nil;
    if (!reducer)
        return nil;

    return [self selectManyIndexedImpl:selector reducer:reducer];
}

- (id <NSFastEnumeration>)selectManyImpl:(OLManySelector)selector
{
    OLGenerator generator = OLCreateGenerator(self);

    __block int state = 0;
    __block id item;
    __block id subItem;
    __block OLGenerator subGenerator;

    OLGenerator next = ^
    {
        start:;
        switch (state)
        {
            case 0:
                if ((item = generator()))
                {
                    subGenerator = OLCreateGenerator(selector(item));
                    state = 1;
                }
                else
                    goto end;
            case 1:
                while ((subItem = subGenerator()))
                    return subItem;
                state = 0;
                goto start;
        }

        end:;
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)selectManyIndexedImpl:(OLManySelectorWithIndex)selector
{
    OLGenerator generator = OLCreateGenerator(self);

    __block int state = 0;
    __block NSUInteger index = 0;
    __block id item;
    __block id subItem;
    __block OLGenerator subGenerator;

    OLGenerator next = ^
    {
        start:;
        switch (state)
        {
            case 0:
                if ((item = generator()))
                {
                    subGenerator = OLCreateGenerator(selector(item, index++));
                    state = 1;
                }
                else
                    goto end;
            case 1:
                while ((subItem = subGenerator()))
                    return subItem;
                state = 0;
                goto start;
        }

        end:;
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)selectManyImpl:(OLManySelector)selector reducer:(OLReducer)reducer
{
    OLGenerator generator = OLCreateGenerator(self);

    __block int state = 0;
    __block id item;
    __block id subItem;
    __block OLGenerator subGenerator;

    OLGenerator next = ^
    {
        start:;
        switch (state)
        {
            case 0:
                if ((item = generator()))
                {
                    subGenerator = OLCreateGenerator(selector(item));
                    state = 1;
                }
                else
                    goto end;
            case 1:
                while ((subItem = subGenerator()))
                    return reducer(item, subItem);
                state = 0;
                goto start;
        }

        end:;
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

- (id <NSFastEnumeration>)selectManyIndexedImpl:(OLManySelectorWithIndex)selector reducer:(OLReducer)reducer
{
    OLGenerator generator = OLCreateGenerator(self);

    __block int state = 0;
    __block NSUInteger index = 0;
    __block id item;
    __block id subItem;
    __block OLGenerator subGenerator;

    OLGenerator next = ^
    {
        start:;
        switch (state)
        {
            case 0:
                if ((item = generator()))
                {
                    subGenerator = OLCreateGenerator(selector(item, index++));
                    state = 1;
                }
                else
                    goto end;
            case 1:
                while ((subItem = subGenerator()))
                    return reducer(item, subItem);
                state = 0;
                goto start;
        }

        end:;
        return item;
    };

    return [[OLBlockEnumerator alloc] initWithBlock:next];
}

@end