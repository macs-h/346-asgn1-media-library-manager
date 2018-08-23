//
//  MM_Collection.swift
//  MediaLibraryManager
//
//  Created by Max Huang and Sam Paterson on 16/08/18.
//  Copyright © 2018 SMAX. All rights reserved.
//

import Foundation

/**
    The main functions of the media metadata collection
 */
class MM_Collection : MMCollection {
    
    var collection: [MMFile]?
    var metaDic = [String: [MMFile]]() //keyword: file, file
    
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
    
    
    /**
        Default initialiser
     
        - parameter collection: An array containing the files and associated
                                metadata to initialise the collection with
     */
    init(collection: [MMFile]) {
        self.collection = collection
    }
    
    
    /**
        Convenience initialiser
     
        Initialises the collection as an empty array.
     */
    convenience init () {
        self.init(collection: [])
    }
    
    
    /**
        Adds a file's metadata to the media metadata collection.
     
        - parameter file:   The file and associated metadata to add to the
                            collection.
     */
    func add(file: MMFile) {
        var tempFile = file
        tempFile.collectionPos = (collection != nil) ? collection!.count : 0
        self.collection?.append(tempFile)
        
        
        //metadata dic stuff
        for data in tempFile.metadata{
            if(metaDic[data.keyword] != nil){
                metaDic[data.keyword]!.append(tempFile)
            }else{
                metaDic[data.keyword] = [tempFile]
            }
        }
        
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
            //metadata dic stuff
            if(metaDic[metadata.keyword] != nil){
                metaDic[metadata.keyword]!.append(collection![files[i].collectionPos])
                
            }else{
                metaDic[metadata.keyword] = [collection![files[i].collectionPos]]
                
            }
            
            print("dictonary",metaDic)
        }
    }
    
    
    /**
        Removes a specific instance of a metadata from the collection.
     
        - parameter metadata:   The item to remove from the collection.
     */
    func remove(metadata: MMMetadata) {
        let files = search(item: metadata)
        for file in files{
            collection?.remove(at: file.collectionPos)
            //removing file from dic
            for i in 0...metaDic[metadata.keyword]!.count{
                if metaDic[metadata.keyword]![i].filename == file.filename{
                    metaDic[metadata.keyword]?.remove(at: i)
                }
            }
            //will this work with mutiple files?????
        }
        
    }
    
    
    /**
        Removes a specific instance of a metadata from a specific file.

        - parameters:
            - metadata: The item to remove from the file.
            - file:     The file to remove the metadata from.
     */
    func remove(metadata: MMMetadata, file: MMFile) {
        //need to check that key exists
        let files = search(term: file.filename)
        for i in 0..<files.count{
            collection![files[i].collectionPos].metadata.remove(at: files[i].searchMetadata(keyword: metadata.keyword))
            
        }
        //removes files from dic
        for i in 0..<metaDic[metadata.keyword]!.count{
            if metaDic[metadata.keyword]![i].filename == file.filename{
                metaDic[metadata.keyword]?.remove(at: i)
            }
        }
        print("dict", metaDic)
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
//        if let coll = collection{
//            var results: [MMFile] = []
//            for file in coll{
//                if(file.searchMetadata(keyword: item.keyword) != -1){
//                    results.append(file)
//                }
//            }
//            return results
//        }else{
//            return []
//        }
        return metaDic[item.keyword]!
    }
    
    
}
