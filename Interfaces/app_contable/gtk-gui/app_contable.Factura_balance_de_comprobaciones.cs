
// This file has been generated by the GUI designer. Do not modify.
namespace app_contable
{
	public partial class Factura_balance_de_comprobaciones
	{
		private global::Gtk.VBox vbox5;

		private global::Gtk.VBox vbox6;

		private global::Gtk.Entry entry8;

		private global::Gtk.HBox hbox9;

		private global::Gtk.Label label12;

		private global::Gtk.Entry entry14;

		private global::Gtk.VBox vbox8;

		private global::Gtk.HBox hbox12;

		private global::Gtk.Label label17;

		private global::Gtk.Entry entry15;

		private global::Gtk.HBox hbox10;

		private global::Gtk.VBox vbox7;

		private global::Gtk.Label label13;

		private global::Gtk.Label label14;

		private global::Gtk.HBox hbox11;

		private global::Gtk.VBox vbox9;

		private global::Gtk.Entry entry16;

		private global::Gtk.Entry entry17;

		private global::Gtk.VBox vbox10;

		private global::Gtk.Label label19;

		private global::Gtk.Label label20;

		private global::Gtk.VBox vbox11;

		private global::Gtk.Entry entry18;

		private global::Gtk.Entry entry19;

		private global::Gtk.HBox hbox8;

		private global::Gtk.ScrolledWindow GtkScrolledWindow;

		private global::Gtk.TreeView treeview3;

		protected virtual void Build()
		{
			global::Stetic.Gui.Initialize(this);
			// Widget app_contable.Factura_balance_de_comprobaciones
			this.Name = "app_contable.Factura_balance_de_comprobaciones";
			this.Title = global::Mono.Unix.Catalog.GetString("Factura balance de comprobaciones");
			this.WindowPosition = ((global::Gtk.WindowPosition)(4));
			// Container child app_contable.Factura_balance_de_comprobaciones.Gtk.Container+ContainerChild
			this.vbox5 = new global::Gtk.VBox();
			this.vbox5.Name = "vbox5";
			this.vbox5.Spacing = 6;
			// Container child vbox5.Gtk.Box+BoxChild
			this.vbox6 = new global::Gtk.VBox();
			this.vbox6.Name = "vbox6";
			this.vbox6.Spacing = 6;
			// Container child vbox6.Gtk.Box+BoxChild
			this.entry8 = new global::Gtk.Entry();
			this.entry8.CanFocus = true;
			this.entry8.Name = "entry8";
			this.entry8.IsEditable = true;
			this.entry8.InvisibleChar = '•';
			this.vbox6.Add(this.entry8);
			global::Gtk.Box.BoxChild w1 = ((global::Gtk.Box.BoxChild)(this.vbox6[this.entry8]));
			w1.Position = 0;
			w1.Expand = false;
			w1.Fill = false;
			// Container child vbox6.Gtk.Box+BoxChild
			this.hbox9 = new global::Gtk.HBox();
			this.hbox9.Name = "hbox9";
			this.hbox9.Spacing = 6;
			// Container child hbox9.Gtk.Box+BoxChild
			this.label12 = new global::Gtk.Label();
			this.label12.Name = "label12";
			this.label12.LabelProp = global::Mono.Unix.Catalog.GetString("Balance de comprobaciones desde");
			this.hbox9.Add(this.label12);
			global::Gtk.Box.BoxChild w2 = ((global::Gtk.Box.BoxChild)(this.hbox9[this.label12]));
			w2.Position = 0;
			w2.Expand = false;
			w2.Fill = false;
			// Container child hbox9.Gtk.Box+BoxChild
			this.entry14 = new global::Gtk.Entry();
			this.entry14.CanFocus = true;
			this.entry14.Name = "entry14";
			this.entry14.IsEditable = true;
			this.entry14.InvisibleChar = '•';
			this.hbox9.Add(this.entry14);
			global::Gtk.Box.BoxChild w3 = ((global::Gtk.Box.BoxChild)(this.hbox9[this.entry14]));
			w3.Position = 1;
			// Container child hbox9.Gtk.Box+BoxChild
			this.vbox8 = new global::Gtk.VBox();
			this.vbox8.Name = "vbox8";
			this.vbox8.Spacing = 6;
			// Container child vbox8.Gtk.Box+BoxChild
			this.hbox12 = new global::Gtk.HBox();
			this.hbox12.Name = "hbox12";
			this.hbox12.Spacing = 6;
			// Container child hbox12.Gtk.Box+BoxChild
			this.label17 = new global::Gtk.Label();
			this.label17.Name = "label17";
			this.label17.LabelProp = global::Mono.Unix.Catalog.GetString("Hasta");
			this.hbox12.Add(this.label17);
			global::Gtk.Box.BoxChild w4 = ((global::Gtk.Box.BoxChild)(this.hbox12[this.label17]));
			w4.Position = 0;
			w4.Expand = false;
			w4.Fill = false;
			// Container child hbox12.Gtk.Box+BoxChild
			this.entry15 = new global::Gtk.Entry();
			this.entry15.CanFocus = true;
			this.entry15.Name = "entry15";
			this.entry15.IsEditable = true;
			this.entry15.InvisibleChar = '•';
			this.hbox12.Add(this.entry15);
			global::Gtk.Box.BoxChild w5 = ((global::Gtk.Box.BoxChild)(this.hbox12[this.entry15]));
			w5.Position = 1;
			this.vbox8.Add(this.hbox12);
			global::Gtk.Box.BoxChild w6 = ((global::Gtk.Box.BoxChild)(this.vbox8[this.hbox12]));
			w6.Position = 0;
			w6.Expand = false;
			w6.Fill = false;
			this.hbox9.Add(this.vbox8);
			global::Gtk.Box.BoxChild w7 = ((global::Gtk.Box.BoxChild)(this.hbox9[this.vbox8]));
			w7.Position = 2;
			this.vbox6.Add(this.hbox9);
			global::Gtk.Box.BoxChild w8 = ((global::Gtk.Box.BoxChild)(this.vbox6[this.hbox9]));
			w8.Position = 1;
			w8.Expand = false;
			w8.Fill = false;
			// Container child vbox6.Gtk.Box+BoxChild
			this.hbox10 = new global::Gtk.HBox();
			this.hbox10.Name = "hbox10";
			this.hbox10.Spacing = 6;
			// Container child hbox10.Gtk.Box+BoxChild
			this.vbox7 = new global::Gtk.VBox();
			this.vbox7.Name = "vbox7";
			this.vbox7.Spacing = 6;
			// Container child vbox7.Gtk.Box+BoxChild
			this.label13 = new global::Gtk.Label();
			this.label13.Name = "label13";
			this.label13.LabelProp = global::Mono.Unix.Catalog.GetString("Direccion");
			this.vbox7.Add(this.label13);
			global::Gtk.Box.BoxChild w9 = ((global::Gtk.Box.BoxChild)(this.vbox7[this.label13]));
			w9.Position = 0;
			w9.Expand = false;
			w9.Fill = false;
			// Container child vbox7.Gtk.Box+BoxChild
			this.label14 = new global::Gtk.Label();
			this.label14.Name = "label14";
			this.label14.LabelProp = global::Mono.Unix.Catalog.GetString("Localidad");
			this.vbox7.Add(this.label14);
			global::Gtk.Box.BoxChild w10 = ((global::Gtk.Box.BoxChild)(this.vbox7[this.label14]));
			w10.Position = 1;
			w10.Expand = false;
			w10.Fill = false;
			this.hbox10.Add(this.vbox7);
			global::Gtk.Box.BoxChild w11 = ((global::Gtk.Box.BoxChild)(this.hbox10[this.vbox7]));
			w11.Position = 0;
			w11.Expand = false;
			w11.Fill = false;
			// Container child hbox10.Gtk.Box+BoxChild
			this.hbox11 = new global::Gtk.HBox();
			this.hbox11.Name = "hbox11";
			this.hbox11.Spacing = 6;
			// Container child hbox11.Gtk.Box+BoxChild
			this.vbox9 = new global::Gtk.VBox();
			this.vbox9.Name = "vbox9";
			this.vbox9.Spacing = 6;
			// Container child vbox9.Gtk.Box+BoxChild
			this.entry16 = new global::Gtk.Entry();
			this.entry16.CanFocus = true;
			this.entry16.Name = "entry16";
			this.entry16.IsEditable = true;
			this.entry16.InvisibleChar = '•';
			this.vbox9.Add(this.entry16);
			global::Gtk.Box.BoxChild w12 = ((global::Gtk.Box.BoxChild)(this.vbox9[this.entry16]));
			w12.Position = 0;
			w12.Expand = false;
			w12.Fill = false;
			// Container child vbox9.Gtk.Box+BoxChild
			this.entry17 = new global::Gtk.Entry();
			this.entry17.CanFocus = true;
			this.entry17.Name = "entry17";
			this.entry17.IsEditable = true;
			this.entry17.InvisibleChar = '•';
			this.vbox9.Add(this.entry17);
			global::Gtk.Box.BoxChild w13 = ((global::Gtk.Box.BoxChild)(this.vbox9[this.entry17]));
			w13.Position = 1;
			w13.Expand = false;
			w13.Fill = false;
			this.hbox11.Add(this.vbox9);
			global::Gtk.Box.BoxChild w14 = ((global::Gtk.Box.BoxChild)(this.hbox11[this.vbox9]));
			w14.Position = 0;
			// Container child hbox11.Gtk.Box+BoxChild
			this.vbox10 = new global::Gtk.VBox();
			this.vbox10.Name = "vbox10";
			this.vbox10.Spacing = 6;
			// Container child vbox10.Gtk.Box+BoxChild
			this.label19 = new global::Gtk.Label();
			this.label19.Name = "label19";
			this.label19.LabelProp = global::Mono.Unix.Catalog.GetString("Correo");
			this.vbox10.Add(this.label19);
			global::Gtk.Box.BoxChild w15 = ((global::Gtk.Box.BoxChild)(this.vbox10[this.label19]));
			w15.Position = 0;
			w15.Expand = false;
			w15.Fill = false;
			// Container child vbox10.Gtk.Box+BoxChild
			this.label20 = new global::Gtk.Label();
			this.label20.Name = "label20";
			this.label20.LabelProp = global::Mono.Unix.Catalog.GetString("Teléfono");
			this.vbox10.Add(this.label20);
			global::Gtk.Box.BoxChild w16 = ((global::Gtk.Box.BoxChild)(this.vbox10[this.label20]));
			w16.Position = 1;
			w16.Expand = false;
			w16.Fill = false;
			this.hbox11.Add(this.vbox10);
			global::Gtk.Box.BoxChild w17 = ((global::Gtk.Box.BoxChild)(this.hbox11[this.vbox10]));
			w17.Position = 1;
			w17.Expand = false;
			w17.Fill = false;
			// Container child hbox11.Gtk.Box+BoxChild
			this.vbox11 = new global::Gtk.VBox();
			this.vbox11.Name = "vbox11";
			this.vbox11.Spacing = 6;
			// Container child vbox11.Gtk.Box+BoxChild
			this.entry18 = new global::Gtk.Entry();
			this.entry18.CanFocus = true;
			this.entry18.Name = "entry18";
			this.entry18.IsEditable = true;
			this.entry18.InvisibleChar = '•';
			this.vbox11.Add(this.entry18);
			global::Gtk.Box.BoxChild w18 = ((global::Gtk.Box.BoxChild)(this.vbox11[this.entry18]));
			w18.Position = 0;
			w18.Expand = false;
			w18.Fill = false;
			// Container child vbox11.Gtk.Box+BoxChild
			this.entry19 = new global::Gtk.Entry();
			this.entry19.CanFocus = true;
			this.entry19.Name = "entry19";
			this.entry19.IsEditable = true;
			this.entry19.InvisibleChar = '•';
			this.vbox11.Add(this.entry19);
			global::Gtk.Box.BoxChild w19 = ((global::Gtk.Box.BoxChild)(this.vbox11[this.entry19]));
			w19.Position = 1;
			w19.Expand = false;
			w19.Fill = false;
			this.hbox11.Add(this.vbox11);
			global::Gtk.Box.BoxChild w20 = ((global::Gtk.Box.BoxChild)(this.hbox11[this.vbox11]));
			w20.Position = 2;
			this.hbox10.Add(this.hbox11);
			global::Gtk.Box.BoxChild w21 = ((global::Gtk.Box.BoxChild)(this.hbox10[this.hbox11]));
			w21.Position = 1;
			this.vbox6.Add(this.hbox10);
			global::Gtk.Box.BoxChild w22 = ((global::Gtk.Box.BoxChild)(this.vbox6[this.hbox10]));
			w22.Position = 2;
			w22.Expand = false;
			w22.Fill = false;
			this.vbox5.Add(this.vbox6);
			global::Gtk.Box.BoxChild w23 = ((global::Gtk.Box.BoxChild)(this.vbox5[this.vbox6]));
			w23.Position = 0;
			w23.Expand = false;
			w23.Fill = false;
			// Container child vbox5.Gtk.Box+BoxChild
			this.hbox8 = new global::Gtk.HBox();
			this.hbox8.Name = "hbox8";
			this.hbox8.Spacing = 6;
			// Container child hbox8.Gtk.Box+BoxChild
			this.GtkScrolledWindow = new global::Gtk.ScrolledWindow();
			this.GtkScrolledWindow.Name = "GtkScrolledWindow";
			this.GtkScrolledWindow.ShadowType = ((global::Gtk.ShadowType)(1));
			// Container child GtkScrolledWindow.Gtk.Container+ContainerChild
			this.treeview3 = new global::Gtk.TreeView();
			this.treeview3.CanFocus = true;
			this.treeview3.Name = "treeview3";
			this.GtkScrolledWindow.Add(this.treeview3);
			this.hbox8.Add(this.GtkScrolledWindow);
			global::Gtk.Box.BoxChild w25 = ((global::Gtk.Box.BoxChild)(this.hbox8[this.GtkScrolledWindow]));
			w25.Position = 0;
			this.vbox5.Add(this.hbox8);
			global::Gtk.Box.BoxChild w26 = ((global::Gtk.Box.BoxChild)(this.vbox5[this.hbox8]));
			w26.Position = 1;
			this.Add(this.vbox5);
			if ((this.Child != null))
			{
				this.Child.ShowAll();
			}
			this.DefaultWidth = 812;
			this.DefaultHeight = 300;
			this.Show();
		}
	}
}
