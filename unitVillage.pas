unit unitVillage;

interface

uses
GestionEcran,gestionnaire,uniteAraign;

procedure foretMojo(var personnage:heros);


implementation

procedure foretMojo(var personnage:heros);

var
choix,choix2:integer; //Valeur que prend les r�ponses du joueur.
quitter: boolean;
  i: Integer; //Variable qui permet de quitter la boucle

begin
  quitter:=true; //Initialisation de la variable quitter
  effacerEcran;
  writeln('Apres avoir explorer la foret, vous arrive dans un petit village'); //texte d�crivant
  writeln('Que voulez vous faire'); //Question
  writeln('1-Aller dans le village'); //Premier choix
  writeln('2-Quitter'); //Second choix
  readln(choix);
  effacerEcran;

  case choix of  //Premier case en rapport avec le choix de l'utlisateur
    1:begin
        writeln('Vous entrez dans le village. Vous appercevez des petit personnage'); //texte
        writeln('avec une feuille sur la t�te.');//texte
        writeln('1-Tuer ces petits etres chetifs');//Nouveau choix
        writeln('2-Parler avec ces petits etres');//Nouveau choix
        writeln('3-Rentrer dans une maison et dormir');//Nouveau choix
        writeln('4-Quitter');
        readln(choix2);
        case choix2 of
           1:BEGIN
              for i := 1 to 8 do
              petitMojo(personnage,monstre);//combat contre un mojo
             END;
           2: begin
                writeln('Ne me tuer pas !');
                readln;
              end;
           3: begin
                personnage.vie := 100; //Le joueur r�cup�re sa vie
                writeln('Vous vous sentez mieux a present'); //texte pr�sentant la r�generartion (like doctor)
              end;
           4: quitter:= false;
        end;
      end;
    2:quitter:= false;
  end;
end;

end.
