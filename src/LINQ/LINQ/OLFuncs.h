typedef id (^OLGenerator)(void);

typedef id (^OLSelector)(id);
typedef id (^OLSelectorWithIndex )(id, NSUInteger);

typedef id<NSFastEnumeration> (^OLManySelector)(id);
typedef id<NSFastEnumeration> (^OLManySelectorWithIndex)(id, NSUInteger);
typedef id (^OLReducer)(id, id);

typedef int (^OLPredicate)(id);
typedef int (^OLPredicateWithIndex)(id, NSUInteger);
