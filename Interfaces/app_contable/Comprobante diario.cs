using System;
namespace app_contable
{
    public partial class Comprobante_diario : Gtk.Window
    {
        public Comprobante_diario() :
                base(Gtk.WindowType.Toplevel)
        {
            this.Build();
        }
    }
}
