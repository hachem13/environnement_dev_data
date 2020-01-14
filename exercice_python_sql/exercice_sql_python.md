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

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret") # etablire la connection entre python et mysql

def importcsv(link, table, date): # definir une fonction (le lien url fichier csv, table, date)
    print("Lecture des données") 
    start_time = time.time() # variable enrigistre le temps du début de la fonction 
    csize = 300000 # variable csize on lui donne une valeur 
    df = pd.read_csv(link, compression = 'zip', chunksize = csize, parse_dates = date) """definir une variable on 
    importe pondas et lire le ficher csv specifier le fichier compressé, chunksize pour découpé le 
    fichier(cartographie des donnée), parse_date specifier que tel
    et tel colonne  sans on date """ 
    print("Données lu")
    i = csize # initialise la variable i pour lire le csize  
    for chunk in df: # crée une boucle pour chaqu'une des partie dans df
        chunk.to_sql(table, con = engine, if_exists='append', index = False) """pour chaque partie on ecrit dans la 
        base de donné, con = engine c'est tous ce qu'on as avec egine on l'importe sur la table, if_exists='append'
        si la table existe on l'ajoute, index = False il ne faut pas ecrire le numéros de ligne"""
        i += csize """on demande à i d'augmenter ca valeur """
        print(i)
    return print("Temps d'execution : %s secondes ---" % (time.time() - start_time)) """la fonction on lui demande 
    de retourné un print (le temps d'execution une compareson entre le temps de départ et la fin)"""


importcsv('https://www.data.gouv.fr/fr/datasets/r/377fd07c-e37f-491a-a507-7bf5b690804b', 'etablissement', 
          ['dateCreationEtablissement', 'anneeEffectifsEtablissement', 'dateDernierTraitementEtablissement', 
           'dateDebut'])
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

    Lecture des données



```python
import pandas as pd


liste_1993 = pd.read_excel ('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/niveau_1993.xls', set ='\t')
print (liste_1993)

```

        NAF_1993 Unnamed: 1 Unnamed: 2 Unnamed: 3 Unnamed: 4
    0      N_700      N_220       N_60       N_31       N_17
    1      01.1A       01.1         01         AA          A
    2      01.1C       01.1         01         AA          A
    3      01.1D       01.1         01         AA          A
    4      01.1F       01.1         01         AA          A
    ..       ...        ...        ...        ...        ...
    692    93.0K       93.0         93         OO          O
    693    93.0L       93.0         93         OO          O
    694    93.0N       93.0         93         OO          O
    695    95.0Z       95.0         95         PP          P
    696    99.0Z       99.0         99         QQ          Q
    
    [697 rows x 5 columns]



```python
link = '/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/liste_1993.xls'
```


```python
df = pd.read_excel(link , skiprows=0,header=1)
print (df)
```

       Code                                            Libellé
    0     A                  Agriculture, chasse, sylviculture
    1     B                                 Pêche, aquaculture
    2     C                             Industries extractives
    3     D                           Industrie manufacturière
    4     E  Production et distribution d'électricité, de g...
    5     F                                       Construction
    6     G  Commerce ; réparations automobile et d'article...
    7     H                              Hôtels et restaurants
    8     I                       Transports et communications
    9     J                              Activités financières
    10    K   Immobilier, location et services aux entreprises
    11    L                            Administration publique
    12    M                                          Education
    13    N                            Santé et action sociale
    14    O         Services collectifs, sociaux et personnels
    15    P                               Services domestiques
    16    Q                      Activités extra-territoriales



```python
df.to_sql('liste_1993', con = engine, if_exists='replace', index = False)
```


```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table):
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0,header=1)
    df.to_sql('liste_1993', con = engine, if_exists='replace', index = False)
    return print("fin")

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/liste_1993.xls', 'liste_1993')

```

    Lecture des données
    fin



```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table):
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0,header=1)
    
    df.to_sql('niveau_1993', con = engine, if_exists='replace', index = False)
    return print("fin")


importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/niveau_1993.xls','niveau_1993')

```

    Lecture des données
    fin



```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table):
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0,header=1)
    df.to_sql('liste_2003', con = engine, if_exists='replace', index = False)
    return print("fin")

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/liste_2003.xls','liste_2003')
```

    Lecture des données
    fin



```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table):
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0,header=1)
    df.to_sql('niveau_2003', con = engine, if_exists='replace', index = False)
    return print("fin")

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/niveau_2003.xls','niveau_2003')
```

    Lecture des données
    fin



```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table):
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0,header=1)
    df.to_sql('liste_2008', con = engine, if_exists='replace', index = False)
    return print("fin")

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/liste_2008.xls','liste_2008')

```

    Lecture des données
    fin



```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table): """definir une variable on 
    importe pondas et lire le ficher csv specifier le fichier compressé, chunksize pour découpé le 
    fichier(cartographie des donnée), parse_date specifier que tel
    et tel colonne  sans on date """ 
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0)
    df.to_sql('liste_2008', con = engine, if_exists='replace', index = False)
    return print("fin")

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/niveau_2008.xls','niveau_2008')

```

    Lecture des données
    fin



```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret")

def importexcel(link, table):
    print("Lecture des données")
    df = pd.read_excel(link , skiprows=0,header=1) # ne pas prendre en compte l'entete 
    df.to_sql('liste_2008', con = engine, if_exists='replace', index = False)
    return print("fin")

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/niveau_2008.xls','niveau_2008')

```


```python
from sqlalchemy import create_engine # importation des librairies
import pandas as pd

engine = create_engine("mysql+pymysql://hachem:tiger@localhost/siret") """ etablire la connection entre python et mysql """

def importexcel(link, table): # définition de la fonction importexcel
    print("Lecture des données") # afficher la lecture
    df = pd.read_excel(link , skiprows=0) """definir une variable on 
    importe pondas et lire le ficher excel en specifient le lien et sauter la ligne 0 """ 
    df.to_sql('liste_2008', con = engine, if_exists='replace', index = False) """pour chaque partie on ecrit dans la 
        base de donné, con = engine c'est tous ce qu'on as avec egine on l'importe sur la table, if_exists='replace '
        si la table existe on remplace la , index = False il ne faut pas ecrire le numéros de ligne"""
    return print("fin") # affiche fin 

importexcel('/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python_sql/NAP_1973_1993.xls','NAP_1973_1993')

```

    Lecture des données
    fin



```python

```
