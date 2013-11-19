#import <gtk/gtk.h>
#import "MainWindow.h"
#import "OFLog.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        void (^debug) (void);

        debug = ^{
            OFLog(@"debug");
        };

        debug();

        gtk_init(&argc, &argv);
        MainWindow *w = [[MainWindow alloc] init];
        gtk_main();
    }
}
