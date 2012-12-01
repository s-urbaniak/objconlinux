#include <stdio.h>
#include <ObjFW/OFObject.h>
#include <ObjFW/OFString.h>

@interface Foo : OFObject
- (OFString*) currentVersion;
@end

@implementation Foo : OFObject
- (OFString*) currentVersion
{
    return @"öäüüö Ω v0.2";
}
@end

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        Foo *f = [[Foo init] alloc];
        printf("%s\n", [[f currentVersion] cStringWithEncoding:OF_STRING_ENCODING_UTF_8]);
    }
}