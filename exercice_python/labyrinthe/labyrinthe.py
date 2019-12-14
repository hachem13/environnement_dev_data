# Exploration récursive d'un labyrinthe

def lire_labyrinthe(): # définie une méthode
    # met en mémoire la labyrinthe et renvoie les coordonnées du point de départ
    global case, haut, larg 
    fichier = open("dedale2.txt", "r") # ouvrir et lire le text
    lignes = fichier.readlines() #lecture de text
    fichier.close() # ferme le fichier pour gagné de la mémoire 
    haut = len(lignes) # comptabilisé le nombre de ligne en hauteur 
    larg = len(lignes[0])-1 # comptabilisé ligne en largeur 
    print(haut,"lignes",larg,"colonnes") # affichee dans le terminal le nombre de ligne et de colonne
    case = [[0 for col in range(larg)] for row in range(haut)] # crée un tableau qui as les meme dimension que le labyrinth remplie de 0 
    for i in range(haut):  
        for j in range(larg):  # 2 litération emboité l'une dans l'autre: pour autent de ligne et de colonne qui compte le labyrinth
            case[i][j]=lignes[i][j] # transposer le tableau case i et j a lignes i et j case part case
            if lignes[i][j]=='E': # detérmine le point de départ
                i0=i
                j0=j
                case[i0][j0]="E"
    return i0,j0

def imprimer_labyrinthe(): # methode pour imprimé le labyrinthe
    global case, haut, larg
    for i in range(haut):
        for j in range(larg):
            print(case[i][j],end="")
        print() # séparer les labyrinthes
    print()
    
def thesee(i,j): # fonction récursive 
    global case
    if case[i][j] == "S": # si la case est a S alors il imprime le labyrinthe
        imprimer_labyrinthe()
    elif case[i][j] == " " or case[i][j] == "E": # sinon il trouve une case vide ou E il met un point 
            case[i][j] = "." 
            thesee(i,j+1)
            thesee(i,j-1)
            thesee(i+1,j)
            thesee(i-1,j)
            case[i][j] = " "
    
 

# programme principal
i0, j0 = lire_labyrinthe() # envoi les coordonées de l'entrée
imprimer_labyrinthe() # affiché le labyrinths
print("Solution(s)") # affiché les solutions
thesee(i0, j0)
