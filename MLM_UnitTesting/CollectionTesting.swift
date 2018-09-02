//
//  CollectionTesting.swift
//  MLM_UnitTesting
//
//  Created by Sam Paterson on 31/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation
import XCTest
@testable import MediaLibraryManager

class CollectionTesting: XCTestCase{
    
    /*tests adding a file to an empty collection*/
    func testAddFile(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File()
        XCTAssertTrue(lib.collection!.count == 0)
        lib.add(file: file)
        XCTAssertTrue(lib.collection!.count > 0)
    }
    
    func testAddDataToFile(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        lib.add(file: file)
        XCTAssertEqual(lib.collection![0].metadata.count,0)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        lib.add(metadata: metadata, file: file)
        XCTAssertEqual(lib.collection![0].metadata.count,1)
        XCTAssertEqual(lib.collection![0].metadata[0].keyword, metadata.keyword)
    }
    
    func testAddDataToFileThatdoesntExist(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        XCTAssertEqual(lib.collection![0].metadata.count,0)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        lib.add(metadata: metadata, file: file2)
        XCTAssertEqual(lib.collection![0].metadata.count,0)
        
    }
    
    func testRemoveMetadata(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        XCTAssertEqual(lib.collection![0].metadata.count,1)
        lib.remove(metadata: metadata)
        //this action requires user input so wonder if there is another way????
        XCTAssertEqual(lib.collection![0].metadata.count,0)
        XCTAssertEqual(lib.collection![1].metadata.count,1)
        
    }
    
    func testRemoveMetadataThatDoesntExist(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        //lib.add(metadata: metadata2, file: file2)
        lib.remove(metadata: metadata2)
        //this action requires user input so wonder if there is another way????
        XCTAssertEqual(lib.collection![0].metadata.count,1)
        XCTAssertEqual(lib.collection![1].metadata.count,0)
        
    }
    
    func testRemoveMetadataFromFile(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        XCTAssertEqual(lib.collection![0].metadata.count,1)
        lib.remove(metadata: metadata, file: file)
        //this action requires user input so wonder if there is another way????
        XCTAssertEqual(lib.collection![0].metadata.count,0)
        XCTAssertEqual(lib.collection![1].metadata.count,1)
    }
    
    func testRemoveMetadataFromFileThatDoesntExist(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        //lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file)
        XCTAssertEqual(lib.collection![0].metadata.count,2)
        lib.remove(metadata: metadata, file: file2)
        //this action requires user input so wonder if there is another way????
        XCTAssertEqual(lib.collection![0].metadata.count,2)
    }
    
    func testRemoveMetadataThatDoesntExistFromFile(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        //lib.add(metadata: metadata2, file: file2)
        
        lib.remove(metadata: metadata2, file: file)
        //this action requires user input so wonder if there is another way????
        XCTAssertEqual(lib.collection![0].metadata.count,1)
        XCTAssertEqual(lib.collection![1].metadata.count,0)
    }
    
    func testRemoveAll(){
        let lib = MM_Collection()
        for _ in 0...5{
            let file = MM_File()
            lib.add(file: file)
        }
        XCTAssertEqual(lib.collection!.count,6)
        lib.removeAll()
        XCTAssertEqual(lib.collection!.count,0)
    }
    
    func testRemoveAllFromEmptyCol(){
        let lib = MM_Collection()
        XCTAssertEqual(lib.collection!.count,0)
        lib.removeAll()
        XCTAssertEqual(lib.collection!.count,0)
    }
    
    func testSearchterm(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        let searchResults = lib.search(term: "key1")
        XCTAssertEqual(searchResults.count,1)
        XCTAssertEqual(searchResults[0].filename, file.filename)
        XCTAssertNotEqual(searchResults[0].filename, file2.filename)
    }
    
    func testSearchtermThatDoesntExist(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        let searchResults = lib.search(term: "key5")
        XCTAssertEqual(searchResults.count,0)
    }
    
    func testSearchtermInMultipleFiles(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key1", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        let searchResults = lib.search(term: "key1")
        XCTAssertEqual(searchResults.count,2)
        XCTAssertEqual(searchResults[0].filename, file.filename)
        XCTAssertEqual(searchResults[1].filename, file2.filename)
    }
    
    func testReturnAllFiles(){
        let lib = MM_Collection()
        for i in 0...5{
            let file = MM_File(metadata: [], filename: i.description, path: "path")
            lib.add(file: file)
        }
        let searchResults = lib.all()
        var i = 0
        for results in searchResults{
            XCTAssertEqual(results.filename, i.description)
            i+=1
        }
        XCTAssertTrue(i == 6) //makes sure it does more than 1
    }
    
    func testSearchItem(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        let searchResults = lib.search(item: metadata)
        XCTAssertEqual(searchResults.count,1)
        XCTAssertEqual(searchResults[0].filename, file.filename)
        XCTAssertNotEqual(searchResults[0].filename, file2.filename)
    }
    
    func testSearchItemThatDoesntExist(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        //lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata2, file: file2)
        
        let searchResults = lib.search(item: metadata)
        XCTAssertEqual(searchResults.count,0)
    }
    
    func testSearchItemInMutipleFiles(){
        let lib : MM_Collection = MM_Collection() //empty collection
        let file = MM_File(metadata: [], filename: "testFile", path: "where im from")
        let file2 = MM_File(metadata: [], filename: "testFile1", path: "where im from1")
        lib.add(file: file)
        lib.add(file: file2)
        let metadata = MM_Metadata(keyword: "key1", value: "value1")
        //let metadata2 = MM_Metadata(keyword: "key2", value: "value2")
        lib.add(metadata: metadata, file: file)
        lib.add(metadata: metadata, file: file2)
        
        let searchResults = lib.search(item: metadata)
        XCTAssertEqual(searchResults.count,2)
        XCTAssertEqual(searchResults[0].filename, file.filename)
        XCTAssertEqual(searchResults[1].filename, file2.filename)
    }
    
}
