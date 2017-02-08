require 'gtk3'

class Fenetre2 < Gtk::Window 
	@cadreAide
	def initialize ()
		super
		signal_connect "destroy" do
			Gtk.main_quit
		end

		# Property
		set_title "Sudoku Pre-Alpha Ultimate Premium Professional Familial Exclusive Edition (Version d'Evaluation)"
		set_default_size 1000, 500

		#==========#
		# Niveau 1 #
		#==========#
		vboxMain = Gtk::Box.new(:vertical, 0) # Menu + Table pour Grille, Aide et bouton
	    add(vboxMain)


		#=========================#  Note: Menu = Groupe de MenuItem une fois définie un submenu d'un autres MenuItem qui sert de titre
		# Creation Menu (à finir) #  Exemple:  Fichier [Menu: (Nouveau, Sauvegarder, ...)]
		#=========================#  Voir si on nomme les MenuItem "MI" pour faire plus propre

	    menuBar = Gtk::MenuBar.new # Barre du menu
	    menuBar.override_background_color(:normal, Gdk::RGBA::new(0.95,0.95,0.95,1.0))

	    # Menu Fichier
	    fileMenuItem = Gtk::MenuItem.new(:label => "Fichier", :use_underline => false) # Item Fichier
	    fileMenu = Gtk::Menu.new() # Menu de Fichier
	    fileMenuItem.set_submenu(fileMenu)

	        # Nouveau
	        nouveauMenuItem = Gtk::MenuItem.new(:label => "Nouveau", :use_underline => false)
	        nouveauMenuItem.signal_connect "activate" do
                setAide("Bouton nouveau", [], "Permet de créer un nouveau fichier")
            end
	        fileMenu.append(nouveauMenuItem)
	        
	        # Sauvegarder
	        sauvergarderMenuItem = Gtk::MenuItem.new(:label => "Sauvegarder", :use_underline => false)
	        fileMenu.append(sauvergarderMenuItem)

	        # Fermer
	        fermerMenuItem = Gtk::MenuItem.new(:label => "Fermer", :use_underline => false)
            fermerMenuItem.signal_connect "activate" do
                Gtk.main_quit
            end
            fileMenu.add(fermerMenuItem)

        # Menu Option
	    menuBar.append(fileMenuItem)	
		

		#==========#
		# Niveau 2 #
		#==========#
	    vboxMain.pack_start(menuBar,:expand => false, :fill => false, :padding => 0)
	    tableMain = Gtk::Table.new(10, 10)
	    tableMain.override_background_color(:normal, Gdk::RGBA::new(0.4,0.4,1.0,1.0))
	    vboxMain.pack_start(tableMain,:expand => true, :fill => true, :padding => 0)
	   

		#==========#
		# Niveau 3 #
		#==========#

		# Grille de Sudoku
		box = Gtk::Box.new(:horizontal, 0)
		box.override_background_color(:normal, Gdk::RGBA::new(1.0,0.6,0.6,1.0))

		tableGrille = Gtk::Table.new(9, 9, false)
		tableGrille.row_spacings = 5
		tableGrille.column_spacings = 5
		tableGrille.border_width = 10
		tableGrille.set_border_width(10)

		labelTest = Gtk::Label.new("1")

		tableGrille.attach(labelTest, 0, 1, 0, 1)
		box.add(tableGrille)

		# Cadre d'aide
		@cadreAide = Gtk::Label.new()
		@cadreAide.set_markup("<a href=\"http://google.fr/\" >Aide... toussa toussa</a>")
		@cadreAide.override_background_color(:normal, Gdk::RGBA::new(0.6,0.6,1.0,1.0))

		# Panel des boutons numerique
		hboxBouton = Gtk::Box.new(:horizontal, 10) # Pad numérique
		hboxBouton.homogeneous = true
		hboxBouton.override_background_color(:normal, Gdk::RGBA::new(0.6,1.0,0.6,1.0))

		tableMain.attach(box        , 0,4,0,8)
		tableMain.attach(@cadreAide  , 4,9,0,8)
		tableMain.attach(hboxBouton , 0,9,8,9)



		#==========#
		# Niveau 4 #
		#==========#

	    btn1 = Gtk::Button.new(:label => '1', :use_underline => nil, :stock_id => nil)
	    btn2 = Gtk::Button.new(:label => '2', :use_underline => nil, :stock_id => nil)
	    btn3 = Gtk::Button.new(:label => '3', :use_underline => nil, :stock_id => nil)
	    btn4 = Gtk::Button.new(:label => '4', :use_underline => nil, :stock_id => nil)
	    btn5 = Gtk::Button.new(:label => '5', :use_underline => nil, :stock_id => nil)
	    btn6 = Gtk::Button.new(:label => '6', :use_underline => nil, :stock_id => nil)
	    btn7 = Gtk::Button.new(:label => '7', :use_underline => nil, :stock_id => nil)
	    btn8 = Gtk::Button.new(:label => '8', :use_underline => nil, :stock_id => nil)
	    btn9 = Gtk::Button.new(:label => '9', :use_underline => nil, :stock_id => nil)

	    hboxBouton.add(btn1)
	    hboxBouton.add(btn2)
	    hboxBouton.add(btn3)
	    hboxBouton.add(btn4)
	    hboxBouton.add(btn5)
	    hboxBouton.add(btn6)
	    hboxBouton.add(btn7)
	    hboxBouton.add(btn8)
	    hboxBouton.add(btn9)

	    show_all
	    Gtk.main
	end

	def setAide(titre, listeCase, desc)
		@cadreAide.set_markup("")
		#titreFormat = "<span font-weight=\"bold\" foreground=\"#200020\">test</span>"
		#listeCaseFormat = "<span style=\"italic\">Case:"+ (listeCase.empty? ? "Aucune" : listeCase.to_s) +"</span>"
		#descFormat = "<span>"+desc+"</span>"
		#@cadreAide.markup = titreFormat # + descFormat) #  + listeCase
	end
end