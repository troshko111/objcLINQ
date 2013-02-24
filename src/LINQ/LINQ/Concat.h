//
// All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (OLConcatWith)

- (id <NSFastEnumeration>)concatWith:(id <NSFastEnumeration>)second;

@end