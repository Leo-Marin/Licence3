#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 28 08:15:03 2021

@author: leo.marin@etu.umontpellier.fr
"""

from random import *
from matplotlib import pyplot as plt
# chargement de toute la bibliothèque
# chargement d ' un des modules de matplotlib


#----------- Q1 -----------

def entierAleatoires(n,a,b):
    l=[]
    for i in range(n):
        l.append(randint(a,b))
    return l

#print(entierAleatoires(5,1,5))

def entierAleatoires2(n,a,b):
    l=[]
    for j in range(n):
        l.append(randrange(a,b)) #max c'est n-1 
    return l

#print(entierAleatoires2(5,1,5))


#L1= entierAleatoires(1000,1,100)
#L2= entierAleatoires2(1000,1,100)
#
#plt.hist(L1, bins=100) # histogramme avec 100 colonnes
#plt.hist(L2, bins=100)
#plt.show()

#Les valeurs 50 et 100 ne sont jamais atteintes avec la fonction randrange c'est a dire n-1 et n/2
#mais la distribution semble similaire

#----------- Q2 -----------

def flottantsAleatoires(n):
    l=[]
    for j in range(n):
        l.append(random()) 
    return l



def flottantsAleatoires2(n,a,b):
    l=[]
    for j in range(n):
        l.append(uniform(a,b)) #max c'est n-1 
    return l

#L3=flottantsAleatoires(1000)
#L4=flottantsAleatoires2(1000,-3,10)
#
#plt.plot(L3)
#plt.plot(L4) # Ligne brisée
#plt.show()

#----------- Q3 -----------

def pointsDisque(n):
    lp=[]
    i,x,y = 0, 0, 0
    while i<n:
        x=uniform(-1,1)
        y=uniform(-1,1)
        if x**2+y**2<=1:
            lp.append([x,y])
            i+=1
    return lp

def pointsDisque2(n):
    lp=[]
    i,x,y = 0, 0, 0
    while i<n:
        x=uniform(-1,1)
        y=uniform(-1,1)
        while x**2+y**2>1:
            y=uniform(-1,1)
        
        lp.append([x,y])
        i+=1
    return lp    
    
def affichagePoints(L):
    X = [x for x,y in L] # on récupère les abscisses...
    Y = [y for x,y in L] # ... et les ordonnées
    plt.scatter(X, Y, s = 1) # taille des points minimale
    plt.axis( 'square' )
    # même échelle en abscisse et ordonnée
    plt.show()
    
#lp1 = pointsDisque(10000)
#affichagePoints(lp1)
#lp2 = pointsDisque2(10000)
#affichagePoints(lp2)

#dans le second cercle, au niveau des poles (gauche, droite) 
#la concentration des points est supérieur, l'uniformité est meilleur
#dans la première fonction

#----------- Q4 -----------

def aleatoireModulo(N):
    return getrandbits(N)%N

def aleatoireRejet(N):
    
    x= getrandbits(randint(1,N))
    while x>N:
        x=getrandbits(randint(1,N))
    return x
    
#L5=[]
#L6=[]
#N=100
#
#for i in range(10000):
#    L5.append(aleatoireModulo(N))
#for i in range(10000):
#    L6.append(aleatoireRejet(N))
#        
#plt.hist(L6, bins=100)
#    
#print(L5)
#plt.hist(L5, bins=100) # histogramme avec 100 colonnes
#
#plt.show()
    
#la methode rejet
    


