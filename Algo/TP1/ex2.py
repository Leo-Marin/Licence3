#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 28 09:30:55 2021

@author: leo.marin@etu.umontpellier.fr
"""


from random import *
from matplotlib import pyplot as plt
import time 
# chargement de toute la bibliothèque
# chargement d ' un des modules de matplotlib



#----------- Q1 -----------

def eltMajDet(T):
    n=len(T)//2
    nbOcc=0
    for x in T:
        nbOcc = T.count(x)
        if nbOcc>=n:
            return x
def eltMajProba(T):
    n=len(T)//2
    nbOcc=0
    while 1:
        x=choice(T)
        nbOcc = T.count(x)
        if nbOcc>=n:
            return x
    
def tabAlea(n,a,b,k):
    T=[]
    leM=randint(a,b)
    others=leM
    for i in range(k):
        T.append(leM)

    while len(T)<n:
        others=leM
        while others == leM:
            others=randint(a,b)

        T.append(others)
    shuffle(T)
    return T

def tabDeb(n,a,b,k):
    T=[]
    leM=randint(a,b)
    others=leM
    for i in range(k-1):
        T.append(leM)

    while len(T)<n-1:
        others=leM
        while others == leM:
            others=randint(a,b)

        T.append(others)
    shuffle(T)
    T.insert(0, leM)
    return T

def tabFin(n,a,b,k):
    T=[]
    leM=randint(a,b)
    others=leM
    for i in range(n-k):
        others=leM
        while others == leM:
            others=randint(a,b)
        T.append(others)
    while len(T)<n:
        T.append(leM)
    return T


#
#T4=tabAlea(10000,0,50,7500)
#T5=tabDeb(10000,0,50,7500)
#T6=tabFin(10000,0,50,7500)
#
#start = time.time()
#eltMajDet(T4)
#end = time.time()
#elapsed = end - start
#print(f'Temps d\'exécution deter alea : {elapsed:.2}ms')
#start = time.time()
#eltMajDet(T5)
#end = time.time()
#elapsed = end - start
#print(f'Temps d\'exécution deter deb : {elapsed:.2}ms')
#start = time.time()
#eltMajDet(T6)
#end = time.time()
#elapsed = end - start
#print(f'Temps d\'exécution deter fin : {elapsed:.2}ms')
#
#start = time.time()
#eltMajProba(T4)
#end = time.time()
#elapsed = end - start
#print(f'Temps d\'exécution proba alea : {elapsed:.2}ms')
#
#start = time.time()
#eltMajProba(T5)
#end = time.time()
#elapsed = end - start
#print(f'Temps d\'exécution proba deb : {elapsed:.2}ms')
#
#start = time.time()
#eltMajProba(T6)
#end = time.time()
#elapsed = end - start
#print(f'Temps d\'exécution proba fin : {elapsed:.2}ms')


#T1= tabAlea(10,1,5,7)
#T2=tabDeb(10,1,5,6)
#T3=tabFin(10,1,5,6)
#print("T1 =" , T1)
#print("T2 =" , T2)
#print("T3 =" , T3)


#----------- Q2 -----------


def contientEltMaj(T,m):
    long=len(T)
    for i in range(m):
        nbAlea=T[randint(0,long)]
        for j in T:
            if T.count(nbAlea)>=long//2:
                return True
    return False
            
def testContient(n,a,b,k,m,N):
    total,nbvrai=0,0
    for i in range(N):    
        T=tabAlea(n,a,b,k)
        if contientEltMaj(T,m):
            total+=1
            nbvrai+=1
        else:
            total+=1
    return (nbvrai/total)*100

propor=(testContient(1000,0,50,500,1,1000))
plt.plot(propor)
plt.show
    
    



#----------- Q3 -----------
#----------- Q4 -----------
#----------- Q5 -----------
#----------- Q6 -----------

#----------- Q7 -----------


    


