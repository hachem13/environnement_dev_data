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



    ---------------------------------------------------------------------------

    KeyboardInterrupt                         Traceback (most recent call last)

    <ipython-input-33-c78731b6d07a> in <module>
         20 
         21 
    ---> 22 importcsv('https://www.data.gouv.fr/fr/datasets/r/09af65ff-c1c6-40bb-bfcb-b80f7ac93b72', 'historique_etablissement', ['dateFin', 'dateDebut'])
    

    <ipython-input-33-c78731b6d07a> in importcsv(link, table, date)
         10     start_time = time.time()
         11     csize = 300000
    ---> 12     df = pd.read_csv(link, compression = 'zip', chunksize = csize, parse_dates = date)
         13     print("Données lu")
         14     i = csize


    ~/anaconda3/lib/python3.7/site-packages/pandas/io/parsers.py in parser_f(filepath_or_buffer, sep, delimiter, header, names, index_col, usecols, squeeze, prefix, mangle_dupe_cols, dtype, engine, converters, true_values, false_values, skipinitialspace, skiprows, skipfooter, nrows, na_values, keep_default_na, na_filter, verbose, skip_blank_lines, parse_dates, infer_datetime_format, keep_date_col, date_parser, dayfirst, cache_dates, iterator, chunksize, compression, thousands, decimal, lineterminator, quotechar, quoting, doublequote, escapechar, comment, encoding, dialect, error_bad_lines, warn_bad_lines, delim_whitespace, low_memory, memory_map, float_precision)
        683         )
        684 
    --> 685         return _read(filepath_or_buffer, kwds)
        686 
        687     parser_f.__name__ = name


    ~/anaconda3/lib/python3.7/site-packages/pandas/io/parsers.py in _read(filepath_or_buffer, kwds)
        438     # See https://github.com/python/mypy/issues/1297
        439     fp_or_buf, _, compression, should_close = get_filepath_or_buffer(
    --> 440         filepath_or_buffer, encoding, compression
        441     )
        442     kwds["compression"] = compression


    ~/anaconda3/lib/python3.7/site-packages/pandas/io/common.py in get_filepath_or_buffer(filepath_or_buffer, encoding, compression, mode)
        199             # Override compression based on Content-Encoding header
        200             compression = "gzip"
    --> 201         reader = BytesIO(req.read())
        202         req.close()
        203         return reader, encoding, compression, True


    ~/anaconda3/lib/python3.7/http/client.py in read(self, amt)
        468             else:
        469                 try:
    --> 470                     s = self._safe_read(self.length)
        471                 except IncompleteRead:
        472                     self._close_conn()


    ~/anaconda3/lib/python3.7/http/client.py in _safe_read(self, amt)
        618         s = []
        619         while amt > 0:
    --> 620             chunk = self.fp.read(min(amt, MAXAMOUNT))
        621             if not chunk:
        622                 raise IncompleteRead(b''.join(s), amt)


    ~/anaconda3/lib/python3.7/socket.py in readinto(self, b)
        587         while True:
        588             try:
    --> 589                 return self._sock.recv_into(b)
        590             except timeout:
        591                 self._timeout_occurred = True


    ~/anaconda3/lib/python3.7/ssl.py in recv_into(self, buffer, nbytes, flags)
       1069                   "non-zero flags not allowed in calls to recv_into() on %s" %
       1070                   self.__class__)
    -> 1071             return self.read(nbytes, buffer)
       1072         else:
       1073             return super().recv_into(buffer, nbytes, flags)


    ~/anaconda3/lib/python3.7/ssl.py in read(self, len, buffer)
        927         try:
        928             if buffer is not None:
    --> 929                 return self._sslobj.read(len, buffer)
        930             else:
        931                 return self._sslobj.read(len)


    KeyboardInterrupt: 



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

```


```python

```
