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
    var fileType: String = ""
    var description: String{
//        if metadata.count > 0 {
//            var results: [String] = []
//            for data in metadata{
//                results.append(data.description)
//            }
//            return "Data {" + results.joined(separator: "} {")+"}"
//        }else{
//            return "Data{}"
//        }
        
        return filename
        
    }
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
    init(metadata: [MM_Metadata], filename: String, path: String) {
        self.metadata = metadata
        self.filename = filename
        self.path = path
    }
    
    convenience init(){
        self.init(metadata: [], filename: "", path: "")
    }
    
    
    func searchMetadata(keyword: String) -> Int {
        var i = 0
        for item in self.metadata{
            if item.keyword == keyword{
                return i
            }
            i += 1
        }
        return -1
    }
    
    func getAttributes() -> [String]{
        var results: [String] = []
        results.append(filename)
        results.append(path)
        results.append(description)
        for data in metadata{
            results.append(data.keyword)
            results.append(data.value) // Waiting on clarification from Paul about search implementation.
        }
        return results
    }
    
    
    
    
}
