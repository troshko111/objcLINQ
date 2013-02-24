//
// All rights reserved.
//

#import "Empty.h"
#import "OLContracts.h"

@implementation NSObject (OLEmpty)

+ (id <NSFastEnumeration>)empty
{
    OL_ENSURE_SELF_CONFORMS_TO_NSFastEnumeration
    return nil;
}

@end