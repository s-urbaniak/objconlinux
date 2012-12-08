#import <gtk/gtk.h>
#import "MainWindow.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        gtk_init(&argc, &argv);
        MainWindow *w = [[MainWindow alloc] init];
        gtk_main();
    }
}
