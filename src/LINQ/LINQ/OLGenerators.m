#import "OLGenerators.h"

GENERATOR(id, OLCreateEnumerator(id <NSFastEnumeration> collection), (void))
{
    NSFastEnumerationState state = {0};
    __unsafe_unretained id *const stackBuffer = (__unsafe_unretained id *const)calloc(16, sizeof(id));

    __block BOOL firstLoop = YES;
    __block long mutationsPtrValue = 0;
    __block NSUInteger count = 0;

    __block NSUInteger index = 0;
    __block id item;

    GENERATOR_BEGIN(void)
    {
        while ((count = [collection countByEnumeratingWithState:&state objects:stackBuffer count:16]))
        {
            if (!firstLoop && mutationsPtrValue != *state.mutationsPtr)
                [NSException raise:NSGenericException format:@"Collection was mutated while being enumerated"];

            firstLoop = NO;
            mutationsPtrValue = *state.mutationsPtr;

            for (index = 0; index < count; index++)
            {
                item = state.itemsPtr[index];
                GENERATOR_YIELD(item);
            }
        }
    }
    GENERATOR_CLEANUP
    {
        free(stackBuffer);
    }
    GENERATOR_END
}