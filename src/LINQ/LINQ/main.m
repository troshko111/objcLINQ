//
//  main.m
//  LINQ
//
//  Created by Taras Roshko on 02/08/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Where.h"
#import "Select.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        void selectDemo(void);
        selectDemo();
    }

    return 0;
}

void whereDemo()
{
    NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    id <NSFastEnumeration> filtered = [numbers where:^(id item){return [item integerValue] < 5;}];

    NSLog(@"Numbers < 5 from array 1..10:");
    for (id item in filtered)
        NSLog(@"%@", item);
}

void selectDemo()
{
    NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    id <NSFastEnumeration> squares = [numbers select:^(id number){return [NSNumber numberWithInteger:[number integerValue] * [number integerValue]];}];

    NSLog(@"Squares from array 1..10:");
    for (id item in squares)
        NSLog(@"%@", item);
}
