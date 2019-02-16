unit house;

interface

uses
  gestionnaire, GestionEcran, derriereMaison,tableCraft;

procedure maison(var personnage : heros; var coffre : stock);
procedure malle(var personnage:heros; var coffre : stock);

implementation

procedure maison(var personnage : heros; var coffre : stock);//procédure ouvrant les différentes fonctionnalités que donne la maison

var
  choix : integer;  //Variable de type numérique entier qui contient le choix du personnage
  quitter : boolean; //Variable qui prend la valeur faux pour sortir

begin

  quitter := true; //Initialisation à vrai
  while quitter do //Tant que quiest = faux alors on boucle
  begin
    effacerEcran; //Efface le texte
    statPerso(personnage); //On fait appelle au stat du personnage
    writeln('Vous etes dans votre maison'); //Texte d'introduction de la maison
    writeln('');
    writeln('Que voulez vous faire?'); //Propostion au personnage
    writeln('1 - Dormir'); //Premier choix
    writeln('2 - Ouvrir votre coffre'); //Second choix
    writeln('3 - Utiliser l''atelier');
    writeln('4 - Sortir par la port de derriere');
    writeln('5 - Sortir'); //Dernier choix.
    readln(choix); //On stock le choix fait par le joueur
    case choix of //En fonction du choix
         1 :
         begin
           personnage.vie := 100; //Le joueur récupère sa vie
           writeln('Vous vous sentez mieux a present');  //texte présentant la régenerartion (like doctor)
         end;
         2 : malle(personnage, coffre);  //Appelle de la procédure coffre

         3: craft(personnage);

         4 : jardin(personnage); //Ouvre la procedure donnant accès au jardin

         5 :
           begin
            writeln('Vous sortez de chez vous'); //Texte présentant notre départ à l'aventure
            quitter := false; //Permet de partir
           end;
    end;
    readln; //Tempo qui permet d'éviter d'appuier sur entrée
  end;


end;

//***********************************COFFRE*************************************

procedure malle(var personnage:heros; var coffre : stock);
//Procedure d'un coffre qui permettra de déposez ou prendre des ressources.
var
	choix : Integer;  //Var de type numérique entière qui permet d'avoir le choix du joueur
	quitter : Boolean;//Permet de quitter la boucle quand le joueur le veut


begin
	quitter := true; //Initialisation de la variable quitter
  writeln('Vous ouvrez votre coffre.');  //Message d'entrée
  readln;
	while quitter do  //Début de la boucle, tant que le personnage ne choisis pas l'option quitter la boucle continue
	begin
    effacerEcran;
    writeln('Stock de pierre : ',personnage.pierre)  ; //Affiche le nombre de pierre dans l'inventaire du personnage
		writeln('Stock de fer : ',personnage.fer)        ; //Affiche le nombre de fer dans l'inventaire du personnage
		writeln('Stock de bois:',personnage.bois);         //Affiche le nombre de bois dans l'inventaire du personnage
		writeln('1 - Voulez vous deposez de la pierre');   //Proposition de dépot de ressources
		writeln('2 - Voulez vous deposez du fer');         //Proposition de dépot de ressources
		writeln('3 - Voulez vous deposez du bois');        //Proposition de dépot de ressources
		writeln('4 - Voulez vous prendre de la pierre');   //Proposition de prendre une ressources
    writeln('5 - Voulez vous prendre du fer');         //Proposition de prendre une ressources
    writeln('6 - Voulez vous prendre du bois');        //Proposition de prendre une ressources
    writeln('7 - Quitter le coffre'); //Proposition pour quitter
		readln(choix);
		case choix of //Séléction du choix
			1 : begin
            if personnage.pierre >=1 then //Si le joueur a au moins une ressource pierre alors
              begin
                personnage.pierre:= personnage.pierre-1;  //le personnage dépose une pierre
                coffre.pierre := coffre.pierre +1;       //le coffre stock une pierre
              end
            else
            begin
              write('Vous n''avez pas de pierre !');   //Affiche un message d'erreur
              readln;
            end
          end;
			2 :begin
          if personnage.fer >=1 then   //Si le joueur a  au moins une ressource de fer alors
            begin
              personnage.fer:= personnage.fer-1; //Le personnage dépose une ressource de fer
              coffre.fer := coffre.fer +1;     //Le personnage stock une ressource une pierre
            end
          else
            begin
              write('Vous n''avez pas de fer !');   //Affiche un message d'erreur
              readln;
            end
         end;
			3 : begin
            if personnage.bois >=1 then  //Si le joueur a au moins une ressource de bois alors
              begin
                personnage.bois:= personnage.bois-1; //Le personnage dépose une ressource de bois
                coffre.bois := coffre.bois +1;    //Le personnage stock une ressource de bois
              end
            else
              begin
              write('Vous n''avez pas de bois !');   //Affiche un message d'erreur
              readln;
            end
          end;
      4 :begin
          if coffre.pierre >=1  then  // Si le coffre dispose d'au moins une ressource de pierre alors
            begin
              coffre.pierre:= coffre.pierre-1;  //On retire du coffre une unitée de pierre
              personnage.pierre:= personnage.pierre+1; //Le joueur prend une unitée de pierre
            end
          else
             begin
              write('Il n''y a pas cette ressource dans le coffre');   //Affiche un message d'erreur
              readln;
            end
         end;
      5 : begin
          if coffre.fer >=1  then  // Si le coffre dispose d'au moins une ressource de fer alors
            begin
              coffre.fer:= coffre.fer-1;  //On retire du coffre une unitée de fer
              personnage.fer:= personnage.fer+1; //Le joueur prend une unitée de fer
            end
          else
             begin
              write('Il n''y a pas cette ressource dans le coffre');   //Affiche un message d'erreur
              readln;
            end
         end;
      6 :begin
          if coffre.bois >=1  then  // Si le coffre dispose d'au moins une ressource de bois alors
            begin
              coffre.bois:= coffre.bois-1;  //On retire du coffre une unitée de bois
              personnage.bois:= personnage.bois+1; //Le joueur prend une unitée de bois
            end
          else
            begin
              write('Il n''y a pas cette ressource dans le coffre');   //Affiche un message d'erreur
              readln;
            end
        end;
			7 : quitter := false; //Quiter le  coffre
		end;

	end;
end;

end.


