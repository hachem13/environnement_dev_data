#!/usr/bin/env python
# coding: utf-8

# In[9]:


"""Lire le fichier « thanksgiving.csv » avec la librairie pandas et l’assigner
à une variable data"""
import pandas as pd

data = pd.read_csv("/Users/mosbahhachem/Documents/git/environnement_dev_data/exercice_python/Analyse_données_python/thanksgiving.csv", encoding = "latin-1")

print(data)


# In[10]:


"""Afficher les premières lignes du dataframe"""

print(data.head())


# In[11]:


"""Afficher le noms des colonnes avec l’attribut columns"""
print(data.columns)


# In[12]:


"""Utiliser la méthode Series.values_count() pour afficher le décompte
du nombre de réponses pour chacune des modalités de la colonnes
« Do you celebrate Thanksgiving?"""

print(data['Do you celebrate Thanksgiving?'].value_counts())


# In[13]:


"""Filtrer et garder toute les ligne du dataframe pour lesquelles la
réponse à la question « Do you celebrate Thanksgiving? » est « Yes »."""

print(data.loc[data['Do you celebrate Thanksgiving?']=="Yes",:])


# In[14]:


"""Assigner ce nouveau dataframe à data et affiché le"""

data = data[data['Do you celebrate Thanksgiving?']=="Yes"]

print(data)


# In[15]:


"""Utiliser la méthode Series.values_count() pour afficher combien de
fois chaque résultats apparait pour la question « What is typically the
main dish at your Thanksgiving dinner? »"""

print(data['What is typically the main dish at your Thanksgiving dinner?'].value_counts())


# In[16]:


"""Afficher la colonne « Do you typically have gravy? » pour les ligne du
dataframe data pour lesquelles la colonne « What is typically the
main dish at your Thanksgiving dinner? » vaut « Tofurkey » pour la
dinde de tofu"""

print(data.loc[data['What is typically the main dish at your Thanksgiving dinner?']=="Tofurkey",:])


# In[17]:


"""Créer un objet Series indiquant avec des booléens les valeurs de la colonnes « Which
type of pie is typically served at your Thanksgiving dinner? Please select all that apply. -
Apple » qui sont nulles.
Assigner le résultat à la variable « apple_isnull »"""


apple_isnull = pd.isnull(data["Which type of pie is typically served at your Thanksgiving dinner? Please select all that apply. - Apple"])
print(apple_isnull)


# In[18]:


"""• Créer un objet Series indiquant avec des booléens les valeurs de la colonnes « Which
type of pie is typically served at your Thanksgiving dinner? Please select all that apply. -
Pumpkin » qui sont nulles.
Assigner le résultat à la variable « pumpkin_isnull ».
• Créer un objet Series indiquant avec des booléens les """

pumpkin_isnull = pd.isnull(data["Which type of pie is typically served at your Thanksgiving dinner? Please select all that apply. - Apple"])

print(pumpkin_isnull)


# In[19]:


"""Créer un objet Series indiquant avec des booléens les valeurs de la colonnes « Which
type of pie is typically served at your Thanksgiving dinner? Please select all that apply. -
Pecan » qui sont nulles.
Assigner le résultat à la variable « pecan_isnull »"""

pecan_isnull = pd.isnull(data["Which type of pie is typically served at your Thanksgiving dinner? Please select all that apply. - Apple"])

print(pecan_isnull)


# In[20]:


"""Combiner les trois objets Series avec l’operateur « & » et assigné le résultat à la variable
« pies »"""


pies = apple_isnull & pumpkin_isnull & pecan_isnull

print(pies)


# In[21]:


"""Afficher les valeurs unique et combien de fois elle apparaissent dans la colonnes de pies"""


print(pies.value_counts())


# In[22]:


"""Ecrire une fonction qui converti une chaîne de caractère en une valeur
entière. Cela permettra de convertir les valeurs de la colonne « Age » en
entiers. Cette fonction prendra en paramètre une chaîne de caractères (les
valeurs actuelles de la colonne « Age »)"""

def is_null(str):
    if pd.isnull(str):
        return None
    l = str.split(' ')
    l = l[0]
    l = l.replace("+", "")
    l = int(l)
    
    return l


# In[23]:


""" Utiliser la méthode Series.apply() pour appliquer la fonction à chaque
valeur de la colonne ‘Age’ du dataframe data"""

data["int_age"] = data["Age"].apply(is_null)

print(data["int_age"])


# In[24]:


"""Appeler la méthode Series.describe() sur la colonne « int_age » du
dataframe data et afficher le résultat"""

print(data["int_age"].describe())


# In[25]:


"""Ecrire une fonction pour convertir les revenus en valeur unique de format entier"""

def is_null(str):
    if pd.isnull(str):
        return None
    l = str.split(' ')
    l = l[0]
    if l == "Prefer":
        return None
    l = l.replace("$", "")
    l = l.replace(",", "")
    l = int(l)
    return l    


# In[26]:


"""Utiliser la méthode Series.apply() pour appliquer la fonction précédente à chaque
valeur de la colonne « How much total combined money did all members of your
HOUSEHOLD earn last year? » du dataframe data"""

data["int_income"] = data["How much total combined money did all members of your HOUSEHOLD earn last year?"].apply(is_null)

print(data["int_income"])


# In[27]:


print(data["int_income"].describe())


# In[28]:


"""Regarder de quel manière les personnages gagnant moins de 150 000
dollars voyagent"""
personnages = data[data["int_income"] < 150000] 
print(personnages)


# In[29]:


"""Utiliser la méthode value_counts() pour compter combien e fois chaque
vaaleur apparait dans la colonne."""

print(personnages["How far will you travel for Thanksgiving?"].value_counts())


# In[30]:


"""Faire de même avec les personnages gagnant plus de 150 000 dollars"""

personnages1 = data[data["int_income"] > 150000]

print(personnages1["How far will you travel for Thanksgiving?"].value_counts())


# In[33]:


"""Générer un pivot de table montrant la moyenne d’âge des sondés
pour chaque catégorie des questions « Have you ever tried to meet
up with hometown friends on Thanksgiving night? » et « Have you
ever attended a "Friendsgiving?" »."""

print(data.pivot_table(index = ['Have you ever tried to meet up with hometown friends on Thanksgiving night?'], columns = ['Have you ever attended a "Friendsgiving?"'], values=['int_age'], aggfunc=pd.Series.mean))


# In[34]:


"""Faire de même avec les revenus avec ces deux questions"""

print(data.pivot_table(index = ['Have you ever tried to meet up with hometown friends on Thanksgiving night?'], columns = ['Have you ever attended a "Friendsgiving?"'], values=['int_income'], aggfunc=pd.Series.mean))

