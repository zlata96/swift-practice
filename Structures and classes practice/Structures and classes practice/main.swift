//
//  main.swift
//  Structures and classes practice
//
//  Created by Zlata Guseva on 08/10/2022.
//

import Foundation

// you can inherit with class, not with struct (struct can't be subclass)
// different place in memory: class - reference type , struct - value type
// copy in struct = create new object; in classes - add new reference
// immutability of struct: their more predictable
// struct: simplier, faster, deep copies, true immutability, no memory leaks (apple recommend used it by default when create new custom object)
// class: has inheritance,  works with objective-C code, 


var hero1 = ClassHero(name: "Iron Man", universe: "Marvel")
var anotherMarvelHero1 = hero1 // new reference for the same object
anotherMarvelHero1.name = "The Hulk"
var avangers1 = [hero1, anotherMarvelHero1]
avangers1[0].name = "Thor" // array of references

print("Hero1 name is \(hero1.name)")
print("AnotherHero1 name is \(anotherMarvelHero1.name)")
print("First avanger1 name is \(avangers1[0].name)")



var hero2 = StructHero(name: "Iron Man", universe: "Marvel")
var anotherMarvelHero2 = hero2 // new object
anotherMarvelHero2.name = "The Hulk"
var avangers2 = [hero2, anotherMarvelHero2]
avangers2[0].name = "Thor"

print("Hero2 name is \(hero2.name)")
print("AnotherHero2 name is \(anotherMarvelHero2.name)")
print("First avanger2 name is \(avangers2[0].name)")

let hero3 = ClassHero(name: "Iron Man", universe: "Marvel")
hero3.name = "Cat woman" // hero is let, but we can change properties


var hero4 = StructHero(name: "Iron Man", universe: "Marvel")
hero4.name = "Cat woman" // if hero is let, we CAN'T chane it and its properties

print(hero4.reverseName())
