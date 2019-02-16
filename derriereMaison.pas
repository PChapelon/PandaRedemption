unit derriereMaison;

interface

uses 
	GestionEcran, gestionnaire;

procedure jardin(var personnage : heros);
procedure potager(var personnage : heros);
procedure etang(var personnage : heros);
procedure ponton(var personnage : heros);
procedure recolter(var personnage : heros);
procedure construirePotager (var personnage : heros);
procedure planter(var personnage : heros);
function recoltPoisson(): Integer;


implementation

procedure jardin(var personnage : heros);//procedure donnant accès au jardin

var
	choix : Integer;//permet de contenir le choix de l'utilisateur
	quitter : Boolean;//permet de quitter la boucle

begin

	quitter := true;
	while quitter do
	begin
    effacerEcran;
		writeln('Vous voila dans votre jardin. Que voulez-vous faire?');//affiche les choix a l'utilisateur
    if personnage.event.potager then//si le personnage a construit le potager
      writeln('1 - Voir le potager')
    else
      writeln('1 - Construire un potager');//s'il ne l'a pas fait
		  writeln('2 - Se rendre a l''etang');
		  writeln('3 - Retourner a la maison');
		  readln(choix);
	  	case choix of
			1: if personnage.event.potager then//s'il l'a construit on peut y accéder
            potager(personnage)
         else
            construirePotager(personnage);//sinon on doit le construire
			2: etang(personnage);
			3: quitter := false;
		end;
	end;
end;


procedure potager(var personnage : heros);//procedure affichant les choix proposant le potager

var
	choix: Integer;
  quitter : boolean;


begin

  quitter := true;
  while quitter do
  begin
  effacerEcran;
  writeln('Que voulez-vous faire?');
  writeln('1 - Planter des graines');
  writeln('2 - Recolter les plantations');
  writeln('3 - Retourner dans le jardin');
  readln(choix);
  case choix of
    1 : planter (personnage);//si on veut planter une graine
    2 : recolter (personnage);//si on veut récolter ce qu'on a planté
    3 : quitter := false;
   end;
  end;
end;

//******************************************************************************

procedure planter(var personnage : heros);//procedure permettant de planter des graines

var
  choix : integer;//stocke le choix du jouer
  quitter : boolean;//permet de quitter la boucle

begin
  quitter := true;
  while quitter do
    begin
    effacerEcran;
    writeln('Que voulez-vous planter?');//donne le choix des légumes à planter
    writeln('1 - Des carottes');
    writeln('2 - Des aubergines');
    writeln('3 - Des woompas');
    writeln('4 - Rien');
    readln(choix);
    case choix of
     1 : //on plante des carottes
     begin
        if personnage.event.plantation then//on vérifie si l'on n' a pas déjà planté quelque chose
            if personnage.graine.carottes >0 then//on vérifie que l'on a assez de graines
            begin
              personnage.plantation.temps := 1; //on initialise la variable du temps a 1
              personnage.graine.carottes := personnage.graine.carottes - 1;//on soustrait une graine
              personnage.plantation.carottes := true;//la plantation des carottes passe à vrai
              writeln('Vous plantez des carottes');
              personnage.event.plantation := true;//ainsi que les plantations en général
            end
            else
              writeln('Vous n''avez plus de graines')
        else
          writeln('Vous avez deja plante quelque chose.');
      end;

      2:
      begin
        if personnage.event.plantation then//on vérifie si l'on n' a pas déjà planté quelque chose
            if personnage.graine.aubergines >0 then//on vérifie que l'on a assez de graines
            begin
              personnage.plantation.temps := 1;//on initialise la variable du temps a 1
              personnage.plantation.aubergines := true;//la plantation des aubergines passe à vrai
              personnage.graine.aubergines := personnage.graine.aubergines - 1;//on soustrait une graine
              writeln('Vous plantez des aubergines');
              personnage.event.plantation := true;//ainsi que la plantation générale passe à vrai
            end
            else
              writeln('Vous n''avez plus de graines')
        else
          writeln('Vous avez deja plante quelque chose.');
      end;

      3:
      begin
        if personnage.event.plantation then//on vérifie si l'on n' a pas déjà planté quelque chose
            if personnage.graine.woompas >0 then//on vérifie que l'on a assez de graines
            begin
              personnage.plantation.temps := 1;//on initialise la variable du temps a 1
              personnage.graine.woompas := personnage.graine.woompas - 1;//on soustrait une graine
              personnage.plantation.woompas := true;//la plantation des woompas passe a vrai
              writeln('Vous plantez des woompas');
              personnage.event.plantation := true;//ainsi que la plantation générale
            end
            else
              writeln('Vous n''avez plus de graines')
        else
          writeln('Vous avez deja plante quelque chose.');
      end;
      4 : quitter := false;//on sort de la boucle
     end;
     readln;
  end;
end;


//******************************************************************************

procedure recolter(var personnage : heros);//procedure permettant de ramasser les plantations


begin
  if personnage.plantation.temps > 50 then//on vérifie si les plantations  sont  pourries
    begin
    writeln('Vos plantations empestent la pourriture, vous choisissez de les enlever');
    personnage.plantation.temps := 0;//si c 'est le cas le temps des plantations passe à 0
    personnage.plantation.carottes := false;//les plantations des carottes passent a faux 
    personnage.plantation.aubergines := false;//celle des aubergines
    personnage.plantation.woompas := false;//celle des woompas
    personnage.event.plantation := false;//on enlève la présence de plantations
    end
    else
    begin
    if personnage.plantation.temps > 10 then//si les plantations sont mûres
    begin
      if personnage.plantation.carottes then//si ce sont des carottes
      begin
      personnage.plantation.carottes := false;//la présence de carottes passent à faux
      personnage.plantation.temps := 0;//le temps repasse à 0
      personnage.legumes.carottes := personnage.legumes.carottes + 1;//le stock de carottes est incrémenté de 1
      writeln('Vous recoltez des carottes');
      personnage.event.plantation := false;//il n y a plus de plantations
      end
      else
      begin
        if personnage.plantation.aubergines then//si ce sont des aubergines
        begin
        personnage.plantation.aubergines := false;//il en est de même pour les aubergines
        personnage.plantation.temps := 0;
        personnage.legumes.aubergines := personnage.legumes.aubergines + 1;
        writeln('Vous recoltez des aubergines');
        personnage.event.plantation := false;
        end
        else
          if personnage.plantation.woompas then//si ce sont  des woompas
          begin
          personnage.plantation.woompas := false;//il en est de même pour les woompas
          personnage.plantation.temps := 0;
          personnage.legumes.woompas := personnage.legumes.woompas + 1;
          writeln('Vous recoltez des woompas');
          personnage.event.plantation := false;
          end;
      end;
    end
    else
    begin
      if personnage.plantation.temps > 0 then//cas où les plantations ne sont pas encore mûres
      begin
      writeln('Vos plantations ne sont pas encore mures');
      end
      else
      begin
        writeln('Vous n''avez pas de plantations');//sinon on n'a rien planté
      end;
    end;
    end;
end;




procedure construirePotager (var personnage : heros);//procédure permettant de construire le potager

begin
  if ((personnage.bamboo < 100) or (personnage.pierre < 50))   then//vérifie si le personnage a les matériaux nécessaires pour construire le potager
  begin
    writeln('Vous n''avez pas assez de materiaux, il vous faut 100 unites de bamboo et 50 unites de pierre');
    readln;
  end
  else
  begin
    personnage.event.potager := true;//le potager est accessible
    personnage.bamboo := personnage.bamboo - 100;//on perd le bamboo nécessaire
    personnage.pierre := personnage.pierre - 50;//on perd aussi la pierre
  end;
end;









//******************************************************************************
procedure etang(var personnage : heros);//procédure donnant accès à l'étang

var
  choix : integer;//garde en mémoire le choix de l'utilisateur
  quitter : boolean;//permet de sortir de la boucle

begin
  quitter := true;
  while quitter do
  begin
    effacerEcran;
    writeln('Devant vous se trouve un petit etang, sur lequel un ponton se voit prolonge. Que voulez-vous faire?');//affiche les choix
    writeln('1 - Monter sur le ponton ');
    writeln('2 - Pecher');
    writeln('3 - Retourner au jardin');
    readln(choix);
    case choix of
      1: ponton(personnage);//envoi le personnage sur le ponton
      2: if personnage.canAPech then//vérifie si le personnage a une canne à pêche
          personnage.poisson := personnage.poisson + recoltPoisson//utilisation de la fonction générant le poisson attrappé
         else
         begin
          writeln('Vous n''avez pas de canne a peche');
          readln;
         end;
      3: quitter := false;//quitte la boucle
    end;
  end;

end;


function recoltPoisson(): Integer;//fonction simulant la pêche du poisson et renvoyant la quantité pêchée

var
  poisson: Integer;//correspond à la quantité de poisson attrappé
  prob : integer;//correspond à la probabilité d'attrapper un poisson
  choix : integer;//correspond au choix de l'utilisateur

begin
  randomize;
  prob := random(100);//génère la probabilté d'attrapper un poisson
  if prob < 35 then
  begin
    writeln('Un poisson mord a votre ligne. Voulez vous le laisser filer?');
    writeln('1 - Oui');
    writeln('2 - Non');
    readln(choix);
    case choix of//gère si l'utilisateur choisit de relacher le poisson ou non
      1: poisson := 0;//il le relache
      2: poisson := 1;//il le garde
    end;
  end
  else 
  begin
    writeln('Cela fait un moment que vous attendez et rien ne se passe.');
    poisson := 0;//le joueur ne trouve pas de poisson 
  end; 
  recoltPoisson := poisson;//on renvoi la quantité de poisson attrappé
  readln;
end;


procedure ponton(var personnage : heros);//procédure simulant l'apparition du lutin devant le joueur

var
  prob: Integer;//génère la probabilité du lutin de donner ou voler de l'argent
  lutin : integer;//correspond à la quantité d'or donnée par le lutin

begin
  effacerEcran;
  if personnage.event.lutin then//si on n'a pas déjà rencontré le lutin
  begin
    randomize;
    prob := random(100);//génère la probabilité d'action du lutin
    if prob<33 then//le lutin vole tout l'or
    begin
      writeln('Avancant sur le ponton, vous entendez un craquement de bois, celui-ci semble    tres fragile. Soudain un petit lutin rouge apparait tel un NINJA devant vous.');
      writeln('Vous tentez de l''attrapper avant qu''il ne file mais celui-ci, trop rapide pour  vous, reussi a vous prendre sans mal la bourse accrocher a votre taille.');
      writeln('Malheureusement vous voila depouillez de tout votre argent.');
      personnage.argent := 0;//on passe l'argent du joueur à 0
      personnage.event.lutin := false;//on ne peut plus rencontrer le rencontrer
    end
    else 
    begin
      writeln('Avançant sur le ponton, vous entendez un craquement de bois, celui-ci semble  tres fragile. Soudain un petit lutin apparait tel un NINJA devant vous.');
      writeln('Habille de dore, il vous tend une bourse remplie d''argent.');
      randomize;
      lutin := random(900) + 100;//génère l'argent donné par le lutin
      writeln('Vous avez gagnez ',lutin,' piece d''or');
      personnage.argent := personnage.argent + lutin;//on ajoute l'argent donné par le lutin
      personnage.event.lutin := false;//on ne peut plus rencontrer le rencontrer
    end;
    
  end
  else 
    writeln('Le petit lutin de la derniere fois ne semble pas present.');
    readln;
end;

end.
