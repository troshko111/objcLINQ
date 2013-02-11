typedef id (^OLEnumerator)(void);

typedef id (^OLSelector)(id);
typedef id (^OLSelectorWithIndex )(id, NSUInteger);

typedef id<NSFastEnumeration> (^OLManySelector)(id);

typedef int (^OLPredicate)(id);
typedef int (^OLPredicateWithIndex)(id, NSUInteger);
