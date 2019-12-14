"""
Gestion de fiche de contact avec
prenom, nom, naissance, couriel
"""

### Section class
class CarnetAdr(object): 
    """ Conteneur de fiches """
    pass # montre que la class est vide

class FichAdr(object):
    """ Fiche d'un contact """ 
    #Ajout méthode
    def __init__(self, prenom=None, nomfami=None,
                datenaiss=None, courriel=None):
        """ Initialise les 4 attributs.
        le format de datenaiss est JJ/MM/AAAA"""
        
        self.prenom = prenom
        self.nomfami = nomfami
        self.datenaiss = datenaiss
        self.courriel = courriel
        
    def __repr__(self):
        """ Produit une chaine selon l'objet FichAdr
        fourni en argument self."""
        
        patron = "FichAdr(prenom = '%s', "+\
            "nomfai = '%s', "+\
            "datenaiss = '%s' "+\
            "courriel = '%s')"
        return patron%(self.prenom, self.nomfami,
                       self.datenaiss, self.courriel)
    
### Section fonction
### Section principal main

if __name__ == "__main__":
    carnet_adr = CarnetAdr()
    contact1 = FichAdr("Ecric", "IDLE", "12/06/1999", None)
    print(contact1)