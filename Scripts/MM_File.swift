//
//  MMFile.swift
//  MediaLibraryManager
//
//  Created by Max Huang and Sam Paterson on 14/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

class MM_File: MMFile {
    
//    var metadata: [MMMetadata]
    var filename: String = ""
    var path: String = ""
    var description: String = ""
    var collectionPos = 0
    
    // here we're actually keeping track of the concrete instances
    private var _metadata: [MM_Metadata] = []
    
    // here we're converting the instances so that we can obey the
    // MMFile protocol
    var metadata: [MMMetadata] {
        get{
            var result: [MMMetadata] = []
            for m in self._metadata{
                result.append(m as MMMetadata)
            }
            return result
        }
        set(value){
            var result: [MM_Metadata] = []
            for v in value {
                if let m = v as? MM_Metadata{
                    result.append(m)
                }
            }
            _metadata = result
        }
    }
    
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
    
    convenience init(){
        self.init(metadata: [MM_Metadata()], filename: "", path: "", description: "")
    }
    
    
    func metadataContains(keyword: String) -> Bool {
        for item in self.metadata{
            if item.keyword == keyword{
                return true
            }
        }
        return false
    }
    
    func getAttributes() -> [String]{
        var results: [String] = []
        results.append(filename)
        results.append(path)
        results.append(description)
        for data in metadata{
            results.append(data.keyword)
        }
        return results
    }
    
    
    
    
}
