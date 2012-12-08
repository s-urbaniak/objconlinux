#include <ObjFW/OFObject.h>
#include <gtk/gtk.h>

@interface MainWindow : OFObject
{
    GtkWidget *win;
    GtkWidget *button;
}
@end
