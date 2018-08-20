//: Playground - noun: a place where people can play

import Cocoa

let THIS_FILES_PATH:String = #file
print(THIS_FILES_PATH)

// As an array
let THIS_FILES_PATH_AS_ARRAY:[String] = #file.split(separator: "/").map({String($0)})
print(THIS_FILES_PATH_AS_ARRAY.last)

let path = "/Users/mhuang/346/asgn1/Scripts/MM_FileExport.swift"
var filepath:[String] = path.split(separator: "/").map({String($0)})
filepath.removeLast(2)
print(filepath.joined(separator: "/"))


let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
print( paths[0])
