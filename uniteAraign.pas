unit uniteAraign;

interface

uses
    gestionnaire,GestionEcran;

procedure donjAraign(var personnage : heros; var monstre : monster);
procedure cbtPtiteAraign(var personnage : heros; var monstre : monster);
procedure cbtMoyAraign(var personnage : heros; var monstre : monster);
procedure cbtgranAraign(var personnage : heros; var monstre : monster);
procedure cbtBOSS(var personnage : heros; var monstre : monster);
procedure petitMojo(var personnage : heros; var monstre : monster);
procedure affichageStat();
procedure tourPerso(var stop, victoire : boolean);
procedure tourMonstre(var stop, victoire : boolean);

implementation

//**************************DEBUT DONARAIGN*************************************
procedure donjAraign(var personnage : heros ; var monstre : monster); //proc�dure du donjon d'araign�e avec personnage en variable de r�f�rence

var
	choix : Integer;  //variable num�rique de type entier contenant le choix de l'utilisateur
	quitter : Boolean; //variable de type boolean contenant la sortie de la proc�dure
  prob : integer;

begin
	quitter := true; //initialisation de la sortie sur vrai
  writeln('Vous avancez doucement dans une galerie sombre, '); //Affichage d'une phrase de d�but
  writeln('aux paroies recouvertes de toiles d''araign�es ');
  readln;
	while quitter do //d�but de boucle tant que quitter n'a pas la valeur fausse
	begin
    effacerEcran;  //effacer l'�cran pour afficher un autre
    writeln('Point de vie : ',personnage.vie); //afficher les points de vie du personnage
		writeln('Que voulez-vous faire?'); //on demande ce que veut faire le joueur
		writeln('1 - Continuer en direction des bruits sourds que vous entendez');  //choix 1 Continuer dans la mine
		writeln('2 - Fuir pendant qu''il en est encore temps!!!!'); //choix 2 Fuire
		readln(choix);
		case choix of   //en fonction du choix

			1 : begin
            prob:=0;   //initialisation de prob a 0
            randomize; //appel de randomize
            prob:= random(100);  //on donne a prob une valeur al�atoire jusqu'a 100
            if prob < 70 then    //si le nombre est inf�rieur a 70
              cbtPtiteAraign(personnage,monstre)  //appel de la fonction cbtPtiteAraign
            else
            if prob < 95 then  //si le nombre est inf�rieur a 95
              cbtMoyAraign(personnage,monstre)  //appel de la fonction cbtMoyArai
            else               //sinon
              cbtGranAraign(personnage,monstre);   //appel de la fonction cbtGranArai
            end;
      2: quitter := false;
		end;
    if personnage.mort then//cas o� le joueur meurt dans le donjon
      quitter := false;

	end;
end;

//**************************FIN DONARAIGN**************************************
//**************************COMBAT ARAIGNER************************************

//*************************PETITE ARAIGNER*************************************
procedure cbtPtiteAraign(var personnage : heros; var monstre : monster);//simule le combat contre une petite araign�e


var
	choix: Integer;//stocke en m�moire le choix
	stop : boolean;//permet de quitter la boucle
	victoire : boolean;//correspond � la victoire ou non du joueur


begin
  writeln('Une araignee vous saute dessus !!!');
  writeln(' /\ \  / /\');
  writeln('//\\ .. //\\');
  writeln('//\((  ))/\\');
  writeln('/  <`'' >  \');
  readln;
  effacerEcran;
	stop := true;//on rentre dans la boucle
	victoire := false;//on part du principe que le joueur a perdu
	monstre.nom := 'Petite Araignee';
	monstre.defense := 0;//initialisation des statistiques du joueur
  monstre.vie := 20;
  monstre.force := 0;
  monstre.arme := 1;
	while stop do
	begin
		effacerEcran;
		affichageStat();//fait appel � la proc�dure affichant les points de vie en combat
    writeln('Que voulez vous faire?');
    writeln('1 - Attaquer');
    writeln('2 - Attendre');
    readln(choix);
    case choix of
      1 : begin
            tourPerso(stop, victoire);//simule le tour du joueur
            writeln(monstre.nom,' attaque deux fois');
            readln;
            tourMonstre(stop, victoire);//simule le tour du monstre
            tourMonstre (stop, victoire);//il attaque deux fois
          end;
      2 : begin
            writeln('Vous attendez');
            writeln(monstre.nom,' attaque deux fois');
            readln;
            tourMonstre (stop, victoire);//simule l'attaque du monstre
            tourMonstre (stop, victoire);//deuxi�me attaque
            readln;
          end;

    end;
	end;
	if victoire then
	begin
		writeln(monstre.nom,' a ete battu.');
    personnage.graine.carottes := personnage.graine.carottes + 1;//r�compense en cas de victoire : des graines
    writeln('Vous avez gagne des graines de carottes');
	end
	else
	begin
		writeln('Vous avez ete vaincu.');
		writeln('Game Over!!!!!!!!');
    personnage.mort := true;//le personnage est mort
	end;
readln;
end;


procedure affichageStat();//affichage des points de vie de chacun

begin
	writeln('< ',monstre.nom,' >');
	writeln('Point de vie : ', monstre.vie);
	writeln('');
	writeln('< ',personnage.nom,' >');
	writeln('Point de vie : ',personnage.vie);
end;

procedure tourPerso(var stop, victoire : boolean);//procedure simulant l'attaque du joueur


begin
	randomize;
	personnage.force := random(4)+1;//g�n�re les d�g�ts de base
	monstre.vie := monstre.vie -((personnage.force + personnage.arme) - monstre.defense);//retrait des points de vie
	if monstre.vie<=0 then//si le monstre meurt
	begin
		stop := false;//on finit la boucle
		victoire := true;//on a gagn�
	end
end;
//*************************FIN PETITE ARAIGNEE*********************************
//*************************GRANDE ARAIGNEE*************************************
procedure cbtGranAraign(var personnage : heros; var monstre : monster);//simule le combat contre une grande araign�e
{identique au combat contre l'araign�e petite, seules les statistiques changent}

var
	choix: Integer;
	stop : boolean;
	victoire : boolean;


begin
  writeln('Une araignee vous saute dessus !!!');
  writeln(' /\ \  / /\');
  writeln('//\\ .. //\\');
  writeln('//\((  ))/\\');
  writeln('/  <`'' >  \');
  readln;
  effacerEcran;
	stop := true;
	victoire := false;
	monstre.nom := 'Grande Araignee';
	monstre.defense := 5;
  monstre.vie := 500;
  monstre.force := 0;
  monstre.arme := 1;
	while stop do
	begin
		effacerEcran;
		affichageStat();
    writeln('Que voulez vous faire?');
    writeln('1 - Attaquer');
    writeln('2 - Attendre');
    readln(choix);
    case choix of
        1 : begin
              tourPerso(stop, victoire);
              writeln(monstre.nom,' attaque deux fois');
              readln;
              tourMonstre(stop, victoire);
              tourMonstre (stop, victoire);
            end;
        2 : begin
              writeln('Vous attendez');
              writeln(monstre.nom,' attaque deux fois');
              readln;
              tourMonstre (stop, victoire);
              tourMonstre (stop, victoire);
              readln;
            end;

    end;
	end;
	if victoire then
	begin
		writeln(monstre.nom,' a ete battu.');
    personnage.graine.woompas := personnage.graine.woompas + 1;//r�compense en cas de victoire : des graines
    writeln('Vous avez gagne des graines de woompas');
	end
	else
	begin
		writeln('Vous avez ete vaincu.');
		writeln('Game Over!!!!!!!!');
    personnage.mort := true;
	end;
readln;
end;
//*************************FIN GRANDE ARAIGNEE*********************************
//*************************MOYENNE ARAIGNEE************************************
procedure cbtMoyAraign(var personnage : heros; var monstre : monster);//simule le combat contre une araign�e moyenne
{identique au combat contre l'araign�e petite, seules les statistiques changent}

var
	choix: Integer;
	stop : boolean;
	victoire : boolean;


begin
  writeln('Une araignee vous saute dessus !!!');
  writeln(' /\ \  / /\');
  writeln('//\\ .. //\\');
  writeln('//\((  ))/\\');
  writeln('/  <`'' >  \');
  readln;
  effacerEcran;
	stop := true;
	victoire := false;
	monstre.nom := 'Araignee Moyenne';
	monstre.defense := 2;
  monstre.vie := 80;
  monstre.force := 0;
  monstre.arme := 1;
	while stop do
	begin
		effacerEcran;
		affichageStat();
    writeln('Que voulez vous faire?');
    writeln('1 - Attaquer');
    writeln('2 - Attendre');
    readln(choix);
    case choix of
        1 : begin
              tourPerso(stop, victoire);
              writeln(monstre.nom,' attaque deux fois');
              attendre(750);
              tourMonstre(stop, victoire);
              tourMonstre (stop, victoire);
            end;
        2 : begin
              writeln('Vous attendez');
              writeln(monstre.nom,' attaque deux fois');
              attendre(750);
              tourMonstre (stop, victoire);
              tourMonstre (stop, victoire);
              readln;
              end;

    end;


	end;
	if victoire then
	begin
		writeln(monstre.nom,' a ete battu.');
                  personnage.graine.aubergines := personnage.graine.aubergines + 1;//r�compense en cas de victoire : des graines
                  writeln('Vous avez gagne des graines d''aubergines');
	end
	else
	begin
		writeln('Vous avez ete vaincu.');
		writeln('Game Over!!!!!!!!');
    personnage.mort := true;
	end;
  readln;
end;





//*************************FIN MOYENNE ARAIGNEE********************************
//*************************DEBUT COMBAT BOSS***********************************
procedure cbtBOSS(var personnage : heros; var monstre : monster);//proc�dure lan�ant le combat contre le boss

var
	choix: Integer;//garde en m�moire le choix de l'utilisateur sur son action
	stop : boolean;//permet d'arr�ter le combat
	victoire : boolean;//permet de savoir si le joueur a gagn� le combat
begin
  writeln('Un serpent gigantesque avec un goblin le chevauchant se dresse devant vous,');
  writeln('il va vous attaquer!!!');
  readln;
  effacerEcran;
	stop := true;//permet de rentrer dans la boucle
	victoire := false;
	monstre.nom := 'BASILIC';//initialisation des statistiques du basilic
	monstre.defense := 0;//sa d�fense
  monstre.vie := 100000;//sa vie
  monstre.force := 0;//sa force
  monstre.arme := 2000;//le bonus de d�g�t de son arme
	while stop do
	begin
		effacerEcran;
		affichageStat();//on affiche les points de vie des deux combattants
    writeln('Que voulez vous faire?');
    writeln('1 - Attaquer');
    writeln('2 - Attendre');
    readln(choix);
    case choix of
        1 : begin
              tourPerso(stop, victoire);//tour du joueur
              tourMonstre(stop, victoire);//le monstre attaque 2 fois
              tourMonstre (stop, victoire);
            end;
        2 : begin
              writeln('Vous attendez');//le joueur ne fait rien
              tourMonstre (stop, victoire);//le monstre ne fait rien
              tourMonstre (stop, victoire);
              readln;
            end;

    end;


	end;
	if victoire then//cas o� on a gagn� le combat
	begin
		writeln('Bravo ',monstre.nom,' a ete vaincu, le monde est maintenant en paix,');
    writeln('Vous allez pouvoir continuer a vivre une vie normale dans ce vaste univers!!!');
    personnage.event.fin := true//permet de lancer les cr�dits si vrai
	end
	else
	begin
		writeln('Vous avez ete vaincu.');
		writeln('Game Over!!!!!!!!');
    personnage.mort := true;//le personnage est mort 
	end;
  readln;
end;





//*************************FIN COMBAT BOSS*************************************




procedure tourMonstre(var stop, victoire : boolean);//procedure simulant l'attaque du monstre



begin
	randomize;
	monstre.force := random(2)+1;//g�n�re les d�g�ts de base
	personnage.vie := personnage.vie -((monstre.force + monstre.arme) - personnage.armure);//retrait des points de vie
	if personnage.vie<=0 then//si le joueur meurt
	begin
		stop := false;//on sort de la boucle
		victoire := false;//on a perdu
	end
end;



procedure petitMojo(var personnage : heros; var monstre : monster);//simule un combat contre un mojo qui n'a que 1 point de vie
var
	choix: Integer;
	stop : boolean;
	victoire : boolean;
begin
  stop := true;
	victoire := false;
	monstre.nom := 'Tribu Mojo';//ce monstre n'a que 1 point de vie
	monstre.defense := 0;//initialisation des statistiques
  monstre.vie := 1;
  monstre.force := 0;
  monstre.arme := 0 ;
	while stop do
	begin
		effacerEcran;
		affichageStat();
    writeln('Que voulez vous faire?');
    writeln('1 - Attaquer');
    writeln('2 - Attendre');
    readln(choix);
    case choix of
    1 : begin
          tourPerso(stop, victoire);//le joueur attaque mais pas le mojo
        end;
    2 : begin
          writeln('Vous attendez mais le mojo n''attaque pas !');//personne n'attaque
          readln;
        end;
    end;
end;
  if victoire then//cas o� on a gagn�
	begin
		writeln(monstre.nom,' a ete battu.');
    writeln('Vous avez trouvez des graines de woompas');
    personnage.graine.woompas:=personnage.graine.woompas+1//r�compense en cas de victoire

	end
	else
	begin
		writeln('Vous avez ete vaincu.');//cas o� on perd contre le mojo, m�me si c'est impossible
		writeln('Game Over!!!!!!!!');
	end;
  readln;
end;


end.
