using System;
namespace app_contable
{
    public partial class Gestionamiento_de_asientos_contables : Gtk.Window
    {
        public Gestionamiento_de_asientos_contables() :
                base(Gtk.WindowType.Toplevel)
        {
            this.Build();
        }
    }
}
