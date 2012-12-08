#import <ObjFW/OFString.h>

#import "OFLog.h"
#import "MainWindow.h"

@implementation MainWindow
- (id) init
{
    if (self = [super init]) {
        self->win = gtk_window_new(GTK_WINDOW_TOPLEVEL);
        gtk_window_set_title(GTK_WINDOW(self->win), "Test");
        gtk_window_set_default_geometry(GTK_WINDOW(self->win), 200, 200);
        g_signal_connect(self->win, "destroy", G_CALLBACK(gtk_main_quit), NULL);

        self->button = gtk_button_new_with_label("Test");

        gtk_container_add(GTK_CONTAINER(self->win), self->button);
        gtk_widget_show_all(self->win);
    }

    return self;
}

- (OFString*) description
{ 
    return [OFString stringWithFormat:@"<%@:%p win:%p>", 
           [self className],
           self,
           self->win];
}

- (void) dealloc
{
    OFString *d = [OFString stringWithFormat:@"dealloc %@", self];
    OFLog(d);
    self->win = NULL;

    if (GTK_IS_WIDGET(self->button)) {
        gtk_widget_destroy(self->button);
    }

    if (GTK_IS_WIDGET(self->win)) {
        gtk_widget_destroy(self->win);
    }
}
@end
