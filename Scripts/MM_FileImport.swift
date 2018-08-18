//
//  MM_FileImport.swift
//  MediaLibraryManager
//
//  Created by Max Huang and Sam Paterson on 16/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

/**
    Imports the media collection from a file.
 */
class MM_FileImport : MMFileImport {
    
    /**
        Imports the media collection from a file (by name).
     
        - parameter filename:   The name of the file to be imported.
     
        - returns:  A list of all the files in the file.
     */
    func read(filename: String) throws -> [MMFile] {
        
        var files: [MM_File] = []

        let url = URL(fileURLWithPath: filename, relativeTo: URL(fileURLWithPath: "/Users/mhuang/346/asgn1/"))
        let encodedJsonData = try Data(contentsOf: url)
        
        // the struct mirrors the JSON data
        struct JSON: Codable {
            var fullpath: String
            var type: String
            var metadata: [String : String]
        }
        let decoder = JSONDecoder()
        let jsonData = try! decoder.decode([JSON].self, from: encodedJsonData)
        
        for attribute in jsonData {
            let f = MM_File()
            
            let start = filename.startIndex
            let end = filename.index(filename.startIndex, offsetBy: filename._bridgeToObjectiveC().range(of: ".").location)
            
            f.filename = String(filename[start..<end])
            f.path = attribute.fullpath
            
            for metadata in attribute.metadata {
                let data = MM_Metadata(keyword: metadata.key, value: metadata.value)
                f.metadata.append(data)
            }
            files.append(f)
        }

        return files
    }
    
}
