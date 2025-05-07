/*
 ## File Name: TokenLogic.swift
 Used  Online Swift Playground (SwiftFiddle) for formatting the code.
 
 ## File Description: This file contains logic functions on how tokens are accumulated and redeemed
 
 ## Components:
 - `TokenLogic` class containing a variable to keep track
 - `addToken`, `subtractToken` for adding or subtracting token count.
 
 ## Note:
 - For global usage (sharing data), we can do:
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views

 ## References:
 https://www.hackingwithswift.com/books/ios-swiftui/manually-publishing-observableobject-changes
 https://developer.apple.com/documentation/coredata/nsmanagedobject/3369526-objectwillchange
 https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-appstorage-property-wrapper
//the app storage thing crashing with published and init so used following:
 https://forums.swift.org/t/propertywrapper-composition-published-appstorage-persisted-var-data-0-no-parse-error-but-error-when-compile/52368
 */
import CoreData
import SwiftUI

// check: https://forums.swift.org/t/propertywrapper-composition-published-appstorage-persisted-var-data-0-no-parse-error-but-error-when-compile/52368
// for why we need to use PersistStore
enum PersistStore {
    @AppStorage("tokenNum") static var storedTokenNum: Int = 0
}

class TokenLogic: ObservableObject{ // observable object for : class that updates itself
    // we need something to automatically observe change
    @Published var tokenNum : Int {
        didSet {
            PersistStore.storedTokenNum =  tokenNum //live update
                }
    }// var tokenNum
    @Published var exampleTokenNum: Int = 0 //this is only being used in manual!!
    
    init(){
        self.tokenNum = PersistStore.storedTokenNum
    }
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
    
    
    // MARK: -  addFakeToken
    // ====================================================
    // add exampleTokenNum   by 1
    // ----------------------------------------------------
    // example usage: when user check off the checkslit
    //  THIS SHOULD ONLY BE USED IN MANUAL (DEMO)
    // ====================================================
    
    func addFakeToken(){
        exampleTokenNum+=1
    }//addToken
    
    // MARK: -  subtractToken
    // ====================================================
    // subtract exampleTokenNum by the amount of cost
    // ----------------------------------------------------
    // example usage: when user reedems in the collectible shop
    // THIS SHOULD ONLY BE USED IN MANUAL (DEMO)
    // ====================================================
    
    func subtractFackToken(){
        exampleTokenNum-=1
    }//addToken
}//TokenLogic
