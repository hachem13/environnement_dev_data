```python
"""Ecrire une fonction hascap(s) qui renvoie tout les mots de la chaîne
s commençant par une majuscule"""

from re import findall
s = "Onze ans déjà que cela passe vite Vous "
s += "vous étiez servis simplement de vos armes la "
s += "mort n'éblouit pas les yeux des partisans Vous "
s += "aviez vos portraits sur les Murs de nos villes"

l1 = findall('[A-Z][a-z]+', s)
print(l1)

def hascap(s):
    l1 = []
    l2 = s.split() # créer une liste
    for i in l2: # boucle 
        if ord(i[0]) in range(65,91): # condition ord() renvoi le code ASCII
            l1.append(i) # ajoute dans la liste l1
    return l1 # on retourne la liste l1
print(hascap(s))

```

    ['Onze', 'Vous', 'Vous', 'Murs']
    ['Onze', 'Vous', 'Vous', 'Murs']



```python
"""Proposer une fonction inflation(s) qui va doubler la valeur de tout
les nombre dans la chaine s"""

s = "Le prix est de 60 $"
def inflation(s):
    l1 = s.split()
    for i, m in enumerate(l1):
        if m.isnumeric():
            l1[i] = int(m)*2
            l1[i] = str(l1[i])
    l1 =" ".join(l1)
    return l1
print(inflation(s))
```

    Le prix est de 120 $



```python
"""Proposer une fonction lignes qui à partir d’une long chaîne s (>100
caractères) renvoie une liste de chaîne de caractères contenant
chacun 24 caractères maximum et terminant par un espace"""

s = "Onze ans déjà que cela passe vite Vous "
s += "vous étiez servis simplement de vos armes la "
s += "mort n'éblouit pas les yeux des partisans Vous "
s += "aviez vos portraits sur les Murs de nos villes"

def lignes(s): # définition de la fonction lignes
    l1 = [''] # créer une liste vide de chaine de caractére
    l2 = s.split() # mettre la chainede caractére en liste
    for i in l2: # créer une boucle dans l2
        i += " " # on ajoute un espace dans le mots en dérnier 
        if len(l1[-1]) + len(i) <= 24: # si on compte le dérniere élément la liste l1 + la langueur du mot (i)
                                       # inferieur ou égale de 24
            l1[-1] += i # ajouter le mot (i) au dérniere élément à la liste l1
        else: l1.append(i) # si non on ajoute le mot (i) au au dérnier élément de la liste
    return l1 # on fait un retour de l1
print(lignes(s)) # on print la fonction lignes(s)
```

    ['Onze ans déjà que cela ', 'passe vite Vous vous ', 'étiez servis simplement ', 'de vos armes la mort ', "n'éblouit pas les yeux ", 'des partisans Vous ', 'aviez vos portraits sur ', 'les Murs de nos villes ']



```python
"""Proposer un programme qui renvoie la liste de tout les nombres (y
compris décimaux et négatifs) d’une chaîne de caractères.
A tester sur la chaîne : Les 2 maquereaux valent 6.50 euros 33 centimes"""
from re import findall

s = "Les 2 maquereaux valent 6.50 euros 33 centimes"
def nombre(s):
    l1 = findall('[-]?[0-9][.,,]?[0-9]', s)
    return l1
print(nombre(s))
```

    ['6.5', '33']



```python
"""Proposer une fonction arrondi(s) qui dans la chaîne s troncature
tout les nombre décimaux. On autorise les nombres négatifs"""

s = "Les 2 maquereaux valent 6.50 euros 33 centimes"
def arrondi(s):
    l1 = s.replace('6.50', '6')
    l2 = l1.replace('euros','$')
    return l2
print(arrondi(s))
```

    Les 2 maquereaux valent 6 $ 33 centimes

