//
//  Test.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 28/02/23.
//

import Foundation

class TestClass {
    
    var param1: String
    var param2: String
    var param3: String
    var param4: Int
    var param5: Double
    
    init(param1: String, param2: String, param3: String, param4: Int, param5: Double) {
        self.param1 = param1
        self.param2 = param2
        self.param3 = param3
        self.param4 = param4
        self.param5 = param5
    }
    
    convenience init() {
        self.init(param1: "tes", param2: "tes", param3: "tes", param4: 5, param5: 6)
    }
}
