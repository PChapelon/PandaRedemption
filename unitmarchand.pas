unit unitMarchand;


interface

uses
    gestionnaire,GestionEcran;


procedure marchand(var personnage : heros; var upmarchand : champimar); //procédure général du marchand
procedure achat(var personnage :heros);     //procédure d'achat
procedure vendre(var personnage :heros);    //procédure de vente
procedure AchatChamp(var personnage : heros );
procedure vendreChamp(var personnage : heros );

implementation

//**************************DEBUT MARCHANT**************************************
procedure marchand(var personnage : heros; var upmarchand : champimar ); //procédure marchand avec variable par référence personnage



var
	choix : Integer;     //variable numérique de type entier contenant le choix de l'utilisateur
	quitter : Boolean;   //variable de type boolean contenant la sortie de la procédure


begin
	quitter := true;    //initialisation de la sortie sur vrai
  if upmarchand.argent<=1000 then
    writeln('Bonjour ',personnage.nom,' que voulez vous faire?') //Affichage d'une phrase de début
  else
    writeln('Bonjour ',personnage.nom,' bienvenue au champi-marche, que voulez vous faire?'); //Affichage d'une phrase de début
  readln;
	  while quitter do  //début de boucle tant que quitter n'a pas la valeur fausse
    Begin
    if upmarchand.argent<=1000 then
	  begin
      effacerEcran;   //effacer l'écran pour afficher un autre
      writeln('Pièce d''or : ',personnage.argent); //afficher l'argent du personnage
      writeln('Stock de bois : ',personnage.bois);  //afficher le stock de bois du personnage
      writeln('Stock de pierre: ',personnage.pierre);    //afficher le stock de pierre du personnage
      writeln('Stock de Fer: ',personnage.fer);     //afficher le stock de fer du personnage
	 	  writeln('Que voulez-vous faire?');            //on demande ce que veut faire le joueur
		  writeln('1 - Acheter'); //Choix 1 acheter
		  writeln('2 - Vendre');  //Choix 2 Vendre
		  writeln('3 - Partir');  //Choix 3 Partir
		  readln(choix);
		  case choix of       //en fonction du nombre
			  1 : achat(personnage); //1 on lance la procédure achat
			  2 : vendre(personnage); //2 on lance la procédure vendre
			  3 : quitter := false;   //3 on sors de la procédure
        end;
		  end

    else
    Begin

      effacerEcran;   //effacer l'écran pour afficher un autre
      writeln('Pièce d''or : ',personnage.argent); //afficher l'argent du personnage
      writeln('Stock de bois : ',personnage.bois);  //afficher le stock de bois du personnage
      writeln('Stock de pierre: ',personnage.pierre);    //afficher le stock de pierre du personnage
      writeln('Stock de Fer: ',personnage.fer);     //afficher le stock de fer du personnage
	 	  writeln('Que voulez-vous faire?');            //on demande ce que veut faire le joueur
		  writeln('1 - Acheter'); //Choix 1 acheter
		  writeln('2 - Vendre');  //Choix 2 Vendre
		  writeln('3 - Partir');  //Choix 3 Partir
		  readln(choix);
		  case choix of       //en fonction du nombre
			  1 : achatChamp(personnage); //1 on lance la procédure achat
			  2 : vendreChamp(personnage); //2 on lance la procédure vendre
			  3 : quitter := false;   //3 on sors de la procédure
		  end;

	end;
end;

end;

//**************************FIN MARCHANT***************************************
//**************************DEBUT ACHAT****************************************
procedure Achat(var personnage : heros );  //procédure achat avec variable par référence personnage



var
	choix : Integer;  //variable numérique de type entier contenant le choix de l'utilisateur
	quitter : Boolean;  //variable de type boolean contenant la sortie de la procédure


begin
	quitter := true; //initialisation de la sortie sur vrai
  writeln('Que voulez vous achetez');  //Affichage d'une phrase de début
  readln;
	while quitter do  //début de boucle tant que quitter n'a pas la valeur fausse
	begin
    effacerEcran; //effacer l'écran pour afficher un autre
    writeln('Pièce d''or : ',personnage.argent); //afficher l'argent du personnage
    writeln('Stock de bois : ',personnage.bois);  //afficher le stock de bois du personnage
    writeln('Stock de pierre: ',personnage.pierre); //afficher le stock de pierre du personnage
    writeln('Stock de Fer: ',personnage.fer); //afficher le stock de fer du personnage
		writeln('Que voulez-vous faire?');  //on demande ce que veut faire le joueur
		writeln('1 - Acheter une unite de bois(1po)'); //choix 1 on achete du bois
		writeln('2 - Acheter une unite de fer(3po)');  //choix 2 on achete du fer
    writeln('3 - Acheter une unite de pierre(2po)'); //choix 3 on achete de la pierre
    writeln('4 - Acheter une armure(100po)');  //choix 4 on achete une armure
    writeln('5 - Acheter une epee(50po)');   //choix 5 on achete une épée
		writeln('6 - Partir');   //Choix 6 Partir
		readln(choix);
		case choix of  //en fonction du choix:
			1 : Begin
            if personnage.argent >= 1 then  //on verifie que le joueur a assez d'argent
            begin
              personnage.bois := personnage.bois+1; //on ajoute une unité de bois au stock du personnage
              personnage.argent:= personnage.argent-1; //on soustrait une unité d'argent au stock du personnage
              upmarchand.argent := upmarchand.argent+1;
            end
            else
            begin
              writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
              readln;
            end;
           End;

      2 : Begin
            if personnage.argent >= 3 then //on verifie que le joueur a assez d'argent
            begin
              personnage.fer := personnage.fer+1; //on ajoute une unité de fer au stock du personnage
              personnage.argent:= personnage.argent-3; //on soustrait trois unité d'argent au stock du personnage
              upmarchand.argent := upmarchand.argent+3;
            end
            else
            begin
              writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
              readln;
            end;
          End;

      3 :Begin
          if personnage.argent >= 2 then //on verifie que le joueur a assez d'argent
          begin
            personnage.pierre := personnage.pierre+1; //on ajoute une unité de pierre au stock du personnage
            personnage.argent:= personnage.argent-2; //on soustrait deux unité d'argent au stock du personnage
            upmarchand.argent := upmarchand.argent+3;
          end
          else
          begin
            writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
            readln;
          end;
        End;
        4 : Begin
              if personnage.argent >= 100 then //on verifie que le joueur a assez d'argent
              begin
                if personnage.armure= 0 then  //on vérifie qu'il n'a pas déja une armure
                begin
                  personnage.armure := personnage.armure+1; //on ajoute une armure au stock du personnage
                  personnage.argent:= personnage.argent-100; //on soustrait cent unité d'argent au stock du personnage
                  upmarchand.argent := upmarchand.argent+100;
                end
                else
                begin
                  writeln('Vous avez déja une armure!!!'); //sinon on affiche qu'il a déja une armure
                  readln;
                end
              end
              else
              begin
                writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
                readln;
              end;
            End;
        5 : Begin
              if personnage.argent >= 50 then //on verifie que le joueur a assez d'argent
              begin
                if personnage.arme = 0 then //on vérifie qu'il n'a pas déja une épée
                begin
                  personnage.arme := personnage.arme+1; //on ajoute une épée au stock du personnage
                  personnage.argent:= personnage.argent-50; //on soustrait cinquante unité d'argent au stock du personnage
                  upmarchand.argent := upmarchand.argent+50;
                end
                else
                begin
                  writeln('Vous avez déja une arme!'); //sinon on affiche qu'il a déja une arme
                  readln;
                end
              end
              else
              begin
                writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
                readln;
              end;
            End;
        6 : quitter := false; //on quitte la procédure achat
		  end;
	end;
end;


//**************************FIN ACHAT******************************************
//**************************DEBUT VENDRE***************************************

procedure Vendre(var personnage : heros ); //procédure vendre avec variable par référence personnage



var
	choix : Integer; //variable numérique de type entier contenant le choix de l'utilisateur
	quitter : Boolean; //variable de type boolean contenant la sortie de la procédure


begin
	quitter := true;  //initialisation de la sortie sur vrai
  writeln('Que voulez vous vendre?'); //Affichage d'une phrase de début
  readln;
	while quitter do  //début de boucle tant que quitter n'a pas la valeur fausse
	begin
    effacerEcran; //effacer l'écran pour afficher un autre
    writeln('Argent : ',personnage.argent); //afficher l'argent du personnage
    writeln('Stock de bois : ',personnage.bois);  //afficher le stock de bois du personnage
    writeln('Stock de pierre: ',personnage.pierre);  //afficher le stock de pierre du personnage
    writeln('Stock de Fer: ',personnage.fer);  //afficher le stock de fer du personnage
		writeln('Que voulez-vous faire?');  //on demande ce que veut faire le joueur
		writeln('1 - Vendre une unite de bois(1po)'); //choix 1 vendre du bois
		writeln('2 - Vendre une unite de fer(3po)');  //choix 2 vendre du fer
    writeln('3 - Vendre une unite de pierre(2po)'); //choix 3 vendre de la pierre
		writeln('4 - Partir'); //choix 4 partir
		readln(choix);
		case choix of  //en fonction du choix:
      1 : Begin
            if personnage.bois >= 1 then //on vérifie que le joueur a assez de bois
            begin
              personnage.bois := personnage.bois - 1; //on soustrait une unité de bois au stock du personnage
              personnage.argent:= personnage.argent + 1; //on ajoute une unité d'argent au stock du personnage

            end
            else
            begin
              writeln('Vous n''avez pas assez de bois') ; //sinon on affiche qu'il n'a pas assez de bois
              readln;
            end;
          end;

      2 : Begin
            if personnage.fer >= 1 then //on vérifie que le joueur a assez de fer
            begin
              personnage.fer := personnage.fer-1; //on soustrait une unité de fer au stock du personnage
              personnage.argent:= personnage.argent+3;//on ajoute trois unité d'argent au stock du personnage

            end
            else
            begin
              writeln('Vous n''avez pas assez de fer') ; //sinon on affiche qu'il n'a pas assez de fer
              readln;
            end;
          end;

      3 : Begin
            if personnage.pierre >= 1 then //on vérifie que le joueur a assez de pierre
            begin
              personnage.pierre := personnage.pierre-1; //on soustrait une unité de pierre au stock du personnage
              personnage.argent:= personnage.argent+2;  //on ajoute deux unité d'argent au stock du personnage

            end
            else
            begin
              writeln('Vous n''avez pas assez de pierre') ;//sinon on affiche qu'il n'a pas assez de pierre
              readln;
            end;
          End;
      4 : quitter := false; //on quitte la procédure vendre
		end;
  end;
end;
//**************************FIN VENDRE*****************************************

//*************************CHAMPI-MARCHER**************************************
//*************************CHAMPI-MARCHER**************************************
//*************************CHAMPI-MARCHER**************************************

//**************************DEBUT ACHAT****************************************
procedure AchatChamp(var personnage : heros );  //procédure achat avec variable par référence personnage



var
	choix : Integer;  //variable numérique de type entier contenant le choix de l'utilisateur
	quitter : Boolean;  //variable de type boolean contenant la sortie de la procédure


begin
	quitter := true; //initialisation de la sortie sur vrai
  writeln('Que voulez vous achetez');  //Affichage d'une phrase de début
  readln;
	while quitter do  //début de boucle tant que quitter n'a pas la valeur fausse
	begin
    effacerEcran; //effacer l'écran pour afficher un autre
    writeln('Argent : ',personnage.argent); //afficher l'argent du personnage
    writeln('Stock de bois : ',personnage.bois);  //afficher le stock de bois du personnage
    writeln('Stock de pierre: ',personnage.pierre); //afficher le stock de pierre du personnage
    writeln('Stock de Fer: ',personnage.fer); //afficher le stock de fer du personnage
		writeln('Que voulez-vous faire?');  //on demande ce que veut faire le joueur
		writeln('1 - Acheter du bois(1po)'); //choix 1 on achete du bois
		writeln('2 - Acheter du fer(3po)');  //choix 2 on achete du fer
    writeln('3 - Acheter de la pierre(2po)'); //choix 3 on achete de la pierre
    writeln('4 - Acheter une armure légendaire(500po)');  //choix 4 on achete une armure
    writeln('5 - Acheter une epee ultra puissante(500po)');   //choix 5 on achete une épée
    writeln('6 - Acheter ''LA'' canne a peche de Jean-Guy(10po)'); //choix 6 acheter une canne à peche
		writeln('7 - Partir');   //Choix 7 Partir
		readln(choix);
		case choix of  //en fonction du choix:
			1 : Begin
            writeln('Vous voulez achetez combien d''unite bois?');
            readln(choix);
            if personnage.argent-choix >= 0 then  //on verifie que le joueur a assez d'argent
            begin
              personnage.bois := personnage.bois+choix; //on ajoute une unité de bois au stock du personnage
              personnage.argent:= personnage.argent-choix; //on soustrait une unité d'argent au stock du personnage
              upmarchand.argent := upmarchand.argent+choix;
            end
            else
            begin
              writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
              readln;
            end;
           End;

      2 : Begin
            writeln('Vous voulez achetez combien d''unite fer?');
            readln(choix);
            if personnage.argent-(choix*3) >= 0  then //on verifie que le joueur a assez d'argent
            begin
              personnage.fer := personnage.fer+choix; //on ajoute une unité de fer au stock du personnage
              personnage.argent:= personnage.argent-(3*choix); //on soustrait trois unité d'argent au stock du personnage
              upmarchand.argent := upmarchand.argent+(3*choix);
            end
            else
            begin
              writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
              readln;
            end;
          End;

      3 :Begin
        writeln('Vous voulez achetez combien d''unite pierre?');
        readln(choix);
          if personnage.argent-(choix*2) >= 0 then //on verifie que le joueur a assez d'argent
          begin
            personnage.pierre := personnage.pierre+choix; //on ajoute une unité de pierre au stock du personnage
            personnage.argent:= personnage.argent-(2*choix); //on soustrait deux unité d'argent au stock du personnage
            upmarchand.argent := upmarchand.argent+(2*choix);
          end
          else
          begin
            writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
            readln;
          end;
        End;
        4 : Begin
              if personnage.argent >= 500 then //on verifie que le joueur a assez d'argent
              begin
                if personnage.armure= 0 then  //on vérifie qu'il n'a pas déja une armure
                begin
                  personnage.armure := 1000; //on ajoute une armure au stock du personnage
                  personnage.argent:= personnage.argent-500; //on soustrait cent unité d'argent au stock du personnage
                  upmarchand.argent := upmarchand.argent+500;
                end
                else
                begin
                  writeln('Vous avez déja une armure!!!'); //sinon on affiche qu'il a déja une armure
                  readln;
                end
              end
              else
              begin
                writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
                readln;
              end;
            End;
        5 : Begin
              if personnage.argent >= 500 then //on verifie que le joueur a assez d'argent
              begin
                if personnage.arme = 0 then //on vérifie qu'il n'a pas déja une épée
                begin
                  personnage.arme := 100; //on ajoute une épée au stock du personnage
                  personnage.argent:= personnage.argent-500; //on soustrait cinquante unité d'argent au stock du personnage
                  upmarchand.argent := upmarchand.argent+500;
                end
                else
                begin
                  writeln('Vous avez déja une arme!'); //sinon on affiche qu'il a déja une arme
                  readln;
                end
              end
              else
              begin
                writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
                readln;
              end;
            End;

        6 : Begin
              if personnage.argent >= 10 then //on verifie que le joueur a assez d'argent
              begin
                if personnage.canAPech then //on vérifie qu'il n'a pas déja une épée
                begin
                  personnage.canAPech := true; //on ajoute une épée au stock du personnage
                  personnage.argent:= personnage.argent-10; //on soustrait cinquante unité d'argent au stock du personnage
                  upmarchand.argent := upmarchand.argent+10;
                end
                else
                begin
                  writeln('Vous avez déja ''LA'' canne a peche!'); //sinon on affiche qu'il a déja une arme
                  readln;
                end
              end
              else
              begin
                writeln('Vous n''avez pas assez de piece d''or!!'); //sinon on affiche qu'il n'a pas assez d'argent
                readln;
              end;
            End;
        7 : quitter := false; //on quitte la procédure achat
		  end;
	end;
end;

//**************************FIN ACHAT******************************************
//**************************DEBUT VENDRE***************************************

procedure vendreChamp(var personnage : heros ); //procédure vendre avec variable par référence personnage



var
	choix : Integer; //variable numérique de type entier contenant le choix de l'utilisateur
	quitter : Boolean; //variable de type boolean contenant la sortie de la procédure


begin
	quitter := true;  //initialisation de la sortie sur vrai
  writeln('Que voulez vous vendre?'); //Affichage d'une phrase de début
  readln;
	while quitter do  //début de boucle tant que quitter n'a pas la valeur fausse
	begin
    effacerEcran; //effacer l'écran pour afficher un autre
    writeln('Argent : ',personnage.argent); //afficher l'argent du personnage
    writeln('Stock de bois : ',personnage.bois);  //afficher le stock de bois du personnage
    writeln('Stock de pierre: ',personnage.pierre);  //afficher le stock de pierre du personnage
    writeln('Stock de Fer: ',personnage.fer);  //afficher le stock de fer du personnage
		writeln('Que voulez-vous faire?');  //on demande ce que veut faire le joueur
		writeln('1 - Vendre du bois(1po)'); //choix 1 vendre du bois
		writeln('2 - Vendre du fer(3po)');  //choix 2 vendre du fer
    writeln('3 - Vendre de la pierre(2po)'); //choix 3 vendre de la pierre
    writeln('4 - Vendre armure(Seulement repris pour 3 po)'); //choix 4 vendre armure
    writeln('5 - Vendre arme(Seulement repris pour 1po)');//choix 5 vendre epee
    writeln('6 - Vendre ''LA'' canne a peche de Jean Guy');//choix 5 vendre epee
		writeln('7 - Partir'); //choix 6 partir
		readln(choix);
		case choix of  //en fonction du choix:
      1 : Begin
            writeln('Vous voulez vendre combien d''unite bois?');
            readln(choix);
            if personnage.bois >= (1*choix) then //on vérifie que le joueur a assez de bois
            begin
              personnage.bois := personnage.bois - (1*choix); //on soustrait une unité de bois au stock du personnage
              personnage.argent:= personnage.argent + 1; //on ajoute une unité d'argent au stock du personnage

            end
            else
            begin
              writeln('Vous n''avez pas assez de bois') ; //sinon on affiche qu'il n'a pas assez de bois
              readln;
            end;
          end;

      2 : Begin
            writeln('Vous voulez vendre combien d''unite fer?');
            readln(choix);
            if personnage.fer >= (1*choix) then //on vérifie que le joueur a assez de fer
            begin
              personnage.fer := personnage.fer-(1*choix); //on soustrait une unité de fer au stock du personnage
              personnage.argent:= personnage.argent+(3*choix);//on ajoute trois unité d'argent au stock du personnage

            end
            else
            begin
              writeln('Vous n''avez pas assez de fer') ; //sinon on affiche qu'il n'a pas assez de fer
              readln;
            end;
          end;

      3 : Begin
            writeln('Vous voulez vendre combien d''unite pierre?');
            readln(choix);
            if personnage.pierre >= (1*choix) then //on vérifie que le joueur a assez de pierre
            begin
              personnage.pierre := personnage.pierre-choix; //on soustrait une unité de pierre au stock du personnage
              personnage.argent:= personnage.argent+(2*choix);  //on ajoute deux unité d'argent au stock du personnage

            end
            else
            begin
              writeln('Vous n''avez pas assez de pierre') ;//sinon on affiche qu'il n'a pas assez de pierre
              readln;
            end;
          End;

      4 : Begin
              begin
                if personnage.armure >= 1 then //on vérifie qu'il a une armure
                begin
                  personnage.armure := 0; //on remet a 0 l'armure
                  personnage.argent:= personnage.argent+3; //on ajoute 3 unité d'argent au stock du personnage

                end
                else
                begin
                  writeln('Vous n''avez pas d''armure!'); //sinon on affiche qu'il n'a pas d'armure
                  readln;
                end
              end
            End;

      5 : Begin
              begin
                if personnage.arme >= 1 then //on vérifie qu'il a une épée
                begin
                  personnage.arme := 0; //on ajoute une épée au stock du personnage
                  personnage.argent:= personnage.argent+1; //on ajoute 1 unité d'argent au stock du personnage

                end
                else
                begin
                  writeln('Vous n''avez pas d''arme!'); //sinon on affiche qu'il n'a pas d'arme
                  readln;
                end
              end
            End;
      6 : Begin
            writeln('Vous n''oseriez pas vendre ''LA'' canne a peche de Jean Guy!!!! ');
            readln;
          End;
      7 : quitter := false; //on quitte la procédure vendre
		end;
  end;
end;
//**************************FIN VENDRE*****************************************
end.

