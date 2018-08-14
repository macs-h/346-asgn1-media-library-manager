//
//  MMMetaData.swift
//  MediaLibraryManager
//
//  Created by Sam Paterson and Max Huang on 14/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

class MMMetaData: MMMetadata{
//    var keyword: String
    
    var keyword: String
    var value: String
    var description: String
    
    
    /**
        Default initialiser
     
        - Parameters:
            - keyword:      The keyword for the metadata
            - value:        The value the metadata should be initialised to
            - description:  The description of the metadata
     */
    init(keyword: String, value: String, description: String) {
        self.keyword = keyword
        self.value = value
        self.description = description
    }
    
    /**
        Convenience initialiser
     
        Currently sets variables to an emtpy `String`
     */
    convenience init(){
        self.init(keyword: "", value: "", description: "")
    }
}
