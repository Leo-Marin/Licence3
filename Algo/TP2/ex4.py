#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 23 09:38:56 2021

@author: leo.marin@etu.umontpellier.fr
"""


        
def affichage_reine2(Q):
    l = len(Q)
    rep = ""
    l2 = 0
    for i in range (l):
        l2=l
        idx=0
        for j in range(Q[i]):
            rep += '_ '
            idx=j
        if Q[i] <= l:
            rep += 'x '
#        print(idx)
        if Q[i] != 0:
            l2= l-1
        for k in range(idx+1,l2):
            rep += '_ '
        rep += "\n"
    print(rep)

#affichage_reine2([2,0,3,1])

def reine_possible(Q,r,j):
    l = len(Q)
    if Q.__contains__(j) or Q[r] != -1 :
        return False
    for i in range(0,r):
        h = Q[i]
        if (h == j-abs(r-i) or h == j+abs(r-i)) and h != -1 :
            return False
    for k in range(r+1,l):
        b = Q[k]
        if (b == j-abs(r-k) or b == j+abs(r-k)) and b != -1:
            return False
    return True 

#lesreine = [1,3,-1,-1]
#print(reine_possible(lesreine,2,2))


def placement_reines(Q, r):
    l = len(Q)
    idx = r
    while idx<l:
        for i in range(l):
            if reine_possible(Q,idx,i):
                Q[idx] = i
        
        if Q[idx] == -1 :
            if idx == r:
                return None
            else:
                idx -= 1
        idx += 1
    return Q
    
        
        
rep = placement_reines([1,3,-1,-1],2)
affichage_reine2(rep)
        
        
        
        
        
        
        
        
        
        
        