```python
# Ajouter une méthode capsdown() 

class superstring :
    def __init__(self, chaine):
        self.ch = chaine
    def ajoute(self, char):
        self.ch += char
    def insert(self, char, i):
        self.ch = self.ch[:i] + char + self.ch[i:]
    def capsdown(self):
        self.ch = self.ch.lower()
    def __str__(self):
        return self.ch

        
s1 = superstring("Ecoutez bien c'est important")
s1.ajoute(" ce que je dis !")
s1.insert(" très", 18)
s1.capsdown()
print(s1)
```

    ecoutez bien c'est très important ce que je dis !



```python
# Ajouter une méthode tri() qui trie les mots

class superstring :
    def __init__(self, chaine):
        self.ch = chaine
    def ajoute(self, char):
        self.ch += char
    def insert(self, char, i):
        self.ch = self.ch[:i] + char + self.ch[i:]
    def tri(self):
        self.ch = self.ch.split(' ')
        self.ch = sorted(self.ch)
        self.ch = ' '.join(self.ch)
        
        
    
    def __str__(self):
        return self.ch

s1 = superstring("ecoutez bien c'est important")
s1.ajoute(" ce que je dis !")
s1.insert(" très", 18)
s1.tri()

print(s1)
```

    ! bien c'est ce dis ecoutez important je que très



```python
"""Modifier la méthode __str__ de façon à avoir un affichage de la forme
« type : superstring, content : ECOUTEZ BIEN C'EST TRÈS IMPORTANT
CE QUE JE DIS ! »""" 

class superstring :
    def __init__(self, chaine):
        self.ch = chaine
    def ajoute(self, char):
        self.ch += char
    def insert(self, char, i):
        self.ch = self.ch[:i] + char + self.ch[i:]
    def upper(self):
        self.ch = self.ch.upper()
    
    def __str__(self):
        return 'type: superstring, content :' + self.ch

        
s1 = superstring("Ecoutez bien c'est important")
s1.ajoute(" ce que je dis !")
s1.insert(" très", 18)
s1.upper()

print(s1)
```

    type: superstring, content :ECOUTEZ BIEN C'EST TRÈS IMPORTANT CE QUE JE DIS !



```python
"""Ajouter une méthode qui vérifie si deux formulaires renvoient à la
même personne"""

class formulaire:
    def __init__(self, nom, prenom, anneeNaissance):
        self.nom = nom.upper()
        self.prenom = prenom.upper()
        self.anneeNaissance = anneeNaissance
    def age(self):
        return 2020 - self.anneeNaissance
    def majeur(self):
        return self.age() >= 18
    def memeFamille(self, formulaire):
        return self.nom == formulaire.nom
    def memePersonne(self, formulaire):
        return self.nom == formulaire.nom and self.prenom == formulaire.prenom and self.anneeNaissance == formulaire.anneeNaissance
    
    
jd = formulaire('Doe','John', 2005)
ad = formulaire('doe','Alice', 2000)

print(jd.majeur())
print(ad.majeur())
print(jd.memeFamille(ad))
print(jd.memePersonne(ad))
```

    False
    True
    True
    False



```python
"""Faire en sorte qu’on puisse afficher les formulaires sous la forme
[nom, prenom, anneeNaissance]. Créer une liste de formulaire et triez
la par ordre de naissance"""

class formulaire:
    def __init__(self, nom, prenom, anneeNaissance):
        self.nom = nom.upper()
        self.prenom = prenom.upper()
        self.anneeNaissance = anneeNaissance
    def age(self):
        return 2020 - self.anneeNaissance
    def majeur(self):
        return self.age() >= 18
    def memeFamille(self, formulaire):
        return self.nom == formulaire.nom
        
    def __str__(self): # la fonction spéciale str comporte en retour nom + prnom + str() pour la voire comme string
        return self.nom + ',' + self.prenom + ',' + str(self.anneeNaissance)  
    
jd = formulaire('Doe','John', 2005)
ad = formulaire('doe','Alice', 2000)
hm = formulaire('mosbah', 'hachem', 1983)
sb = formulaire('nasr', 'sabine', 1992)
fr =[jd,ad,hm,sb] # créer une liste qui comporte les trois listes précedentes

print(jd.majeur())
print(ad.majeur())
print(jd.memeFamille(ad))

# on appelle la fonction sorted (key=lambda) fonction pour prendre un objet précis
fr = sorted(fr , key=lambda x: x.anneeNaissance)  
for i in fr : # boucle pour tous i dans la liste fr 
    print(i) # en sortie i 

```

    False
    True
    True
    MOSBAH,HACHEM,1983
    NASR,SABINE,1992
    DOE,ALICE,2000
    DOE,JOHN,2005



```python
""" Créer une fonction plusGrandQue() qui doit faire la comparaison entre
deux cartes (représenté par des tuples) et donc remplacer la troisième
partie du code ?"""

from random import randrange

# On intialise toutes les valeurs et couleurs
# Que peuvent prendre les cartes 

valeurs = [ i for i in range(1, 11)]
couleurs = [i for i in range(1, 5)]

# On coisi le nombre de tour que va durée la partie et on initialise le score à 0

nbTours = 7
score = 0

# Enfin on crée une liste de tuple pour représenter le paquet de cartes 

paquet = [(v, c) for v in couleurs for c in couleurs]
main1, main2 = [], []

"""Chacun des deux joueurs tire une carte aléatoirement, elle est
supprimé du paquet et on répète l’opération pour chaque tour."""

for i in range(nbTours):
    # Le joueur 1 tire une carte aléatoirement dans le paquet 
    x = paquet[randrange(len(paquet))]
    # La carte est ajouté à la main du joueur 1
    main1.append(x)
    # La carte tiré est supprimé du paquet 
    paquet.remove(x)
    # idem pour le joueur 2
    y = paquet[randrange(len(paquet))]
    main2.append(y)
    paquet.remove(y)
    
"""Pour chaque carte tirée on détermine qui du joueur 1 ou 2 à pris
l’avantage en faisant + 1 au score si c’est le joueur 1 si non -1."""

def plusGrandQue(carte1, carte2):
    return carte1[i][0] > carte2[i][0] or (
    carte1[i][0] == carte2[i][0] and carte1[i][1] > carte2[i][1]) 

for i in range(nbTours):
    if plusGrandQue(main1, main2):
        score += 1
    else :
        score -= 1
print("vainqueur : "+ ("joueur 1" if score > 0 else "joueur 2"))
```

    vainqueur : joueur 1



```python
"""Créer une fonction piocher() qui doit sélectionner l’ensemble des carte
tiré par un joueur et donc remplacer la deuxième partie du code ?"""

from random import randrange

# On intialise toutes les valeurs et couleurs
# Que peuvent prendre les cartes 

valeurs = [ i for i in range(1, 11)]
couleurs = [i for i in range(1, 5)]

# On coisi le nombre de tour que va durée la partie et on initialise le score à 0

nbTours = 7
score = 0

# Enfin on crée une liste de tuple pour représenter le paquet de cartes 

paquet = [(v, c) for v in couleurs for c in couleurs]
main1, main2 = [], []

"""Chacun des deux joueurs tire une carte aléatoirement, elle est
supprimé du paquet et on répète l’opération pour chaque tour."""
def piocher(nbTours, paquet):
    for i in range(nbTours):
        # Le joueur 1 tire une carte aléatoirement dans le paquet 
        x = paquet[randrange(len(paquet))]
        # La carte est ajouté à la main du joueur 1
        main1.append(x)
        # La carte tiré est supprimé du paquet 
        paquet.remove(x)
        # idem pour le joueur 2
        y = paquet[randrange(len(paquet))]
        main2.append(y)
        paquet.remove(y)
    return main1, main2
main1, main2 = piocher(nbTours, paquet)
"""Pour chaque carte tirée on détermine qui du joueur 1 ou 2 à pris
l’avantage en faisant + 1 au score si c’est le joueur 1 si non -1."""

def plusGrandQue(carte1, carte2):
    return carte1[i][0] > carte2[i][0] or (
    carte1[i][0] == carte2[i][0] and carte1[i][1] > carte2[i][1]) 

for i in range(nbTours):
    if plusGrandQue(main1, main2):
        score += 1
    else :
        score -= 1
print("vainqueur : "+ ("joueur 1" if score > 0 else "joueur 2"))
```

    vainqueur : joueur 1



```python
""" Créer une classe « carte » ayant les attribut couleur et valeur. Elle
devra être appelé dans la fonction plusGrandQue()?"""

from random import randrange
# on prend une class carte
class carte:
    def __init__(self, couleurs, valeurs): # definir valeur (self:renvoi à l'objet)
        self.couleurs = couleurs
        self.valeur = valeurs
    def __repr__(self):
        return '('+str(self.valeurs)+ ',' +str(self.couleurs)+')'
# On intialise toutes les valeurs et couleurs
# Que peuvent prendre les cartes 

valeurs = [ i for i in range(1, 11)]
couleurs = [i for i in range(1, 5)]

# On choisi le nombre de tour que va durée la partie et on initialise le score à 0

nbTours = 7
score = 0

 

paquet = [(v, c) for v in couleurs for c in couleurs]
main1, main2 = [], []

        
"""Chacun des deux joueurs tire une carte aléatoirement, elle est
supprimé du paquet et on répète l’opération pour chaque tour."""
def piocher(nbTours, paquet):
    for i in range(nbTours):
        # Le joueur 1 tire une carte aléatoirement dans le paquet 
        x = paquet[randrange(len(paquet))]
        # La carte est ajouté à la main du joueur 1
        main1.append(x)
        # La carte tiré est supprimé du paquet 
        paquet.remove(x)
        # idem pour le joueur 2
        y = paquet[randrange(len(paquet))]
        main2.append(y)
        paquet.remove(y)
    return main1, main2
main1, main2 = piocher(nbTours, paquet)
"""Pour chaque carte tirée on détermine qui du joueur 1 ou 2 à pris
l’avantage en faisant + 1 au score si c’est le joueur 1 si non -1."""

def plusGrandQue(carte1, carte2):
    return carte1[i][0] > carte2[i][0] or (
    carte1[i][0] == carte2[i][0] and carte1[i][1] > carte2[i][1]) 

for i in range(nbTours):
    if plusGrandQue(main1, main2):
        score += 1
    else :
        score -= 1
print("vainqueur : "+ ("joueur 1" if score > 0 else "joueur 2"))
```

    vainqueur : joueur 1



```python
"""Créer une classe « partie » qui nous permettra d’effectuer différentes
partie avec des jeux différents"""


from random import randrange

# On définit la classe Carte qui associe une valeur et une couleur à chaque carte
# on définit ainsi l'affichage en forme de tuple (valeur, couleur)
class Carte:
    def __init__(self, valeur, couleur):
        self.valeur = valeur
        self.couleur = couleur
    def __repr__(self):
        return '('+str(self.valeur)+',' +str(self.couleur)+')'

# On définit la classe Partie qui va décrir le déroulement d'une partie       
class Partie:
# D'abord on initialise le nombre de valeurs et de couleurs que pourront avoir nos cartes
#  et le nombre de tours par jeu
    def __init__(self, nbValeur, nbCouleur, nbTours):
        self.nbValeur = nbValeur
        self.nbCouleur = nbCouleur
        self.nbTours = nbTours
    def jouer(self):
# Ensuite dans la méthode jouer nous allons définir les mains en faisant appel à la fonction pioche
        self.main1, self.main2 = pioche(paquet,nbTours)
# Puis on compare les cartes piochés par les deux joueurs selon leur valeur d'abord et leur couleur après
        self.score = 0
        for i in range(self.nbTours):
            if plusGrandQue(self.main1[i], self.main2[i]):
                self.score = 1
            else:
                self.score = -1
# Finalement on définit l'affichage de cette méthode selon l'identité du vaiqueur jeu
        print(" Vainqueur : " + ("joueur 1" if self.score > 0 else "joueur2"))    
# Option to define repr in the method, then print(obj) needs to be called 
#    def __repr__(self):
#        return " Vainqueur : joueur 1" if self.score > 0  else "Vaiqueur :joueur2"


def pioche(deck, nbPlay):
    hand1, hand2 = [], []
    for i in range (nbPlay):
    # Le joueur 1 tire une carte aléatoirement dans le paquet            
        x = deck[randrange(len(deck))]
    # La carte est ajoutée à la main du joueur 1
        hand1.append(x)
    # La carte est supprimée du paquet
        paquet.remove(x)
    # idem pour le joueur 2
        y = deck[randrange(len(deck))]
        hand2.append(y)
        paquet.remove(y)
    return hand1, hand2    

# la fonction plusGrandque sert à évaluer les mains des joueur pour déterminer le vainqueur
# en comparant les valeurs les cartes des deux joueurs ou sinon, la couleur qui emporte
def plusGrandQue(x,y):  
   # return x[0]> y[0] or (x[0] == y[0] and x[1] > y[1])
    return x.valeur > y.valeur or (x.valeur == y.valeur and x.couleur > y.couleur)

        
jeu = Partie(13, 4, 9)    

valeurs = [i for i in range(1,jeu.nbValeur +1) ]
couleurs = [i for i in range(1,jeu.nbCouleur +1)]
nbTours = jeu.nbTours
paquet = [ Carte(v, c) for v in valeurs for c in couleurs]

jeu.jouer()



```

     Vainqueur : joueur2



```python

```
