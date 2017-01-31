require 'gtk2'

class Fenetre < Gtk::Window 
	Gtk.init
	def initialize ()
		super
		signal_connect "destroy" do
			Gtk.main_quit
		end

		# Property
		set_title "Sudoku Ultimate Premium Professional Edition (Version d'Evaluation)"
		set_default_size 800, 400

		#==========#
		# Niveau 1 #
		#==========#
		vboxMain = Gtk::VBox.new(false, 2) # Menu + Table pour Grille, Aide et bouton
		style = Gtk::RcStyle.new()
		style.set_bg(Gtk::STATE_NORMAL, 0, 60000, 0)
		vboxMain.modify_style(style)
	    add(vboxMain)


		#=========================# Note: Menu = Groupe de MenuItem une fois définie un submenu d'un autres MenuItem qui sert de titre
		# Creation Menu (à finir) # Exemple:  Fichier [Menu: (Nouveau, Sauvegarder, ...)]
		#=========================# Voir si on nomme les MenuItem "MI" pour faire plus propre

	    menuBar = Gtk::MenuBar.new # Barre du menu

	    # Menu Fichier
	    fileMenuItem = Gtk::MenuItem.new("Fichier") # Item Fichier
	    fileMenu = Gtk::Menu.new() # Menu de Fichier
	    fileMenuItem.set_submenu(fileMenu)

	        # Nouveau
	        nouveauMenuItem = Gtk::MenuItem.new("Nouveau")
	        fileMenu.append(nouveauMenuItem)
	        
	        # Sauvegarder
	        sauvergarderMenuItem = Gtk::MenuItem.new("Sauvegarder")
	        fileMenu.append(sauvergarderMenuItem)

	        # Fermer
	        fermerMenuItem = Gtk::MenuItem.new("Fermer")
            fermerMenuItem.signal_connect "activate" do
                Gtk.main_quit
            end
            fileMenu.add(fermerMenuItem)

        # Menu Option
	    menuBar.append(fileMenuItem)	
		
		#==========#
		# Niveau 2 #
		#==========#
	    vboxMain.pack_start(menuBar,false, false, 0)
	    tableMain = Gtk::Table.new(10, 10)
	    vboxMain.add(tableMain)
	   
		#==========#
		# Niveau 3 #
		#==========#

		# Grille de Sudoku
		tableGrille = Gtk::Table.new(9,9)
		#tableGrille.modify_bg(Gtk::STATE_NORMAL , Gdk::Color.new(0, 60000, 0))
	    # modify_bg(Gtk::STATE_NORMAL , Gdk::Color.new(0, 60000, 0))  # commande couleur
		
		# Cadre d'aide
		# ...

		# Panel des boutons numerique
		hboxBouton = Gtk::HBox.new # Pad numérique
		tableMain.attach(tableGrille, 0,4,0,7)
		tableMain.attach(hboxBouton, 0,9,7,9)

		#==========#
		# Niveau 4 #
		#==========#


	    btn1 = Gtk::Button.new('1')
	    btn2 = Gtk::Button.new('2')
	    btn3 = Gtk::Button.new('3')
	    btn4 = Gtk::Button.new('4')
	    btn5 = Gtk::Button.new('5')
	    btn6 = Gtk::Button.new('6')
	    btn7 = Gtk::Button.new('7')
	    btn8 = Gtk::Button.new('8')
	    btn9 = Gtk::Button.new('9')

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
end