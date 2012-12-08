#import <stdio.h>
#import <ObjFW/OFString.h>

#define OFLog(obj) \
    printf("%s:%d %s\n", \
    __FILE__, \
    __LINE__, \
    [[obj description] cStringWithEncoding:OF_STRING_ENCODING_UTF_8])

