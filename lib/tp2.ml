(*******************************************************************)
(* Langages de Programmation: IFT 3000 NRC 54959                   *)
(* TP2 ÉTÉ 2024. Date limite: Samedi 20 juillet à 17h00            *)
(* Enseignant: Mondher Bouden     IFT3000-MB@ift.ulaval.ca         *) 
(* Manipulation d'un reseau en utilisant un graphe                 *)
(*******************************************************************)
(* Étudiant(e):                                                    *)
(* NOM: _______________________ PRÉNOM:____________________________*) 
(* MATRICULE: _________________ PROGRAMME: _______________________ *)
(*                                                                 *)
(*******************************************************************)

open List
open Oo

(******************************************************************)
(* Fonctions fournies (vous pouvez en ajouter au besoin ...)      *)
(* ****************************************************************)

let appartient e l = exists (fun x -> x = e) l

let enlever e l = 
  let (_, l') = partition (fun x -> x = e) l
  in l'

let remplacer e e' l =
  map (fun x -> (if (x = e) then e' else x)) l

let null l = l = []

class ville (v:string) =
	object
		val nom_ville : string = v
		val mutable poids_dijkstra : float = max_float
			val mutable schemin_dijkstra : string list = []
		method get_nom_ville = nom_ville
		method get_poids = poids_dijkstra
		method set_poids (new_poids :float) = poids_dijkstra <- new_poids
		method get_schemin = schemin_dijkstra
		method set_schemin (new_schemin : string list) = schemin_dijkstra <- new_schemin
	end
					
class trajet (vd:string) (va: string) (cdollars: float) (dvheures: float) =
	object
		val nom_ville_depart : string = vd
		val nom_ville_arrivee : string = va
		val mutable cout_dollars : float = cdollars
		val mutable duree_vol_heures : float = dvheures
		method get_nom_ville_depart = nom_ville_depart
		method get_nom_ville_arrivee = nom_ville_arrivee
		method get_cout_dollars = cout_dollars
		method set_cout_dollars (cd : float) = cout_dollars <- cd
		method get_duree_vol_heures = duree_vol_heures
		method set_duree_vol_heures (dureevh : float) = duree_vol_heures <- dureevh
	end
					
class reseau (sr:string) = 
	object
		val sorte_reseau : string = sr
		method get_sorte_reseau = sorte_reseau
	end
					
class reseau_aerien (sr:string) (nr:string) = 
	object(self)
		inherit reseau sr as parent
		val nom_reseau : string = nr
		val mutable liste_villes : ville list = []
		val mutable liste_trajets : trajet list = []
		method get_nom_reseau = nom_reseau
		method get_liste_villes = liste_villes
		method get_liste_trajets = liste_trajets
		method set_liste_villes (lv : ville list) = liste_villes <- lv
		method set_liste_trajets (lt : trajet list) = liste_trajets <- lt
		initializer print_string ("Nouveau " ^ (parent#get_sorte_reseau) ^ ": " ^ 
								(self#get_nom_reseau)) ; print_newline()

		(* Méthodes à implanter *)

		(* ajouter_ville : string -> unit *)
		method ajouter_ville (nomv:string) = 
			()

		(* ville_existe : string -> bool  *)
		method ville_existe (nomv:string) = 
			true
	
		(* retourner_ville : string -> ville *)
		method retourner_ville (nomv:string) = 
			new ville ""
	
		(* trajet_existe : string -> string -> bool  *)
		method trajet_existe (vd:string) (va:string) = 
			true
	
		(* retourner_trajet : string -> string -> trajet  *)
		method retourner_trajet (vd:string) (va:string) = 
			new trajet "" "" 0.0 0.0
	
		(* supprimer_ville : string -> unit  *)
		method supprimer_ville (nomv:string) = 
			()
	
		(* ajouter_trajet : string -> string -> float -> float -> unit *)
		method ajouter_trajet (vd:string) (va:string) (cdollars:float) (dvheures:float) = 
			()
	
		(* supprimer_trajet: string -> string -> unit *)    
		method supprimer_trajet (vd:string) (va:string) = 
			()
	
		(* ajouter_liste_villes : string list -> unit *)
		method ajouter_liste_villes (lnv: string list) = 
			()
	
		(* ajouter_liste_trajets : (string * string * float * float) list -> unit *)
		method ajouter_liste_trajets (ltr: (string * string * float * float) list) = 
			()
	
		(* trier_villes : unit *)
		method trier_villes =
			()
	
		(* trier_trajets : unit *)
		method trier_trajets =
			()
	
		(* fermeture_transitive : 'a  *)
		method fermeture_transitive =
			copy self
	
		(* trouver_successeurs : ville -> ville list -> ville list  *)
		method trouver_successeurs (v:ville) (lv: ville list) = 
			lv
	
		(* chemin_existe : string -> string -> bool  *)
		method chemin_existe (vd:string) (va:string) = 
			true
	
		(* trouver_court_chemin : string -> string -> bool -> (string list * float) *)
		method trouver_court_chemin (vd:string) (va:string) (b:bool) =
			([""],0.0)
	
		(* afficher_reseau_aerien : unit  *)
		method afficher_reseau_aerien =
			()

	end