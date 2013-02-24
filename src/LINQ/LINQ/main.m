//
//  main.m
//  LINQ
//
//  Created by Taras Roshko on 02/08/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Where.h"
#import "Select.h"
#import "Range.h"
#import "Empty.h"
#import "Repeat.h"
#import "Count.h"
#import "Concat.h"
#import "SelectMany.h"
#import "Any.h"
#import "All.h"

void selectDemo();
void whereDemo();
void selectIndexedDemo();
void whereIndexedDemo();
void rangeDemo();
void emptyDemo();
void repeatDemo();
void countDemo();
void concatDemo();
void selectManyDemo();
void selectManyIndexedDemo();
void anyDemo();
void allDemo();

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
//        selectDemo();
//        selectIndexedDemo();
//
//        whereDemo();
//        whereIndexedDemo();
//
//        rangeDemo();
//
//        emptyDemo();
//
//        repeatDemo();
//
//        countDemo();
//
//        concatDemo();

        selectManyDemo();
        selectManyIndexedDemo();

        anyDemo();
        allDemo();
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

void whereIndexedDemo()
{
    NSArray *numbers = @[@10, @11, @12, @13, @14, @15, @16, @17, @18, @19];
    id <NSFastEnumeration> half = [numbers whereIndexed:^(id item, NSUInteger i){return i < 5;}];

    NSLog(@"Half of array 10..19:");
    for (id item in half)
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

void selectIndexedDemo()
{
    NSArray *strings = @[@"String1", @"String2", @"String3"];
    id<NSFastEnumeration> indexedStrings = [strings selectIndexed:^(id item, NSUInteger i){return [NSString stringWithFormat:@"item: %@ index: %d", item, i];}];

    NSLog(@"Indexed strings:");
    for (id item in indexedStrings)
        NSLog(@"%@", item);
}

void rangeDemo()
{
    NSLog(@"Range from -5, 10 items total:");
    for(NSNumber *number in [NSArray rangeFrom:-5 count:10])
        NSLog(@"%@", number);
}

void emptyDemo()
{
    NSLog(@"Enumerating empty NSFastEnumeration:");
    for(id item in [NSArray empty])
        NSLog(@"item: %@", item);
    NSLog(@"Done");
}

void repeatDemo()
{
    NSLog(@"1 repeated 10 times:");
    for (id item in [NSArray repeatElement:@1 count:10])
        NSLog(@"%@", item);
}

void countDemo()
{
    NSArray *array = @[@1, @2, @3, @4, @5];
    NSLog(@"count: %d", [array count]);

    NSLog(@"even numbers count: %d", [array countMatchingPredicate:^(id item)
    {
        return [item integerValue] % 2 == 0;
    }]);

}

void concatDemo()
{
    NSArray *a = @[@1, @2];
    NSArray *b = @[@3];

    NSLog(@"[1,2] + [3]:");
    for (id item in [a concatWith:b])
        NSLog(@"%@", item);

    NSLog(@"[1,2] + nil");
    for (id item in [@[@1, @2] concatWith:nil])
        NSLog(@"%@", item);
}

void selectManyDemo()
{
    NSArray *a = @[@[@1, @2], @[@3]];
    NSLog(@"Select many over @[@[@1, @2], @[@3]]");
    for (id number in [a selectMany:^(id item){ return item;}])
    {
        NSLog(@"%@", number);
    }
}

void selectManyIndexedDemo()
{
    NSArray *a = @[@[@1, @2], @[@3]];
    NSLog(@"Select many indexed over @[@[@1, @2], @[@3]]");
    for (id number in [a selectManyIndexed:^(id item, NSUInteger index)
    {
        return [item concatWith:[NSArray arrayWithObjects:[NSNumber numberWithInteger:index], nil]];
    }])
    {
        NSLog(@"%@", number);
    }
}

void anyDemo()
{
    NSArray *a = @[@"Taras", @"Jon", @"Mike"];
    NSLog(@"Any @[@\"Taras\", @\"Jon\", @\"Mike\"] %d", [a any]);
    NSLog(@"Any @[@\"Taras\", @\"Jon\", @\"Mike\"] starts with T: %d", [a anyMatches:^(id item){return (int)([((NSString *) item) hasPrefix:@"T"]);}]);
}

void allDemo()
{
    NSArray *a = @[@1, @2, @3, @4, @5];
    NSLog(@"All from @[@1, @2, @3, @4, @5] less than 2: %d", [a allMatch:^(id item){ return [item integerValue] < 2;}]);
}