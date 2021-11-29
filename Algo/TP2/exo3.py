#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 23 08:04:57 2021

@author: leo.marin@etu.umontpellier.fr
"""

def suivant(n):
    i=0
    
    while n[i] == 10 - 1:
        n[i] = 0
        i = i + 1
    n[i] = n[i] + 1
    return n


def suivantPermut(p):
    n = len(p)
    j= n-2
    while j >= 0 and p[j] > p[j+1]:
        j -= 1
    if j < 0:
        return None
    l = n-1
    while p[j] > p[l]:
        l -= 1
    p[j],p[l] = p[l], p[j]
    j,l = j+1, n-1
    while j < l:
        p[j],p[l] = p[l],p[j]
        j,l = j+1, l-1
    return p

#pd = [0,1,2,3,4,5,6,7,8,9]
#for i in range (10):
#    print(suivantPermut(pd))


def dico(a,b,c):
    d = {}
    i = 1
    for m in [a,b,c]:
        for x in m:
            if not d.__contains__(x):
                d[x] = i
                i += 1
    return d

#print(dico("OASIS","SOLEIL","MIRAGE"))

def valeur(m, D, p):
    v = 0
    for x in m:
        v = 10*v + p[D[x]]
    return v



#mot= "OASIS"

#print(valeur(mot,dic,perm))


def cryptarithme(a, b, c):
    d = dico(a,b,c)
    p = [0,1,2,3,4,5,6,7,8,9]
    while 1:
#        print(p)
        if (valeur(a,d,p) + valeur(b,d,p)) == valeur(c,d,p):
            r = {}
            for x in d:
                r[x] = p[d[x]]
            return r
        if p == [9,8,7,6,5,4,3,2,1,0]:
            return "dico vide kho"
        p = suivantPermut(p)
        
o = "OASIS"
s = "SOLEIL"
m = "MIRAGE"
#print(cryptarithme(o,s,m))

print(cryptarithme("EPOUX","EPOUX","COUPLE"))

