//
//  MMFile.swift
//  MediaLibraryManager
//
//  Created by Max Huang and Sam Paterson on 14/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

class MM_File: MMFile {
    
    var metadata: [MMMetadata]
    var filename: String
    var path: String
    var description: String
    
    /**
        Default initialiser
     
        - Parameters:
            - metadata: A key/value store
            - filename: The name of the file
            - path:     The filepath to the file
     */
    init(metadata: [MM_Metadata], filename: String, path: String, description: String) {
        self.metadata = metadata
        self.filename = filename
        self.path = path
        self.description = description
    }
    
    
    
}
