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
    
    
    var description: String{
        let coll = self.all()
        if coll.count > 0 {
            var results: [String] = []
            for file in coll{
                results.append(file.description)
            }
            return "Collection [" + results.joined(separator: "] [")+"]"
        }else{
            return "Collection []"
        }
    }
    
    
    convenience init () {
        self.init(collection: [])
    }
    
    
    init(collection: [MMFile]) {
        self.collection = collection
    }
    
    
    /**
        Adds a file's metadata to the media metadata collection.
     
        - parameter file:   The file and associated metadata to add to the
                            collection.
     */
    func add(file: MMFile) {
        var tempFile = file
        tempFile.collectionPos = (collection != nil) ? collection!.count : 0
        self.collection?.append(file)
    }
    
    
    /**
        Adds a specific instance of a metadata to the collection.
     
        - parameters:
            - metadata: The item to add to the collection.
            - file:     The file to add the metadata to within the collection.
     */
    func add(metadata: MMMetadata, file: MMFile) {
        var files = search(term: file.filename)
        for i in 0..<files.count{
            collection![files[i].collectionPos].metadata.append(metadata)
            
        }
        
    }
    
    
    /**
        Removes a specific instance of a metadata from the collection.
     
        - parameter metadata:   The item to remove from the collection.
     */
    func remove(metadata: MMMetadata) {
        let files = search(item: metadata)
        for file in files{
            print("before del", collection)
            collection?.remove(at: file.collectionPos)
            print("after del", collection)
        }
        
    }
    
    
    /**
        Removes a specific instance of a metadata from a specific file.

        - parameters:
            - metadata: The item to remove from the file.
            - file:     The file to remove the metadata from.
     */
    func remove(metadata: MMMetadata, file: MMFile) {
        let files = search(term: file.filename)
        for file in files{
            collection?.remove(at: file.collectionPos)
        }
        
    }
    
    
    /**
        Finds all the files associated with the keyword.
     
        - parameter term:   The keyword to search for.
     
        - returns:  A list of all the metadata associated with the keyword,
                    possibly an empty list.
     */
    func search(term: String) -> [MMFile] {
        if let coll = collection{
            var results: [MMFile] = []
            for file in coll{
                //search each feild
                if(file.getAttributes().contains(term)){
                    results.append(file)
                }
            }
            return results
        }else{
            return []
        }
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
    
    
    
    
    
}
