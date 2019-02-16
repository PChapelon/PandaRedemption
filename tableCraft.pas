unit tableCraft;

interface

uses
	GestionEcran, gestionnaire;

procedure craft(var personnage : heros);
procedure soupeCraft(var personnage : heros);
procedure hacheCraft(var personnage : heros);
procedure piocheCraft(var personnage : heros);
procedure potionCraft(var personnage : heros);






implementation

procedure craft(var personnage : heros);//procédure demandant ce que l'on veut crafter

var
	quitter : boolean;//permet de quitter la boucle
	choix : integer;//garde en mémoire le choix de l'utilisateur

begin
	quitter := true;
	while quitter do
	begin
		effacerEcran ;
		writeln('Que voulez-vous crafter?');//différents choix
		writeln('1 - une soupe : 6 poissons, 5 potions');
		writeln('2 - une hache : 50 bois, 15 pierres');
		writeln('3 - une pioche : 50 bois, 20 minerais de fer');
		writeln('4 - une potion : 20 aubergines, 30 carottes, 10 woompas');
		writeln('5 - Arreter de crafter') ;
		readln(choix);
		case choix of
			1: soupeCraft (personnage);//on craft une soupe
			2: hacheCraft (personnage);//on craft une hache
			3: piocheCraft (personnage);//on craft une pioche
			4: potionCraft (personnage);//on craft une potion
			5: quitter := false;//on sort de la table de craft
		end;
	end;
end;



procedure soupeCraft(var personnage : heros);//procedure simulant le craft de la soupe par le joueur

var
	prob: Integer;//probabilité d'échec du craft

begin
	if personnage.soupe then//vérification si le personnage n'a pas déjà la soupe
	begin
		writeln('Vous avez deja la soupe a donner au panda legendaire');
		readln;
	end
	else
	begin
		if ((personnage.poisson<6) or (personnage.potion<5)) then//on vérifie que les objets nécessaires sont présents
		begin
			writeln('Vous n''avez pas les ingredients necessaires');
			readln;
		end
		else
		begin
			randomize;
			prob := random(100);//génère la probabilité
			if prob <50 then
			begin
				personnage.poisson := personnage.poisson - 6;//on soustrait les ressources
				personnage.potion := personnage.potion -5;
				personnage.soupe := true;//on ne peut plus recrafter la soupe
        writeln('Vous avez crafte une soupe a donne au panda');
        readln;
			end
			else 
			begin
				writeln('Vous avez echoue dans la conception de votre soupe. Comme c''est dommage XD');//la soupe n'a pas pu être craft, le joueur a échoué
				readln;
			end;
		end;
	end;
end;

//*******************************************************
procedure hacheCraft(var personnage : heros);//procédure simulant le craft de la hache


begin
	if personnage.hache  then//vérification de la possession de la hache 
	begin
		writeln('Vous avez deja une hache');
		readln;
	end
	else
	begin
		if ((personnage.bois<50) or (personnage.pierre < 15)) then//vérification des ressources nécessaires
		begin
			writeln('Vous n''avez pas les materiaux necessaires');
			readln;
		end
		else
		begin
			personnage.bois := personnage.bois - 50;//on soustrait les ressources
			personnage.pierre := personnage.pierre - 15;
			personnage.hache := true ;//on ne peut plus crafter de hache
      writeln('Vous avez crafte une hache augmentant la quantite de bois cherchee');
      readln;
		end;
	end;
end;



procedure piocheCraft(var personnage : heros);//procedure simulant le craft d'une pioche

begin
	if personnage.pioche  then//vérification de la présence d'une pioche dans l'inventaire
	begin
		writeln('Vous avez deja une pioche');
		readln;
	end
	else
	begin
		if ((personnage.bois<50) or (personnage.fer < 20)) then//vérification de la quantité des ressources
		begin
			writeln('Vous n''avez pas les materiaux necessaires');
			readln;
		end
		else
		begin
			personnage.bois := personnage.bois - 50;//on soustrait les ressources
			personnage.fer := personnage.fer - 20;
			personnage.pioche := true;//on ne peut plus craft de pioche
      writeln('Vous avez crafte une pioche augmentant vos chances de trouver du fer et la quantite cherchee');
      readln;
		end;
	end;
end;


procedure potionCraft(var personnage : heros);//procedure simmulant le craft des potions


begin
	if ((personnage.legumes.aubergines < 20) or (personnage.legumes.carottes < 30) or (personnage.legumes.woompas < 10)) then//vérification des ressources
		begin
			writeln('Vous n''avez pas les ingredients necessaires');
			readln;
		end
		else
		begin
			personnage.legumes.aubergines := personnage.legumes.aubergines - 20;//on soustrait les ressources
			personnage.legumes.carottes := personnage.legumes.carottes - 30;
			personnage.legumes.woompas := personnage.legumes.woompas - 10;
			personnage.potion := personnage.potion + 1;//on reçoit une potion
      writeln('Vous avez crafte une potion');
      readln;
		end;
end;



end.
