//: Playground - noun: a place where people can play

import Cocoa

//
// The third chunk of code I showed was how to read data from a file supplied as a path:
//
//let filename = "/path/to/people.json"
let filename = "test.json"
//let url = URL(fileURLWithPath: filename)
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

//print( filename[String.index] )

//
// In the people.json data file I’ve copy/pasted the example data from the
// assignment’s readme (the one about me and Hamza and the languages). The main
// important point here is that I’m loading it into an array of structs (this is
// in the decoder line—the [Person].self part). The struct I’m using mirrors
// the definition of the JSON data. From there, you should be able to read/write
// the actual data to/from the JSON files.
//
