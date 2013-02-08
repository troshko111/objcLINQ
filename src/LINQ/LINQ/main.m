//
//  main.m
//  LINQ
//
//  Created by Taras Roshko on 02/08/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Where.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
        NSLog(@"Prepare");
        OLPredicate predicate = ^(id item){ NSLog(@"Predicate");return [item integerValue] < 2;};
        id <NSFastEnumeration> filtered = [numbers where:predicate];
        NSLog(@"After where");
        for (id item in filtered)
        {
            NSLog(@"%@", item);
        }
    }

    return 0;
}
