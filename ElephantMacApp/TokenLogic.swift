/*
 File Name: TokenLogic.swift
 Used  Online Swift Playground (SwiftFiddle) for formatting the code.
 
 File Description: This file contains logic functions on how tokens are accumulated and redeemed
 
 ## Components:
 - `TokenLogic` class containing a variable to keep track
 - `addToken`, `subtractToken` for adding or subtracting token count.
 
 ## Features:
 - ?
 
 ## Note:
 - For global usage (sharing data), we can do:
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
 (Sinc we need to track states)
 ## References:
 https://www.hackingwithswift.com/books/ios-swiftui/manually-publishing-observableobject-changes
 https://developer.apple.com/documentation/coredata/nsmanagedobject/3369526-objectwillchange
 */
import CoreData
import SwiftUI
class TokenLogic: ObservableObject{ // observable object for : class that updates itself
    
    // we need something to automatically observe change

    var tokenNum = 0 {
        willSet {
            objectWillChange.send()
        }
    }// var tokenNum
    
    // MARK: -  addToken
    // ====================================================
    // add token count by 1
    // ----------------------------------------------------
    // example usage: when user check off the checkslit
    // ====================================================
    
    func addToken(){
        tokenNum+=1
    }//addToken
    
    // MARK: -  subtractToken
    // ====================================================
    // subtract token by the amount of cost
    // ----------------------------------------------------
    // example usage: when user reedems in the collectible shop
    // ====================================================
    
    func subtractToken(cost: Int){
        tokenNum-=cost
    }//subtractToken
    
}//TokenLogic
