//: Playground - noun: a place where people can play

import Cocoa

//
// The third chunk of code I showed was how to read data from a file supplied as a path:
//
//let filename = "/path/to/people.json"
var filename = "/path/to/foo.png"

let filename_rev = String(filename.reversed())

let start = filename_rev.startIndex
let end = filename_rev.index(filename_rev.startIndex, offsetBy: filename_rev._bridgeToObjectiveC().range(of: "/").location)

print( String( filename_rev[start..<end].reversed()))
