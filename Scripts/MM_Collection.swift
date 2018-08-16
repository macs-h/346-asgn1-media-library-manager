//
//  MM_Collection.swift
//  MediaLibraryManager
//
//  Created by Max Huang and Sam Paterson on 16/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

class MM_Collection : MMCollection {
    var collection: [MMFile]?
    /**
        Adds a file's metadata to the media metadata collection.
     
        - parameter file:   The file and associated metadata to add to the
                            collection.
     */
    func add(file: MMFile) {
        self.collection?.append(file)
    }
    
    
    /**
        Adds a specific instance of a metadata to the collection.
     
        - parameters:
            - metadata: The item to add to the collection.
            - file:     The file to add the metadata to.
     */
    func add(metadata: MMMetadata, file: MMFile) {
        //find the instance in the collection where the name == file name (use search)
        var file = search(term: file.filename)
        
        //add the mmetadata to that file
        //remove the old one???
        
    }
    
    
    /**
        Removes a specific instance of a metadata from the collection.
     
        - parameter metadata:   The item to remove from the collection.
     */
    func remove(metadata: MMMetadata) {
        // Code
    }
    
    
    /**
        Finds all the files associated with the keyword.
     
        - parameter term:   The keyword to search for.
     
        - returns:  A list of all the metadata associated with the keyword,
                    possibly an empty list.
     */
    func search(term: String) -> [MMFile] {
        var results: [MMFile] = []
        // for each file in the collection
        // check all the feilds in the files to see if term matches
        // also check array of mmetadata to see if the term is there too??
        //if found append to the result array
        return results
    }
    
    
    /**
        Returns a list of all the files in the index.
     
        - returns:  A list of all the files in the index, possibly an empty list
     */
    func all() -> [MMFile] {
        if let coll = collection{
            var results: [MMFile] = []
            for file in coll{
                results.append(file)
            }
            return results
        }else{
            return []
        }
    }
    
    
    /**
        Finds all the metadata associated with the keyword of the item.
     
        - parameter item:   The item's keyword to search for.
     
        - returns:  A list of all the metadata associated with the item's
                    keyword, possibly an empty list.
     */
    func search(item: MMMetadata) -> [MMFile] {
        if let coll = collection{
            var results: [MMFile] = []
            for file in coll{
                if(file.metadataContains(keyword: item.keyword)){
                    results.append(file)
                }
            }
            return results
        }else{
            return []
        }
    }
    
    var description: String = ""
    
    
    
}
