//
//  Flag.swift
//  AllFlags
//
//  Created by mac os on 18.06.16.
//  Copyright © 2016 Khrystenko Dmytro. All rights reserved.
//

import Foundation

class Flag {
    
    private var _name: String!
    private var _flagsId: Int!
    private var _aboutTxt: String!
    
    var name: String {
        return _name
    }
    
    var flagsId: Int {
        return _flagsId
    }
    
    var aboutTxt:String {
        return _aboutTxt
    }
    
    init(name: String, flagsId: Int, aboutTxt: String) {
        
        self._name = name
        self._flagsId = flagsId
        self._aboutTxt = aboutTxt
    }
}