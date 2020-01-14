use siret;
select activitePrincipaleEtablissement , siret, LIB_NAP15 
from etablissement
inner join nap_1973_1993 on etablissement.activitePrincipaleEtablissement = nap_1973_1993.NAP600
where libelleCommuneEtablissement like 'MARSEILLE%'

union

select activitePrincipaleEtablissement, siret, libellé
from etablissement
inner join niveau_1993 on etablissement.activitePrincipaleEtablissement = niveau_1993.N_700
inner join liste_1993 on niveau_1993.N_17 = liste_1993.code 
where libelleCommuneEtablissement like 'MARSEILLE%'


union

select activitePrincipaleEtablissement, siret, libellé
from etablissement
inner join niveau_2003 on etablissement.activitePrincipaleEtablissement = niveau_2003.N_700
inner join liste_2003 on niveau_2003.N_17 = liste_2003.code 
where libelleCommuneEtablissement like 'MARSEILLE%'

union

select activitePrincipaleEtablissement, siret, LIB_NAP15
from etablissement
inner join niveau_2008 on etablissement.activitePrincipaleEtablissement = niveau_2008.N_700
inner join liste_2008 on niveau_2008.N_700 = liste_2008.LIB_NAP15
where libelleCommuneEtablissement like 'MARSEILLE%';

