```python
import sqlalchemy
```


```python
engine = sqlalchemy.create_engine('mysql+pymysql://hachem:tiger@localhost/simplon')
```


```python
import pandas
```


```python
data = pandas.read_sql_query("SELECT * FROM jeux_video", engine)
```


```python
print (data)
```

                                                Nom  \
    0               activitePrincipaleEtablissement   
    1               caractereEmployeurEtablissement   
    2     changementActivitePrincipaleEtablissement   
    3     changementCaractereEmployeurEtablissement   
    4    changementDenominationUsuelleEtablissement   
    5               changementEnseigneEtablissement   
    6      changementEtatAdministratifEtablissement   
    7                                     dateDebut   
    8                                       dateFin   
    9              denominationUsuelleEtablissement   
    10                       enseigne1Etablissement   
    11                       enseigne2Etablissement   
    12                       enseigne3Etablissement   
    13               etatAdministratifEtablissement   
    14                                          nic   
    15  nomenclatureActivitePrincipaleEtablissement   
    16                                        siren   
    17                                        siret   
    
                                                  Libellé  Longueur  \
    0   Activité principale de l'établissement pendant...         6   
    1              Caractère employeur de l’établissement         1   
    2   Indicatrice de changement de l’activité princi...         5   
    3   Indicatrice de changement du caractère employe...         5   
    4   Indicatrice de changement de la dénomination u...         5   
    5   Indicatrice de changement de l’enseigne de l’é...         5   
    6   Indicatrice de changement de l’état administra...         5   
    7   Date de début d'une période d'historique d'un ...        10   
    8   Date de fin d'une période d'historique d'un ét...        10   
    9             Dénomination usuelle de l’établissement       100   
    10       Première ligne d’enseigne de l’établissement        50   
    11       Deuxième ligne d’enseigne de l’établissement        50   
    12      Troisième ligne d’enseigne de l’établissement        50   
    13              État administratif de l’établissement         1   
    14    Numéro interne de classement de l'établissement         5   
    15  Nomenclature d’activité de la variable activit...         8   
    16                                       Numéro Siren         9   
    17                                       Numéro Siret        14   
    
                  Type  Ordre  
    0   Liste de codes     14  
    1   Liste de codes     17  
    2            Texte     16  
    3            Texte     18  
    4            Texte     13  
    5            Texte     11  
    6            Texte      7  
    7             Date      5  
    8             Date      4  
    9            Texte     12  
    10           Texte      8  
    11           Texte      9  
    12           Texte     10  
    13  Liste de codes      6  
    14           Texte      2  
    15  Liste de codes     15  
    16           Texte      1  
    17           Texte      3  



```python
from sqlalchemy import create_engine
import pandas as pd
import time

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importcsv(link, table, date):
    print("Lecture des données")
    start_time = time.time()
    csize = 300000
    df = pd.read_csv(link, compression = 'zip', chunksize = csize, parse_dates = date)
    print("Données lu")
    i = csize
    for chunk in df:
        chunk.to_sql(table, con = engine, if_exists='append', index = False)
        i += csize
        print(i)
    return print("Temps d execution : %s secondes ---" % (time.time() - start_time))


importcsv('https://www.data.gouv.fr/fr/datasets/r/377fd07c-e37f-491a-a507-7bf5b690804b', 'etablissement', ['dateCreationEtablissement', 'anneeEffectifsEtablissement', 'dateDernierTraitementEtablissement', 'dateDebut'])
```


```python
from sqlalchemy import create_engine
import pandas as pd
import time

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importcsv(link, table, date):
    print("Lecture des données")
    start_time = time.time()
    csize = 300000
    df = pd.read_csv(link, compression = 'zip', chunksize = csize, parse_dates = date)
    print("Données lu")
    i = csize
    for chunk in df:
        chunk.to_sql(table, con = engine, if_exists='append', index = False)
        i += csize
        print(i)
    return print("Temps d execution : %s secondes ---" % (time.time() - start_time))


importcsv('https://www.data.gouv.fr/fr/datasets/r/09af65ff-c1c6-40bb-bfcb-b80f7ac93b72', 'historique_etablissement', ['dateFin', 'dateDebut'])
```
