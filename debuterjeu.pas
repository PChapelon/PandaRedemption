unit debuterJeu;

interface

uses
  GestionEcran,gestionnaire,croisementLieu,house;


procedure commencement(var personnage : heros; var coffre : stock);
procedure debutJeu();

implementation

procedure debutJeu();//procédure permettant de choisir entre suitter le jeu ou lancer une partie

var
  quitter : boolean; //permet de  sortir de la boucle
  choix : integer; //correspond à ce que choisit le joueur


begin
  quitter := true;
  while quitter do
  begin
    effacerEcran;
    writeln(' ______                 _          ');
    writeln('(_____ \               | |       ');
    writeln(' _____) )____ ____   __| |_____     ');
    writeln('|  ____(____ |  _ \ / _  (____ |  ');
    writeln('| |    / ___ | | | ( (_| / ___ |  ');
    writeln('|_|    \_____|_| |_|\____\_____|  ');
    writeln('');
    writeln(' ______            _                        _             ');
    writeln('(_____ \          | |                   _  (_)            ');
    writeln(' _____) )_____  __| |_____ ____  ____ _| |_ _  ___  ____  ');
    writeln('|  __  /| ___ |/ _  | ___ |    \|  _ (_   _) |/ _ \|  _ \ ');
    writeln('| |  \ \| ____( (_| | ____| | | | |_| || |_| | |_| | | | |');
    writeln('|_|   |_|_____)\____|_____)_|_|_|  __/  \__)_|\___/|_| |_|');
    writeln('                                |_|                       ');
    writeln('');
    writeln('1 - Commencer une partie');
    writeln('2 - Quitter');
    writeln('');
    readln(choix);
    case choix of
        1 : commencement(personnage,coffre); //on lance le jeu
        2 : quitter := false; //le joueur quitte le jeu
    end;
  end;


end;




procedure commencement(var personnage : heros; var coffre : stock);//procedure permettant l'initialisation de toutes les variables

begin
     effacerEcran;
     writeln('Quel est votre nom aventurier?');
     readln(personnage.nom);   //enregistre le nom choisi par l'utilisateur
     Upmarchand.argent := 0;//initialisation de l'argent du marchand
     personnage.poisson := 0;//initialisation du poisson du personnage
     personnage.canAPech := false;//initialisation de la canne a peche a faux
     personnage.potion := 0;//initialisation des potions dans l'inventaire du personnage
     personnage.bamboo := 0;//initialisation du stock de bamboo du personnage
     personnage.legumes.woompas := 0;//initialisation du stock de woompas 
     personnage.legumes.carottes := 0;//initialisation du stock de carottes
     personnage.legumes.aubergines := 0;//initialisation du stock d'aubergines
     personnage.plantation.aubergines := false;//initialisation de la variable vérifiant la présence des aubergines plantées
     personnage.plantation.carottes:= false;//initialisation de la variable vérifiant la présence des carottes plantées
     personnage.plantation.woompas := false;//initialisation de la variable vérifiant la présence des woompas plantées
     personnage.plantation.temps := 0;//initialisation de la variable du temps des plantations
     personnage.graine.woompas := 0;//initialisation du stock de graines de woompas
     personnage.graine.aubergines := 0;//initialisation du stock de graines d'aubergines
     personnage.graine.carottes := 0;//initialisation du stock de graines de carottes
     personnage.event.potager := false;//initialisation de la variable notant la présence du potager
     personnage.event.plantation := false;//initialisation de la présence de plantation dans le potager
     personnage.event.lutin := true;//initialisation de la présence du lutin dans l'étang
     personnage.event.boss := false;//initialisation de la possibilité de combattre le boss
     personnage.event.panda := true;//initialisation de la quête donnée par le combat
     personnage.event.fin := false;//initialisation des crédits
     personnage.mort := false; //initialisation des variables concernant le personnages
     personnage.pioche:= false;//initialisation de la pioche dans l'inventaire
     personnage.hache := false;//initialisation de la hache dans l'inventaire
     personnage.soupe := false;//initialisation de l'objet de quête 
     personnage.vie := 100;    //initialisation de vie du personnage
     personnage.pierre := 0;   //initialisation du stock de pierre du personnage
     personnage.fer := 0;      //initialisation du stock de fer du personnage
     personnage.bois := 0;     //initialisation du stock de bois du personnage
     personnage.argent := 0;   //initialisation de l'argent du personnage
     personnage.arme := 0;     //initialisation a 0 de l'arme du personnage(il n'en a pas)
     personnage.armure := 0;   //initialisation a 0 de l'armure du personnage(il n'en a pas)
     coffre.pierre := 0;       //initialisation du stock de pierre du coffre
     coffre.fer := 0;          //initialisation du stock de fer du coffre
     coffre.bois := 0;         //initialisation du stock de bois du coffre
     maison(personnage,coffre);//fait appel a l'unité maison
     effacerEcran;             //efface l'écran pour afficher le prochain
     writeln('Un goblin surgit devant vous, brandissant un epee en l''air tout en se');
     writeln('dirigeant vers la mine et criant : "JE SUIS UN BASILIC!!!!!!"');
     readln;
     croisement(personnage );  //fait appel a l'unité croisement
     readln;
end;


end.

