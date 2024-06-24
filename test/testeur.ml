(* -------------------------------------------------------------------------- *)
(* ----------------------- TP2 - IFT-3000 - ÉTÉ 2024 -----------  ----------- *)
(* -------------------------------------------------------------------------- *)
(** Fichier permettant de tester les fonctions implémentées du TP             *)
(* -------------------------------------------------------------------------- *)

open Tp2

let r = new reseau_aerien "Reseau Aerien" "AirCanada";;

(* 
Nouveau Reseau Aerien: AirCanada
val r : reseau_aerien = <obj> 
*)

r#ajouter_ville "Quebec";;

(* - : unit = () *)

r#ville_existe "Quebec";;

(* - : bool = true *)

let v = r#retourner_ville "Quebec";;
print_endline ("Ville retournee = " ^ v#get_nom_ville);;

(* 
val v : ville = <obj>
val s : string = "Quebec"
*)

r#ajouter_ville "Montreal";;

(* - : unit = () *)

r#ajouter_trajet "Quebec" "Montreal" 203.54 0.75;;

(* - : unit = () *)

r#trajet_existe "Quebec" "Montreal";;

(* - : bool = true *)

let t = r#retourner_trajet "Quebec" "Montreal";;
print_endline ("Trajet retoune: " ^ t#get_nom_ville_depart ^ " -> " ^ t#get_nom_ville_arrivee);;

(* 
- : trajet = <obj> 
val vd : string = "Quebec"
val va : string = "Montreal"
*)

r#ajouter_liste_villes ["Sherbrouke"; "Chicoutimi"; "Paris"; 
			"La_Havane"; "Detroit"; "Ottawa"; 
			"Vancouver"; "Toronto"; "Bogota"; 
			"Bruxelles"; "Bujumbura"; "Iqaluit"; 
			"Chicago"; "Tokyo"; "Auckland"; 
			"New_York"; "Singapour"];;

(* - : unit = () *)

print_endline ("\nAffichage du reseau:");;
r#afficher_reseau_aerien;;

(* 
Affichage du reseau:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Singapour, New_York, Auckland, Tokyo, Chicago, Iqaluit, Bujumbura, Bruxelles, Bogota, Toronto, Vancouver, Ottawa, Detroit, La_Havane, Paris, Chicoutimi, Sherbrouke, Montreal, Quebec
Nombre des trajets : 1
Liste des trajets : 
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75

- : unit = ()
*)

r#trier_villes;;

(* - : unit = () *)

print_endline ("Affichage du reseau apres le tri:");;
r#afficher_reseau_aerien;;

(* 
Affichage du reseau apres le tri:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 1
Liste des trajets : 
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75

- : unit = () *)

r#ajouter_liste_trajets [("Montreal", "Quebec", 149.78, 0.83);
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
			 ("Bujumbura", "Bruxelles", 937.46, 7.26)];;

(* - : unit = () *)

print_endline ("Affichage du reseau:");;
r#afficher_reseau_aerien;;

(* 
Affichage du reseau:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 20
Liste des trajets : 
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75

- : unit = () *)

r#trier_trajets;;

(* - : unit = () *)

print_endline ("Affichage du reseau apres le tri:");;
r#afficher_reseau_aerien;;

(* 
Affichage du reseau apres le tri:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 20
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

- : unit = () *)

let ft = r#fermeture_transitive;;

(* val ft : reseau_aerien = <obj>  *)

print_endline ("Affichage de la fermeture du reseau:");;
ft#afficher_reseau_aerien;; 

(* 
Affichage de la fermeture du reseau:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 58
Liste des trajets : 
Chicago -> Toronto : cout en dollars = 2142.9 , duree du vol = 8.65
Quebec -> Tokyo : cout en dollars = 3418.64 , duree du vol = 15.51
Paris -> Tokyo : cout en dollars = 2808.55 , duree du vol = 19.72
Montreal -> Tokyo : cout en dollars = 1916.16 , duree du vol = 13.4
Chicago -> Tokyo : cout en dollars = 2797.86 , duree du vol = 13.43
Chicago -> Bogota : cout en dollars = 3045.05 , duree du vol = 14.07
Quebec -> Auckland : cout en dollars = 4493.93 , duree du vol = 20.01
Paris -> Auckland : cout en dollars = 3883.84 , duree du vol = 24.22
Montreal -> Auckland : cout en dollars = 2991.45 , duree du vol = 17.9
Chicago -> Auckland : cout en dollars = 3873.15 , duree du vol = 17.93
Vancouver -> Bogota : cout en dollars = 1523.61 , duree du vol = 9.29
Quebec -> Bogota : cout en dollars = 1427.67 , duree du vol = 7.49
Paris -> Bogota : cout en dollars = 2116.52 , duree du vol = 13.06
Montreal -> Bogota : cout en dollars = 1224.13 , duree du vol = 6.74
Paris -> La_Havane : cout en dollars = 1534.38 , duree du vol = 10.49
Montreal -> La_Havane : cout en dollars = 641.99 , duree du vol = 4.17
Paris -> Chicago : cout en dollars = 1662.95 , duree du vol = 9.23
Montreal -> Chicago : cout en dollars = 770.56 , duree du vol = 2.91
Quebec -> Iqaluit : cout en dollars = 1123.74 , duree du vol = 4.62
Paris -> Iqaluit : cout en dollars = 1812.59 , duree du vol = 10.19
Montreal -> Iqaluit : cout en dollars = 920.2 , duree du vol = 3.87
Paris -> Vancouver : cout en dollars = 1532.13 , duree du vol = 11.07
Quebec -> Toronto : cout en dollars = 525.52 , duree du vol = 2.07
Paris -> Toronto : cout en dollars = 1214.37 , duree du vol = 7.64
Paris -> Quebec : cout en dollars = 1042.17 , duree du vol = 7.15
Quebec -> Paris : cout en dollars = 795.5 , duree du vol = 7.02
Quebec -> Ottawa : cout en dollars = 396. , duree du vol = 1.41
Paris -> Ottawa : cout en dollars = 1084.85 , duree du vol = 6.98
Quebec -> New_York : cout en dollars = 606.32 , duree du vol = 2.66
Paris -> New_York : cout en dollars = 1295.17 , duree du vol = 8.23
Quebec -> Detroit : cout en dollars = 903.28 , duree du vol = 2.
Paris -> Detroit : cout en dollars = 1592.13 , duree du vol = 7.57
Quebec -> Bujumbura : cout en dollars = 2000.55 , duree du vol = 12.89
Paris -> Bujumbura : cout en dollars = 2689.4 , duree du vol = 18.46
Quebec -> Bruxelles : cout en dollars = 1027.5 , duree du vol = 7.62
Paris -> Bruxelles : cout en dollars = 1716.35 , duree du vol = 13.19
Quebec -> Vancouver : cout en dollars = 2142.22 , duree du vol = 6.86
Montreal -> Bujumbura : cout en dollars = 1797.01 , duree du vol = 12.14
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

- : unit = () *)

ft#trier_villes; ft#trier_trajets;;

(* - : unit = () *)

print_endline ("Affichage de la fermeture du reseau apres le tri:");;
ft#afficher_reseau_aerien;;

(* 
Affichage de la fermeture du reseau apres le tri:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 58
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Auckland : cout en dollars = 3873.15 , duree du vol = 17.93
Chicago -> Bogota : cout en dollars = 3045.05 , duree du vol = 14.07
Chicago -> Tokyo : cout en dollars = 2797.86 , duree du vol = 13.43
Chicago -> Toronto : cout en dollars = 2142.9 , duree du vol = 8.65
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Montreal -> Auckland : cout en dollars = 2991.45 , duree du vol = 17.9
Montreal -> Bogota : cout en dollars = 1224.13 , duree du vol = 6.74
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Montreal -> Bujumbura : cout en dollars = 1797.01 , duree du vol = 12.14
Montreal -> Chicago : cout en dollars = 770.56 , duree du vol = 2.91
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Montreal -> Iqaluit : cout en dollars = 920.2 , duree du vol = 3.87
Montreal -> La_Havane : cout en dollars = 641.99 , duree du vol = 4.17
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Montreal -> Tokyo : cout en dollars = 1916.16 , duree du vol = 13.4
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Paris -> Auckland : cout en dollars = 3883.84 , duree du vol = 24.22
Paris -> Bogota : cout en dollars = 2116.52 , duree du vol = 13.06
Paris -> Bruxelles : cout en dollars = 1716.35 , duree du vol = 13.19
Paris -> Bujumbura : cout en dollars = 2689.4 , duree du vol = 18.46
Paris -> Chicago : cout en dollars = 1662.95 , duree du vol = 9.23
Paris -> Detroit : cout en dollars = 1592.13 , duree du vol = 7.57
Paris -> Iqaluit : cout en dollars = 1812.59 , duree du vol = 10.19
Paris -> La_Havane : cout en dollars = 1534.38 , duree du vol = 10.49
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Paris -> New_York : cout en dollars = 1295.17 , duree du vol = 8.23
Paris -> Ottawa : cout en dollars = 1084.85 , duree du vol = 6.98
Paris -> Quebec : cout en dollars = 1042.17 , duree du vol = 7.15
Paris -> Tokyo : cout en dollars = 2808.55 , duree du vol = 19.72
Paris -> Toronto : cout en dollars = 1214.37 , duree du vol = 7.64
Paris -> Vancouver : cout en dollars = 1532.13 , duree du vol = 11.07
Quebec -> Auckland : cout en dollars = 4493.93 , duree du vol = 20.01
Quebec -> Bogota : cout en dollars = 1427.67 , duree du vol = 7.49
Quebec -> Bruxelles : cout en dollars = 1027.5 , duree du vol = 7.62
Quebec -> Bujumbura : cout en dollars = 2000.55 , duree du vol = 12.89
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> Detroit : cout en dollars = 903.28 , duree du vol = 2.
Quebec -> Iqaluit : cout en dollars = 1123.74 , duree du vol = 4.62
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75
Quebec -> New_York : cout en dollars = 606.32 , duree du vol = 2.66
Quebec -> Ottawa : cout en dollars = 396. , duree du vol = 1.41
Quebec -> Paris : cout en dollars = 795.5 , duree du vol = 7.02
Quebec -> Tokyo : cout en dollars = 3418.64 , duree du vol = 15.51
Quebec -> Toronto : cout en dollars = 525.52 , duree du vol = 2.07
Quebec -> Vancouver : cout en dollars = 2142.22 , duree du vol = 6.86
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Bogota : cout en dollars = 1523.61 , duree du vol = 9.29
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

- : unit = () 
*)

let cdollars = true;;
let theures = false;;

(* 
val cdollars : bool = true
val theures : bool = false
*)

let lsucc = r#trouver_successeurs (r#retourner_ville "Montreal") (r#get_liste_villes);;
print_string "Liste de successeurs de la ville de Montreal: ";;
List.iteri (fun i v -> let s = (if (i = (List.length lsucc) - 1) then "" else ", ") in print_string (v#get_nom_ville ^ s)) lsucc;;

(*
val lsucc : ville list = [<obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>]
Liste de successeurs de la ville de Montreal: Bruxelles, Detroit, New_York, Ottawa, Paris, Quebec, Toronto, Vancouver 
- : unit = () 
*)

let s = if (r#chemin_existe "Paris" "Bogota") then "Il existe " else "Il n'existe pas " in 
print_endline ("\n" ^ s ^ "un chemin entre Paris et Bogota");;

(* 
Il existe un chemin entre Paris et Bogota
- : unit = ()  
*)

let s = if (r#chemin_existe "Vancouver" "Bujumbura") then "Il existe " else "Il n'existe pas " in 
print_endline (s ^ "un chemin entre Vancouver et Bujumbura");;

(* 
Il n'existe pas un chemin entre Vancouver et Bujumbura
- : unit = ()  
*) 

let chcd = r#trouver_court_chemin "Quebec" "Bujumbura" cdollars;;
print_string "Plus court chemin entre Quebec et Bujumbura: ";;
List.iteri (fun i v -> let s = (if (i = (List.length (fst chcd)) - 1) then "" else ", ") in print_string (v ^ s)) (fst chcd);;
print_string "\nCout total en dollars: "; print_float (snd chcd);;

(*
Plus court chemin entre Quebec et Bujumbura: Quebec, Montreal, Bruxelles, Bujumbura
Cout total en dollars: 2000.55
- : unit = () 
*)

let chcd = r#trouver_court_chemin "Quebec" "Bujumbura" theures;;
print_string "\nCout total en heures: "; print_float (snd chcd);;

(*
Cout total en heures: 12.89
- : unit = () 
*)

let chcd = r#trouver_court_chemin "Paris" "Bogota" cdollars;;
print_string "\nPlus court chemin entre Paris et Bogota: ";;
List.iteri (fun i v -> let s = (if (i = (List.length (fst chcd)) - 1) then "" else ", ") in print_string (v ^ s)) (fst chcd);;
print_string "\nCout total en dollars: "; print_float (snd chcd);;

(*
Plus court chemin entre Paris et Bogota: Paris, Montreal, Toronto, Bogota
Cout total en dollars: 2116.52
- : unit = ()
*)

let chcd = r#trouver_court_chemin "Paris" "Bogota" theures;;
print_string "\nCout total en heures: "; print_float (snd chcd);;

(*
Cout total en heures: 13.06
- : unit = ()
*)

(*************************************************************)
(* Verification d'autres fonctions et des messages d'erreurs *)
(*************************************************************)

r#supprimer_ville "Montreal";;

(* - : unit = () *)

print_endline ("\n\nAffichage du reseau apres la suppression de Montreal:");;
r#afficher_reseau_aerien;;

(* 
Affichage du reseau apres la suppression de Montreal:
Reseau Aerien: AirCanada
Nombre des villes : 18
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 10
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

- : unit = () *)

r#supprimer_trajet "Quebec" "Chicago";;

(* - : unit = () *)

print_endline ("Affichage du reseau apres la suppression du trajet Quebec -> Chicago:");;
r#afficher_reseau_aerien;;

(* 
Affichage du reseau apres la suppression du trajet Quebec -> Chicago:
Reseau Aerien: AirCanada
Nombre des villes : 18
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 9
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

- : unit = () 
*)

print_endline "Verification des messages d'erreurs:";;
try r#supprimer_ville "VilleExistePas"
with Failure s -> print_string (s ^ "\n");; 

(*
Le reseau ne contient pas cette ville
- : unit = () 
*)

try r#supprimer_trajet "Quebec" "VilleExistePas"
with Failure s -> print_string (s ^ "\n");;

(* 
Le reseau ne contient pas ce trajet
- : unit = () 
*)

try ignore(r#retourner_ville "VilleExistePas")
with Failure s -> print_string (s ^ "\n");;

(* 
Le reseau ne contient pas cette ville
- : unit = () 
*)

try ignore(r#retourner_trajet "Quebec" "VilleExistePas")
with Failure s -> print_string (s ^ "\n");;

(* 
Le reseau ne contient pas ce trajet
- : unit = () 
*)

try r#ajouter_trajet "Quebec" "VilleExistePas" 203.54 0.75
with Failure s -> print_string (s ^ "\n");;

(* 
Au moins une des deux villes du trajet n'est pas dans le reseau
- : unit = () 
*)

try ignore(r#trouver_court_chemin "Vancouver" "Bujumbura" theures)
with Failure s -> print_string (s ^ "\n");;

(*
Ce chemin n'existe pas 
- : unit = ()
*)

try (new reseau_aerien "Reseau Aerien" "AirTransat")#afficher_reseau_aerien
with Failure s -> print_string (s ^ "\n");;

(* 
Nouveau Reseau Aerien: AirTransat
Le reseau est vide
- : unit = () 
*)

(* -------------------------------------------------------------------------- *)
(*Résultat sur la console avec la version remise et donc non complétée:

dune runtest

Nouveau Reseau Aerien: AirCanada   
Ville retournee = 
Trajet retoune:  -> 

Affichage du reseau:
Affichage du reseau apres le tri:
Affichage du reseau:
Affichage du reseau apres le tri:
Affichage de la fermeture du reseau:
Affichage de la fermeture du reseau apres le tri:
Liste de successeurs de la ville de Montreal: 
Il existe un chemin entre Paris et Bogota
Il existe un chemin entre Vancouver et Bujumbura
Plus court chemin entre Quebec et Bujumbura: 
Cout total en dollars: 0.
Cout total en heures: 0.
Plus court chemin entre Paris et Bogota: 
Cout total en dollars: 0.
Cout total en heures: 0.

Affichage du reseau apres la suppression de Montreal:
Affichage du reseau apres la suppression du trajet Quebec -> Chicago:
Verification des messages d'erreurs:
Nouveau Reseau Aerien: AirTransat

(* -------------------------------------------------------------------------- *)
Résultat sur la console avec la version du corrigé:

dune runtest

Nouveau Reseau Aerien: AirCanada   
Ville retournee = Quebec
Trajet retoune: Quebec -> Montreal

Affichage du reseau:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Singapour, New_York, Auckland, Tokyo, Chicago, Iqaluit, Bujumbura, Bruxelles, Bogota, Toronto, Vancouver, Ottawa, Detroit, La_Havane, Paris, Chicoutimi, Sherbrouke, Montreal, Quebec
Nombre des trajets : 1
Liste des trajets : 
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75

Affichage du reseau apres le tri:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 1
Liste des trajets : 
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75

Affichage du reseau:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 20
Liste des trajets : 
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75

Affichage du reseau apres le tri:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 20
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

Affichage de la fermeture du reseau:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 58
Liste des trajets : 
Chicago -> Toronto : cout en dollars = 2142.9 , duree du vol = 8.65
Quebec -> Tokyo : cout en dollars = 3418.64 , duree du vol = 15.51
Paris -> Tokyo : cout en dollars = 2808.55 , duree du vol = 19.72
Montreal -> Tokyo : cout en dollars = 1916.16 , duree du vol = 13.4
Chicago -> Tokyo : cout en dollars = 2797.86 , duree du vol = 13.43
Chicago -> Bogota : cout en dollars = 3045.05 , duree du vol = 14.07
Quebec -> Auckland : cout en dollars = 4493.93 , duree du vol = 20.01
Paris -> Auckland : cout en dollars = 3883.84 , duree du vol = 24.22
Montreal -> Auckland : cout en dollars = 2991.45 , duree du vol = 17.9
Chicago -> Auckland : cout en dollars = 3873.15 , duree du vol = 17.93
Vancouver -> Bogota : cout en dollars = 1523.61 , duree du vol = 9.29
Quebec -> Bogota : cout en dollars = 1427.67 , duree du vol = 7.49
Paris -> Bogota : cout en dollars = 2116.52 , duree du vol = 13.06
Montreal -> Bogota : cout en dollars = 1224.13 , duree du vol = 6.74
Paris -> La_Havane : cout en dollars = 1534.38 , duree du vol = 10.49
Montreal -> La_Havane : cout en dollars = 641.99 , duree du vol = 4.17
Paris -> Chicago : cout en dollars = 1662.95 , duree du vol = 9.23
Montreal -> Chicago : cout en dollars = 770.56 , duree du vol = 2.91
Quebec -> Iqaluit : cout en dollars = 1123.74 , duree du vol = 4.62
Paris -> Iqaluit : cout en dollars = 1812.59 , duree du vol = 10.19
Montreal -> Iqaluit : cout en dollars = 920.2 , duree du vol = 3.87
Paris -> Vancouver : cout en dollars = 1532.13 , duree du vol = 11.07
Quebec -> Toronto : cout en dollars = 525.52 , duree du vol = 2.07
Paris -> Toronto : cout en dollars = 1214.37 , duree du vol = 7.64
Paris -> Quebec : cout en dollars = 1042.17 , duree du vol = 7.15
Quebec -> Paris : cout en dollars = 795.5 , duree du vol = 7.02
Quebec -> Ottawa : cout en dollars = 396. , duree du vol = 1.41
Paris -> Ottawa : cout en dollars = 1084.85 , duree du vol = 6.98
Quebec -> New_York : cout en dollars = 606.32 , duree du vol = 2.66
Paris -> New_York : cout en dollars = 1295.17 , duree du vol = 8.23
Quebec -> Detroit : cout en dollars = 903.28 , duree du vol = 2.
Paris -> Detroit : cout en dollars = 1592.13 , duree du vol = 7.57
Quebec -> Bujumbura : cout en dollars = 2000.55 , duree du vol = 12.89
Paris -> Bujumbura : cout en dollars = 2689.4 , duree du vol = 18.46
Quebec -> Bruxelles : cout en dollars = 1027.5 , duree du vol = 7.62
Paris -> Bruxelles : cout en dollars = 1716.35 , duree du vol = 13.19
Quebec -> Vancouver : cout en dollars = 2142.22 , duree du vol = 6.86
Montreal -> Bujumbura : cout en dollars = 1797.01 , duree du vol = 12.14
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

Affichage de la fermeture du reseau apres le tri:
Reseau Aerien: AirCanada
Nombre des villes : 19
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, Montreal, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 58
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Auckland : cout en dollars = 3873.15 , duree du vol = 17.93
Chicago -> Bogota : cout en dollars = 3045.05 , duree du vol = 14.07
Chicago -> Tokyo : cout en dollars = 2797.86 , duree du vol = 13.43
Chicago -> Toronto : cout en dollars = 2142.9 , duree du vol = 8.65
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Montreal -> Auckland : cout en dollars = 2991.45 , duree du vol = 17.9
Montreal -> Bogota : cout en dollars = 1224.13 , duree du vol = 6.74
Montreal -> Bruxelles : cout en dollars = 823.96 , duree du vol = 6.87
Montreal -> Bujumbura : cout en dollars = 1797.01 , duree du vol = 12.14
Montreal -> Chicago : cout en dollars = 770.56 , duree du vol = 2.91
Montreal -> Detroit : cout en dollars = 699.74 , duree du vol = 1.25
Montreal -> Iqaluit : cout en dollars = 920.2 , duree du vol = 3.87
Montreal -> La_Havane : cout en dollars = 641.99 , duree du vol = 4.17
Montreal -> New_York : cout en dollars = 402.78 , duree du vol = 1.91
Montreal -> Ottawa : cout en dollars = 192.46 , duree du vol = 0.66
Montreal -> Paris : cout en dollars = 591.96 , duree du vol = 6.27
Montreal -> Quebec : cout en dollars = 149.78 , duree du vol = 0.83
Montreal -> Tokyo : cout en dollars = 1916.16 , duree du vol = 13.4
Montreal -> Toronto : cout en dollars = 321.98 , duree du vol = 1.32
Montreal -> Vancouver : cout en dollars = 639.74 , duree du vol = 4.75
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Paris -> Auckland : cout en dollars = 3883.84 , duree du vol = 24.22
Paris -> Bogota : cout en dollars = 2116.52 , duree du vol = 13.06
Paris -> Bruxelles : cout en dollars = 1716.35 , duree du vol = 13.19
Paris -> Bujumbura : cout en dollars = 2689.4 , duree du vol = 18.46
Paris -> Chicago : cout en dollars = 1662.95 , duree du vol = 9.23
Paris -> Detroit : cout en dollars = 1592.13 , duree du vol = 7.57
Paris -> Iqaluit : cout en dollars = 1812.59 , duree du vol = 10.19
Paris -> La_Havane : cout en dollars = 1534.38 , duree du vol = 10.49
Paris -> Montreal : cout en dollars = 892.39 , duree du vol = 6.32
Paris -> New_York : cout en dollars = 1295.17 , duree du vol = 8.23
Paris -> Ottawa : cout en dollars = 1084.85 , duree du vol = 6.98
Paris -> Quebec : cout en dollars = 1042.17 , duree du vol = 7.15
Paris -> Tokyo : cout en dollars = 2808.55 , duree du vol = 19.72
Paris -> Toronto : cout en dollars = 1214.37 , duree du vol = 7.64
Paris -> Vancouver : cout en dollars = 1532.13 , duree du vol = 11.07
Quebec -> Auckland : cout en dollars = 4493.93 , duree du vol = 20.01
Quebec -> Bogota : cout en dollars = 1427.67 , duree du vol = 7.49
Quebec -> Bruxelles : cout en dollars = 1027.5 , duree du vol = 7.62
Quebec -> Bujumbura : cout en dollars = 2000.55 , duree du vol = 12.89
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> Detroit : cout en dollars = 903.28 , duree du vol = 2.
Quebec -> Iqaluit : cout en dollars = 1123.74 , duree du vol = 4.62
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Quebec -> Montreal : cout en dollars = 203.54 , duree du vol = 0.75
Quebec -> New_York : cout en dollars = 606.32 , duree du vol = 2.66
Quebec -> Ottawa : cout en dollars = 396. , duree du vol = 1.41
Quebec -> Paris : cout en dollars = 795.5 , duree du vol = 7.02
Quebec -> Tokyo : cout en dollars = 3418.64 , duree du vol = 15.51
Quebec -> Toronto : cout en dollars = 525.52 , duree du vol = 2.07
Quebec -> Vancouver : cout en dollars = 2142.22 , duree du vol = 6.86
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Bogota : cout en dollars = 1523.61 , duree du vol = 9.29
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

Liste de successeurs de la ville de Montreal: Bruxelles, Detroit, New_York, Ottawa, Paris, Quebec, Toronto, VancouverIl existe un chemin entre Paris et Bogota
Il existe un chemin entre Paris et Bogota
Il n'existe pas un chemin entre Vancouver et Bujumbura
Plus court chemin entre Quebec et Bujumbura: Quebec, Montreal, Bruxelles, Bujumbura
Cout total en dollars: 2000.55
Cout total en heures: 12.89
Plus court chemin entre Paris et Bogota: Paris, Montreal, Toronto, Bogota
Cout total en dollars: 2116.52
Cout total en heures: 13.06

Affichage du reseau apres la suppression de Montreal:
Reseau Aerien: AirCanada
Nombre des villes : 18
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 10
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Quebec -> Chicago : cout en dollars = 620.78 , duree du vol = 2.08
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

Affichage du reseau apres la suppression du trajet Quebec -> Chicago:
Reseau Aerien: AirCanada
Nombre des villes : 18
Liste des villes : 
Auckland, Bogota, Bruxelles, Bujumbura, Chicago, Chicoutimi, Detroit, Iqaluit, La_Havane, New_York, Ottawa, Paris, Quebec, Sherbrouke, Singapour, Tokyo, Toronto, Vancouver
Nombre des trajets : 9
Liste des trajets : 
Bruxelles -> Bujumbura : cout en dollars = 973.05 , duree du vol = 5.27
Bujumbura -> Bruxelles : cout en dollars = 937.46 , duree du vol = 7.26
Chicago -> Vancouver : cout en dollars = 1521.44 , duree du vol = 4.78
Ottawa -> Iqaluit : cout en dollars = 727.74 , duree du vol = 3.21
Quebec -> La_Havane : cout en dollars = 492.21 , duree du vol = 3.34
Toronto -> Bogota : cout en dollars = 902.15 , duree du vol = 5.42
Vancouver -> Auckland : cout en dollars = 2351.71 , duree du vol = 13.15
Vancouver -> Tokyo : cout en dollars = 1276.42 , duree du vol = 8.65
Vancouver -> Toronto : cout en dollars = 621.46 , duree du vol = 3.87

Verification des messages d'erreurs:
Le reseau ne contient pas cette ville
Le reseau ne contient pas ce trajet
Le reseau ne contient pas cette ville
Le reseau ne contient pas ce trajet
Au moins une des deux villes du trajet n'est pas dans le reseau
Ce chemin n'existe pas 
Nouveau Reseau Aerien: AirTransat
Le reseau est vide
*)