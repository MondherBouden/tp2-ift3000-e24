(*****************************************************************)
(** Langages de Programmation: IFT 3000 NRC 54959                 
    TP2 ÉTÉ 2024. Date limite: Samedi 20 juillet à 17h00               
    Manipulation d'un reseau en utilisant un graphe (POO)        *)
(*****************************************************************)
(*****************************************************************) 
(* Spécifications (Signature du réseau) 	                     *)  
(*****************************************************************)

(** {1 Interface des classes }*)

class ville : string ->
    object
        val nom_ville : string 
        val mutable poids_dijkstra : float
        val mutable schemin_dijkstra : string list
        method get_nom_ville : string
        method get_poids : float
        method set_poids : float -> unit
        method get_schemin : string list
        method set_schemin : string list -> unit
    end

class trajet : string -> string -> float -> float ->
    object
        val nom_ville_depart : string 
        val nom_ville_arrivee : string
        val mutable cout_dollars : float
        val mutable duree_vol_heures : float
        method get_nom_ville_depart : string
        method get_nom_ville_arrivee : string
        method get_cout_dollars : float
        method set_cout_dollars : float -> unit
        method get_duree_vol_heures : float
        method set_duree_vol_heures : float -> unit
    end

class reseau : string ->
    object
        val sorte_reseau : string 
        method get_sorte_reseau : string
    end

class reseau_aerien : string -> string ->
    object ('a)
        inherit reseau
        val nom_reseau : string
        val mutable liste_villes : ville list
        val mutable liste_trajets : trajet list
        method get_nom_reseau : string
        method get_liste_villes : ville list
        method set_liste_villes : ville list -> unit
        method get_liste_trajets : trajet list
        method set_liste_trajets : trajet list -> unit	

        method ajouter_ville : string -> unit
        (** [ajouter_ville nv] 
            Cette méthode prend le nom d'une ville nv et va mettre à jour le réseau. 
            Elle doit retourner un réseau inchangé si la ville est déjà dans le réseau. 
            De ce fait, on ne rajoute pas de doublons dans le réseau.

            Exemple:
        {[# r#ajouter_ville "Quebec";;]}
        *)

        method ville_existe : string -> bool
        (** [ville_existe nv] 
            Cette méthode retourne true si la ville existe dans le réseau, false sinon.

            Exemple:
        {[# r#ville_existe "Quebec";;]}
        *)

        method retourner_ville : string -> ville
        (** [retourner_ville nv] 
            Cette méthode prend nv le nom d'une ville et retourne l'objet ville se trouvant dans le réseau.
            Si la ville n'existe pas dans le réseau, elle doit invoquer failwith "Le reseau ne contient pas cette ville".

            Exemple:
        {[# r#retourner_ville "Quebec";;]}
        *)

        method ajouter_trajet : string -> string -> float -> float -> unit
        (** [ajouter_trajet vd va cd d] 
            Cette méthode prend le nom d'une ville de départ vd et d'une ville d'arrivée va 
            ainsi que le coût en dollars cd et la durée du trajet d et doit ajouter le trajet dans le réseau. 
            Si une des villes n'existe pas dans le réseau, elle doit invoquer failwith "Au moins une des deux villes du trajet n'est pas dans le reseau".
            Elle ne doit pas changer le réseau si le trajet existe déjà.
            
            Exemple:
        {[# r#ajouter_trajet "Quebec" "Montreal" 203.54 0.75;;]}
        *)

        method trajet_existe : string -> string -> bool
        (** [trajet_existe nv] 
            Cette méthode retourne true si le trajet existe dans le réseau, false sinon.

            Exemple:
        {[# r#trajet_existe "Quebec" "Montreal";;]}
        *)

        method retourner_trajet : string -> string -> trajet
         (** [retourner_trajet vd va] 
            Cette méthode prend le nom d'une ville de départ vd et d'une ville d'arrivée va et retourne l'objet trajet se trouvant dans le réseau.
            Si la trajet n'existe pas dans le réseau, elle doit invoquer failwith "Le reseau ne contient pas ce trajet".

            Exemple:
        {[# r#retourner_trajet "Quebec" "Montreal";;]}
        *)

        method supprimer_ville : string -> unit
        (** [supprimer_ville nv] 
            Cette méthode prend le nom d'une ville nv et va mettre à jour le réseau 
            en supprimant la ville qui n'est plus desservie par la compagnie aérienne, 
            ainsi que toutes les références à cette ville dans la liste des successeurs de toutes les autres villes. 
            Cette méthode retourne un message d’erreur si le réseau est vide 
            ou si le réseau ne contient pas la ville à supprimer.

            Exemple:
        {[# r#supprimer_ville "Montreal";;]}
        *)

        method supprimer_trajet : string -> string -> unit
        (** [supprimer_trajet vd va] 
            Cette méthode prend le nom d'une ville de départ vd et d'une ville d'arrivée va et supprime le trajet du réseau. 
            En fait, ceci veut dire que la compagnie aérienne n'offre plus ce trajet. 
            Cette méthode retourne un message d’erreur si le réseau est vide ou si le réseau ne contient pas une des villes 
            formant le trajet à supprimer.

            Exemple:
        {[# r#supprimer_trajet "Quebec" "Chicago";;]}
        *)

        method ajouter_liste_villes : string list -> unit
        (** [ajouter_liste_villes lv] 
            Cette méthode prend une liste de noms de villes lv et va mettre à jour le réseau 
            dans lequel toutes les villes ont été ajoutées dans ce réseau.
            Elle doit utiliser la méthode ajouter_ville().

            Exemple:
        {[# r#ajouter_liste_villes ["Sherbrouke"; "Chicoutimi"; "Paris"; 
			"La_Havane"; "Detroit"; "Ottawa"; 
			"Vancouver"; "Toronto"; "Bogota"; 
			"Bruxelles"; "Bujumbura"; "Iqaluit"; 
			"Chicago"; "Tokyo"; "Auckland"; 
			"New_York"; "Singapour"];;]}
        *)

        method ajouter_liste_trajets : (string * string * float * float) list -> unit
        (** [ajouter_liste_trajets lt] 
            Cette méthode prend une liste de quadruplet représentant les informations des trajets et va mettre à jour le réseau  
            dans lequel tous les trajets ont été ajoutés dans ce réseau.
            Elle doit utiliser la méthode ajouter_trajet().

            Exemple:
        {[# r#ajouter_liste_trajets [("Montreal", "Quebec", 149.78, 0.83);
			 ("Montreal", "Paris", 591.96, 6.27);
			 ("Montreal", "New_York", 402.78, 1.91); 
			 ("Paris", "Montreal", 892.39, 6.32);
			 ("Quebec", "La_Havane", 492.21, 3.34);
			 ("Montreal", "Detroit", 699.74, 1.25);
			 ("Montreal", "Ottawa", 192.46, 0.66);
			 ("Montreal", "Vancouver", 639.74, 4.75);
			 ("Toronto", "Bogota", 902.15, 5.42);
			 ("Montreal", "Toronto", 321.98, 1.32);
			 ("Vancouver", "Toronto", 621.46, 3.87);
			 ("Montreal", "Bruxelles", 823.96, 6.87);
			 ("Bruxelles", "Bujumbura", 973.05, 5.27);
			 ("Ottawa", "Iqaluit", 727.74, 3.21);
			 ("Quebec", "Chicago", 620.78, 2.08);
			 ("Vancouver", "Tokyo", 1276.42, 8.65);
			 ("Vancouver", "Auckland", 2351.71, 13.15);
			 ("Chicago", "Vancouver", 1521.44, 4.78);
			 ("Bujumbura", "Bruxelles", 937.46, 7.26)];;]}
        *)

        method trier_villes : unit
        (** [trier_villes] 
            Cette méthode fait en sorte de trier en ordre croissant les villes qui sont contenues dans la liste de villes du réseau. 
            Cette méthode retourne unit car elle fait la mise à jour du réseau. 
            Nous vous conseillons d’utiliser la fonction List.sort en implantant une fonction locale comparer_villes 
            qui prend deux villes et qui retourne 0 si les deux villes sont égales, 1 si la première ville est plus grande (en ordre alphabétique) que la deuxième et -1 sinon.

            Exemple:
        {[# r#trier_villes;;]}
        *)

        method trier_trajets : unit
        (** [trier_trajets] 
            Cette méthode fait le tri en ordre croissant des trajets. 
            Nous vous conseillons d’utiliser également la fonction List.sort en implantant une fonction locale comparer_trajets 
            qui prend deux trajets et qui retourne 0 si la concaténation des noms des villes de départ et d’arrivée du premier trajet est égale à celle du deuxième trajet. 
            Sinon, il faut retourner 1 ou -1 comme dans la fonction comparer_villes.

            Exemple:
        {[# r#trier_trajets;;]}
        *)

        method fermeture_transitive : 'a
        (** [fermeture_transitive] 
            Cette méthode retourne un type 'a qui a le même type que l’objet courant 
            représentant une copie d’un reseau_aerien contenant tous les chemins possibles. 
            On vous donne ici une méthode itérative pour l'implanter, mais libre à vous d'opter pour une façon différente comme la méthode récursive du TP1 :
            a.	Créer une copie du réseau en utilisant self. Nous vous conseillons d’utiliser la fonction Oo.copy (< .. > as 'a) -> 'a).
            b.	Utiliser trois boucles imbriquées comme ceci :
                De k = 0 à nb_villes -1 faire
                    De j = 0 à nb_villes – 1 faire
                        De i = 0 à nb-villes -1 faire
                            Si le trajet n'existe pas entre i et j alors
                                Si les trajets existent entre (i, k) et (k, j) alors
                                    Ajouter le trajet entre i et j en faisant la somme des couts en dollars et la somme des durées du vol en heures. 
                                    Il ne faut pas ajouter les chemins qui ont une ville de départ et une ville d'arrivée identiques.
            c.	Retourner la copie du réseau modifié.

            Exemple:
        {[# r#fermeture_transitive;;]}
        *)

        method trouver_successeurs : ville -> ville list -> ville list
        (** [trouver_successeurs v lv] 
            Cette méthode prend une ville v ainsi qu'une liste de villes lv et retourne la liste des successeurs 
            de v se trouvant dans lv. Vous pouvez utiliser cette méthode pour implanter trouver_court_chemin.

            Exemple:
        {[# r#trouver_successeurs (r#retourner_ville "Montreal") (r#get_liste_villes);;]}
        *)

        method chemin_existe : string -> string -> bool
         (** [chemin_existe v lv] 
            Cette méthode retourne true si un chemin existe entre une ville de départ et une ville d’arrivée, false sinon.
            Nous vous demandons d’utiliser fermeture_transitive et trajet_existe pour implanter cette méthode. 
            Vous pouvez également utiliser cette méthode pour implanter trouver_court_chemin.

            Exemple:
        {[# r#chemin_existe "Paris" "Bogota";;]}
        *)

        method trouver_court_chemin : string -> string -> bool -> (string list * float)
          (** [trouver_court_chemin vd va b] 
            Cette méthode prend le nom d'une ville de départ vd, le nom d'une ville d'arrivée va et un booléen 
            (égale soit à true si on veut utiliser les couts en dollars, 
            soit à false si on veut utiliser la durée du vol en heures pour calculer le chemin) et retourne 
            une paire contenant une liste de chaînes de caractères représentant le plus court chemin entre va et vb et un float 
            représentant la somme des pondérations (couts ou durées) du chemin en question. 
            Nous vous suggérons d'ailleurs l'utilisation de l'algorithme de Dijkstra vu dans le cours IFT-2008 ou GLO-2100.
            https://fr.wikipedia.org/wiki/Algorithme_de_Dijkstra

            Exemple:
        {[# r#trouver_court_chemin "Quebec" "Bujumbura" cdollars;;]}
        *)

        method afficher_reseau_aerien : unit
        (** [afficher_reseau_aerien] 
            Cette méthode affiche les villes ainsi que les trajets du réseau.
            Veuillez consulter le fichier "testeur.ml" ainsi que l'énoncé pour savoir le format de sortie de cette méthode.

            Exemple:
        {[# r#afficher_reseau_aerien;;]}
        *)
    end