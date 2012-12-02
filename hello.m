#include <stdio.h>
#include <ObjFW/OFObject.h>
#include <ObjFW/OFString.h>

@interface Foo : OFObject
- (OFString*) currentVersion;
- (OFString*) description;
@end

@implementation Foo : OFObject
- (OFString*) currentVersion
{
    return @"öäüüö Ω v0.2";
}

- (OFString*) description
{
    return [OFString stringWithFormat:@"<%@: %p>: this is me :-)", 
           [self className],
           self];
}
@end

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        Foo *f = [[Foo init] alloc];
        printf("%s\n", [[f currentVersion] cStringWithEncoding:OF_STRING_ENCODING_UTF_8]);
    }
}
