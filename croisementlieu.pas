unit croisementLieu; //unité permettant le croisement entre les différents chemins

interface

uses
    uniteMine,gestionnaire,GestionEcran, house, Unitforet,unitBamboo,uniteAraign,debutFin;

procedure croisement (var personnage :heros ); //procédure permettant de faire correspondre les différents lieux



implementation



procedure croisement(var personnage : heros ); //procédure permettant de faire correspondre les différents lieux

var
  choix : Integer; //correspond aux choix fait par le personnage
  arret : boolean;//permet d''arrêter la boucle des chemins

begin
  arret := true;
  while arret do
  begin
    effacerEcran;
    if personnage.event.plantation then//permet d'augmenter le temps seulement si quelque chose est planté
      personnage.plantation.temps := personnage.plantation.temps + 1;//incrémente le temps des plantations
      writeln('Plusieurs directions s''offrent a vous. Quel chemin voulez-vous suivre?');//On affiche les différents chemin pouvant être pris par le joueur.
      writeln('1 - Partir en direction de la maison');
      writeln('2 - Se diriger vers la foret ');
      writeln('3 - Se rendre a l''interieur de la mine');
      readln(choix);
      case choix of
          1: maison( personnage, coffre); //le joueur se retrouve dans la maison
          2: foret(personnage); //le joueur se rend dans la forêt
          3: mine(personnage);  // le joueur est envoyé dans la mine
      end;
      if personnage.mort then  //alternative permettant de remonter toutes les procédures jusqu'à l'écran titre si le personnage meurt
      begin  
        arret := false;
        personnage.event.boss := false;//si l'on meurt on ne peut pas combattre le boss
      end;
      if personnage.event.boss then //permet de lancer le combat contre le boss lorque l'on a donné la soupe au panda
      begin
        cbtBOSS(personnage,monstre);//procedure lançant le combat contre le boss
        arret := false;//on revient au menu principal quelque soit l'issue du combat
        if personnage.event.fin then//passe a vrai si on gagne le combat
        begin
          effacerEcran;
          fin();//affiche les crédits de fin
        end;
      end;
  end;
end;


end.

