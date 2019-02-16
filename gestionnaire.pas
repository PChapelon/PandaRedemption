unit gestionnaire;



interface

type
	heros = record   //type permettant de stocker toutes les variables concernant le personnage
        nom : string;//le nom
        vie : Integer;//la vie
        pierre : Integer;//la quantité de pierre
        fer : integer;//la quantité de fer
        bois : integer;//la quantité de bois
        poisson : integer;//la quantité de poisson
        force : integer;//les dégâts de base
        bamboo : integer;//la quantité de bamboo
        arme : integer;//le bonus de dégât donné par l'arme
        armure : integer;//le bonus de défense
        CanAPech : boolean;//la possession de la canne à pêche
        argent : integer;//la quantité d'argent
        soupe : boolean;//la possession de la soupe
        pioche : boolean;//la possession de la pioche
        hache : boolean;// la possession de la hache
        potion : integer;// la quantité de potion
        mort : boolean;// la gestion de la mort
        legumes : record//type record regroupant la quantité de légumes de chaque sorte porté par le personnage
                woompas : integer;//les woompas
                aubergines : integer;//les aubergines
                carottes : integer;//les carottes
                end;

        plantation : record//type record regroupant la présence de plantations
                   aubergines : boolean;//pour les aubergines
                   carottes : boolean;//pour les carottes
                   woompas : boolean;//pour les woompas
                   temps : integer;//gestion du temps des plantations
                   end;

        graine : record//type record regroupant la quantité de graines
                    woompas : integer;//de woompas
                    aubergines : integer;//d'aubergines
                    carottes : integer;//de carottes
                   end;

        event : record//type record correspond aux différents évènements
                    potager : boolean;//la construction du potager
                    plantation : boolean;//la présennce de plantations
                    lutin : boolean;//l'apparition du lutin
                    boss : boolean;//le combat contre le boss
                    panda : boolean;//la quête donnée par le panda
                    fin : boolean;//l'affichage des crédits
                    end;
        end;

  monster = record //type permettent de stocker toutes les variables concernant les monstres
      nom : string;//son nom
      vie : integer;//sa vie
      force : integer;//les dégâts de base
      defense : integer;//le bonus de défense
      arme : integer;//le bonus de dégât donné par l'arme
      end;


  stock = record  //type permattant de stocker les variables concernant le coffre
      pierre : integer;//le stock de pierre
      fer : integer;//le stock de fer
      bois : integer;//le stock de bois
      end;
  champimar = record
      argent : integer;//variable contenant l'argent économisé par le marchand
      end;

var
  personnage : heros; //variable contenant les informations sur le joueur
  monstre : monster; //variable contenant les informations sur le monstre
  coffre : stock; //variable contenant les informations sur le coffre
  Upmarchand : champimar;//variable contenant les informations sur le champimarché


procedure statPerso(var personnage : heros); //procédure permettant d'afficher les statistiques du joueur hors combat


Implementation

procedure statPerso(var personnage : heros);  //procédure permettant d'afficher les statistiques du joueur hors combat

begin
	writeln('Point de vie : ',personnage.vie); //sa vie
	writeln('Point d''armure : ',personnage.armure); //son armure
	writeln('Point de force : ',personnage.arme); //ses points donnés par son arme
	writeln('Argent : ', personnage.argent); //son argent
  writeln('');
end;
end.



