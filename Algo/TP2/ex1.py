#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 12 08:08:55 2021

@author: leo.marin@etu.umontpellier.fr
"""



#------------- Question 1 -----------------

def clause(s):
    L=[int (x) for x in s.split()]
    return L
        
def parseur(nom):
    f=open(nom,'r')
    data=f.readlines()
    f.close()
    result=[]
    for l in data:
        if l[0] == 'c':
            continue
        if l[0] == 'p':
            rl=l.split()
            n=int(rl[-2])
            continue
        result.append(clause(l))
    return result

#liste = "1 2 3 0 \n"
#print(clause(liste))
xx = parseur("cnf/simple_v3_c2.cnf")
#print(xx)
#------------- Question 2 -----------------

def estValide(F,A):
    for c in F:
        ok=False
        for l in c:
            if l*A[abs(l)-1] > 0:
                ok=True
        if not ok:
            return False
    return True

#print(estValide(xx,[-1,-1,-1]))

def aff_suivante(A):
    i=0
    n=len(A)
    while i<n and A[i]==1:
        A[i]=-1
        i=i+1
    if i==n:
        return None
    A[i]=1
    return A

def sat_exhau(F,n):
    A=[-1]*n
    while not (estValide(F,A)):
        A=aff_suivante(A)
        if aff_suivante(A)==None:
            return "Po possible frer"
    return A

#for i in range(5,50,5):
xx1= parseur("cnf/random-5-sat.cnf")    
xx2= parseur("cnf/random-10-sat.cnf")    
xx3= parseur("cnf/random-15-sat.cnf")    
xx4= parseur("cnf/random-20-sat.cnf")    
print(sat_exhau(xx1,5))
#print(aff_suivante())
#print(estValide(xx1,[1,1,1,1,1]))
#print(estValide(xx,[1,1,1]))
#------------- Question 3 -----------------

def elimination(F,n,b):
    trident = []
    for c in F:
        cprime= []
        sat=False
        for l in c:
            if abs(l) = n and l*b >0:
                sat=True
            elif abs(l)!=n:
                cprime.append(l)
        if not sat:
            trident.append(cprime)
    return trident


def sat_backtrack(F,n):
    if F == False:
        return [1]*n
#------------- Question 1 -----------------


#------------- Question 1 -----------------


#------------- Question 1 -----------------

#------------- Question 1 -----------------


#------------- Question 1 -----------------
#with open( ' monfichier.txt ' ) as f:
#    for ligne in f:
#            print(len(ligne))

#with open( ' autrefichier.txt ' , ' w ' ) as f:
#    f.write( ' Première ligne\n ' )
#    f.write( ' Deuxième ligne\n ' )