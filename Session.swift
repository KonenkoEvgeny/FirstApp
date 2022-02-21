//
//  Session.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 21.02.2022.
//

import Foundation

class Session {
    
    static let shared = Session()
    private init() {}
    
    var name: String = ""
    var token: String = ""
    
}
