//
//  MM_FileImport.swift
//  MediaLibraryManager
//
//  Created by Max Huang and Sam Paterson on 16/08/18.
//  Copyright © 2018 SMAX. All rights reserved.
//

import Foundation

/**
    Imports the media collection from a file (by name)
 */
class MM_FileImport : MMFileImport {
    
    /**
        Imports the media collection from a file (by name).
     
        - parameter filename:   The name of the file to be imported.
     
        - returns:  A list of all the files in the file.
     */
    func read(filename: String) throws -> [MMFile] {
        
        var files: [MM_File] = []
        var json_filepath: String = ""
        
        if filename.contains("~") {
            json_filepath = NSString(string: filename).expandingTildeInPath
        } else if filename.contains("/") {
            json_filepath = filename
        } else {
            var path:[String] = #file.split(separator: "/").map({String($0)})
            path.removeLast(2)
            json_filepath = "/" + path.joined(separator: "/") + "/" + filename
        }
        let url = URL(fileURLWithPath: json_filepath)

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
            
            f.fullpath = attribute.fullpath
            f.fileType = attribute.type
            
            let path_reversed = String(f.fullpath.reversed())
            
            let start = path_reversed.startIndex
            let end = path_reversed.index(path_reversed.startIndex, offsetBy: path_reversed._bridgeToObjectiveC().range(of: "/").location)
            
            f.filename = String( String( path_reversed[start..<end].reversed()) )
            
            for metadata in attribute.metadata {
                let data = MM_Metadata(keyword: metadata.key, value: metadata.value)
                f.metadata.append(data)
            }
            files.append(f)
        }

        return files
    }
    
}
