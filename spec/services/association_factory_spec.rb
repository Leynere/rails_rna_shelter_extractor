require 'rails_helper'
require 'csv'

RSpec.describe "Association Factory", type: :service do
    def parse(csv)
        CSV.parse(csv, headers: true, col_sep: ";").first.to_h
    end
    describe "isValidAssociation" do
        subject(:csv) {  "id;id_ex;siret;rup_mi;gestion;date_creat;date_decla;date_publi;date_disso;nature;groupement;titre;titre_court;objet;objet_social1;objet_social2;adrs_complement;adrs_numvoie;adrs_repetition;adrs_typevoie;adrs_libvoie;adrs_distrib;adrs_codeinsee;adrs_codepostal;adrs_libcommune;adrg_declarant;adrg_complemid;adrg_complemgeo;adrg_libvoie;adrg_distrib;adrg_codepostal;adrg_achemine;adrg_pays;dir_civilite;siteweb;publiweb;observation;position;maj_time\n"  }

        # All good
        it "Running animal protection association" do
            csv <<  "W9T1002867;;;;9T1P;2015-12-29;2015-12-29;2016-01-09;0001-01-01;D;S;LA VIE D'UN AGRICULTEUR & LA VIE D'UN ANIMAL;LA VIE D'UN AGRICULTEUR & LA VIE D...;protéger la culture et les makis ainsi que d'autres animaux,  veiller à leur bien-être et subvenir à tous leurs besoins jusqu'à leur mort,  les animaux recueillis ne feront l'objet d'aucun aspect commercial tels que la vente, reproduction, location;024026;000000;Hamjago;16;;;Dallage Iliassa, quartier Magoujou;_;97612;97630;M tsamboro;;Hamjago;;quartier Tchad;;97630;M tsamboro;FRANCE;PM;;0;;A;2016-01-09 12:46:10"
            expect(AssociationFactory.isValidAssociation(parse(csv))).to match(true)
        end

        # position not A
        it "Not running animal protection association" do
            csv <<  "W9T1002359;;;;9T1P;2014-06-12;2024-10-13;2014-06-28;2020-09-30;D;S;ESCALE;ESCALE;contribuer à l'étude et au suivi des populations vertébrés marins et de leurs habitats et plus particulièrement les tortues ,  valoriser et diffuser les connaissances acquises ,  sensibiliser à la conservation du patrimoine naturel et culturel associés aux tortues marins ,  contribuer aux actions en faveur de l'élaboration et de la mise en oeuvre de stratégie visant à conserver les tortues et leurs habitats ,  favoriser, développer, encadrer, gérer et suivre les activités éco touristiques associées ,  associer à ses actions, une action humanitaires aux populations villageoises de pays en développement et investit dans la conservation des tortues marins ,  financer ses actions en sus des dons, cotisations, subventions, par toute activité économique ou commerciale approprié;024026;024020;;;;;Jardins des épices - Immeuble le Cannelier;_Tsoundzou 2;97611;97600;Mamoudzou;;;;42BIS CHEMIN MERLO - VILLA RUISSEAU 1;;97425;LES AVIRONS;FRANCE;TS;;0;;D;2024-10-22 10:08:36"
          expect(AssociationFactory.isValidAssociation(parse(csv))).to match(false)
        end

        # objet_social1 and objet_social2 not 024026
        it "Running not animal protection association" do
            csv <<  "W9T1000001;;;;9T1P;2008-09-24;2008-09-24;2008-10-18;0001-01-01;D;S;ASSOCIATION DES JURISTES DE L'OCEAN INDIEN SECTION MAHORAISE  (A.J.O.I. SECTION MAHORAISE);AJOI SECTION MAHORAISE;promouvoir un espace juridique sécurisé, les valeurs fondamentales d'équité, d'accès au droit et d'égalité entre tous les citoyens de la zone, une harmonisation des législations et pratiques juridiques pour rendre plus accessibles et efficaces les droits reconnus aux citoyens;004020;000000;Immeuble douka;;;RUE;du stade;B.P. 1328_;97611;97600;Mamoudzou;;Immeuble douka;;rue du stade;BP 1328;97600;Mamoudzou;FRANCE;PM;;0;;A;2008-11-05 06:15:30"
          expect(AssociationFactory.isValidAssociation(parse(csv))).to match(false)
        end

        # objet_social1 and objet_social2 not 024026 and position not A
        it "Not running not animal protection association" do
            csv <<  "W9T1000018;9851000014;;;9T1P;1992-06-30;2024-05-15;1992-09-09;2024-05-15;D;S;ASSOCIATION AUTONOME DES PARENTS D'ELEVES DE OUANGANI;AAPEO;representer les parents d'élèves auprès de l'administration des établissements d'enseignement, du corps enseignant, de l'autorité académique et des pouvoirs publics et de tout autre organisme,  coopérer avec les instances et organisations désignées à tout ce qui concerne l'éducation des élèves au point de vue moral, intellectuel et  matériel,participer dans les cadres légaux à l'élaboration des projets de réformes de l'enseignement,  maintenir au sein des établissements d'enseignement le r;015005;015005;;;;;place Zakia MADI;_Ouangani;97614;97670;Coconi;;;;QUARTIER KAVANI-BÉ;;97670;OUANGANI;FRANCE;PM;;0;Reprise  =>  date ag=0000-00-00;D;2024-05-21 10:08:40"
          expect(AssociationFactory.isValidAssociation(parse(csv))).to match(false)
        end
    end
end
