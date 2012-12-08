#import <stdio.h>
#import <ObjFW/OFObject.h>
#import <ObjFW/OFString.h>
#import <ObjFW/OFSet.h>
#import <ObjFW/OFArray.h>
#import <gtk/gtk.h>
#import "OFLog.h"
#import "MainWindow.h"

@interface Foo : OFObject {
    uint32_t __id;
}

+ withId: (uint32_t) _id;

- (OFString*) description;
- (id) initWithId: (uint32_t) _id;
@end

@implementation Foo : OFObject
+ withId: (uint32_t) _id
{
    return [[Foo alloc] initWithId:_id];
}

- (id) initWithId: (uint32_t) _id
{
    if (self = [super init]) {
        __id = _id;
    }

    return self;
}

- (OFString*) description
{ 
    return [OFString stringWithFormat:@"<%@:%p id:%d>", 
           [self className],
           self,
           __id];
}

- (uint32_t) hash
{
    return __id;
}

- (BOOL) isEqual: (id) o
{
    if (self == o) return YES;
    if (![o isKindOfClass:[Foo class]]) return NO;

    Foo *f = (Foo *) o;
    if (__id == f->__id)
        return YES;
    else
        return NO;
}
@end

int main(int argc, char *argv[])
{
    @autoreleasepool {
        Foo *f1 = [Foo withId:1];
        Foo *f2 = [Foo withId:2];
        Foo *f3 = [Foo withId:2];

        OFSet *a = [OFSet setWithObjects:f1, f2, f3, nil];
        OFLog(f1);
        OFLog(f2);
        OFLog(f3);
        OFLog(a);

        gtk_init(&argc, &argv);
        MainWindow *w = [[MainWindow alloc] init];
        gtk_main();
    }
}
