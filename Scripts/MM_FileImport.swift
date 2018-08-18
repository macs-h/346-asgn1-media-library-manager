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

        let url = URL(fileURLWithPath: filename, relativeTo: URL(fileURLWithPath: "/Users/mhuang/346/asgn1/"))
        let data = try Data(contentsOf: url)
        
        // the struct mirrors the JSON data
        struct Person: Codable {
            var name: String
            var office: String
            var languages: [String]
        }
        let decoder = JSONDecoder()
        let people = try! decoder.decode([Person].self, from: data)
        

        for p in people{
            print(p)
        }
        
        
        
        return []
    }
    
}
