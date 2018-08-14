//
//  MMMetaData.swift
//  MediaLibraryManager
//
//  Created by Sam Paterson on 14/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

class MMMetaData: MMMetadata{
//    var keyword: String
    
    var keyword: String
    
    var value: String
    
    var description: String
    
    init(keyword: String, value: String, description: String) {
        self.keyword = keyword
        self.value = value
        self.description = description
    }
    
    convenience init(){
        self.init(keyword: "", value: "", description: "")
    }
}
