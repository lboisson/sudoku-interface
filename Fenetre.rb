require 'gtk3'
require './sudoku.rb'

class Fenetre < Gtk::Window 
	@cadreAide
	def initialize ()
		super
		signal_connect "destroy" do
			Gtk.main_quit
		end

		# Property
		set_title "Sudoku Pre-Alpha Ultimate Premium Professional Familial Exclusive Edition (Version d'Evaluation)"
		set_default_size 670, 480

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
	    vboxMain.pack_start(tableMain,:expand => true, :fill => true, :padding => 0)
	   

		#==========#
		# Niveau 3 #
		#==========#

		# Grille de Sudoku
		box = Gtk::Box.new(:horizontal, 0)
		#box.override_background_color(:normal, Gdk::RGBA::new(1.0,0.6,0.6,1.0))

		tableGrille = Gtk::Table.new(9, 9, true)
		tableGrille.set_margin_left(1)
		labelTest = Gtk::Label.new("1")

		# Remplissage du tableau pour les tests
		for i in 0..8
			for y in 0..8
				tableGrille.attach(Gtk::EventBox.new(), y, y+1, i, i+1, Gtk::AttachOptions::EXPAND, Gtk::AttachOptions::EXPAND, 1,1)
				tableGrille.children().first().add(Gtk::Label.new().set_markup("<span font-weight=\"bold\">#{y+1}</span>"))
				tableGrille.children().first().set_size_request(46,46)
			end
		end

		box.pack_start(tableGrille,:expand => true, :fill => true, :padding => 1 )

		# Cadre d'aide
		@cadreAide = Gtk::EventBox.new().add( Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "help.png", :width => 432, :heigth => 432)))
		#@cadreAide = Gtk::Label.new()
		#@cadreAide.set_markup("<a href=\"http://google.fr/\" >Click si tu sait pas jouer au Sudoku</a>")
		#@cadreAide.override_background_color(:normal, Gdk::RGBA::new(0.6,0.6,1.0,1.0))

		# Panel des boutons numerique
		hboxBouton = Gtk::Box.new(:horizontal, 10) # Pad numérique
		hboxBouton.homogeneous = true
		hboxBouton.override_background_color(:normal, Gdk::RGBA::new(0.6,1.0,0.6,1.0))

		event = Gtk::EventBox.new().add(Gtk::Image.new( :pixbuf => GdkPixbuf::Pixbuf.new(:file => "grille.png", :width => 432, :heigth => 432)))

		tableMain.attach(box        , 0,5,0,8) # Grille (Table)
		tableMain.attach(event      , 0,5,0,8) # Image  (Grille)
		tableMain.attach(@cadreAide , 5,9,0,8) # Aide
		tableMain.attach(hboxBouton , 0,9,8,9) # Boutons



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

	    tableGrille.children()[76].override_background_color(:normal, Gdk::RGBA::new(1.0,0.6,0.6,1.0))
	    tableGrille.children()[11].override_background_color(:normal, Gdk::RGBA::new(0.5,0.8,0.5,1.0))
	    tableGrille.children()[49].override_background_color(:normal, Gdk::RGBA::new(1.0,0.6,0.6,1.0))
	    tableGrille.children()[52].override_background_color(:normal, Gdk::RGBA::new(0.5,0.8,0.5,1.0))
	    tableGrille.children()[37].override_background_color(:normal, Gdk::RGBA::new(0.5,0.8,0.5,1.0))	    
	    tableGrille.children()[38].override_background_color(:normal, Gdk::RGBA::new(0.4,0.7,0.7,1.0))	
	    tableGrille.children()[42].override_background_color(:normal, Gdk::RGBA::new(1.0,0.6,0.6,1.0))    
	    tableGrille.children()[45].override_background_color(:normal, Gdk::RGBA::new(0.4,0.7,0.7,1.0))
	    tableGrille.children()[25].override_background_color(:normal, Gdk::RGBA::new(1.0,0.6,0.6,1.0))	    
	    tableGrille.children()[67].override_background_color(:normal, Gdk::RGBA::new(0.4,0.7,0.7,1.0))	

	    generator = Sudoku.new
	    generator.make_valid
	    generator.each { |x,y,val|  
	    	tableGrille.children()[81 - ((x+1)+(y*9))].children[0].set_markup("<span size=\"x-large\" font-weight=\"bold\">#{val}</span>")
	    	print 81 , "-", (x+1)+(y*9), "=", 81-((x+1)+(y*9)), "\n" 
	    }
	    # (x+1)+(y*9)
	    print generator
	    show_all
	    Gtk.main
	end

	def setAide(titre, listeCase, desc)
		titreFormat = "<span font-weight=\"bold\" size=\"x-large\" foreground=\"#200020\">"+titre+"</span>\n"
		listeCaseFormat = "<span font-style=\"italic\" size=\"large\" >Case:"+ (listeCase.empty? ? "Aucune" : listeCase.to_s) +"</span>\n"
		descFormat = "<span>"+desc+"</span>"
		@cadreAide.set_markup(titreFormat + listeCaseFormat + descFormat )
	end
end