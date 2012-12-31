#include <ObjFW/OFObject.h>
#include <gtk/gtk.h>

@interface MainWindow : OFObject
{
    @private GtkWidget *win;
    @private GtkWidget *button;
}
@end
