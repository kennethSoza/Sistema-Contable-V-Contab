using System;
using Gtk;

namespace app_contable
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            Application.Init();
            Gestionamiento_de_cuentas win = new Gestionamiento_de_cuentas();
            win.Show();
            Application.Run();
        }
    }
}
