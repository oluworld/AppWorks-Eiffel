deferred class GTK_WINDOW_FUNCTIONS

feature

    gtk_window_set_title(a_window, a_title: POINTER) is
        external "C_WithoutCurrent"
        end -- gtk_window_set_title

    gtk_window_get_size(a_window: POINTER; a_rect: GTK_RECT) is
        do
            gtk_window_get_size(a_window, a_rect.to_external)
        end -- gtk_window_get_size

end -- class GTK_WINDOW_FUNCTIONS