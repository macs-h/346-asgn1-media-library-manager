//
//  main.swift
//  MediaLibraryManager
//
//  Created by Paul Crane on 18/06/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation

// TODO create your instance of your library here
var library:MMCollection = MM_Collection()
var last = MMResultSet()

/// Generate a friendly prompt and wait for the user to enter a line of input
/// - parameter prompt: The prompt to use
/// - parameter strippingNewline: Strip the newline from the end of the line of
///   input (true by default)
/// - return: The result of `readLine`.
/// - seealso: readLine
func prompt(_ prompt: String, strippingNewline: Bool = true) -> String? {
    print(prompt, terminator:"")
    return readLine(strippingNewline: strippingNewline)
}


// The while-loop below implements a basic command line interface. Some
// examples of the (intended) commands are as follows:
//
// load foo.json bar.json
//  from the current directory load both foo.json and bar.json and
//  merge the results
//
// list foo bar baz
//  results in a set of files with metadata containing foo OR bar OR baz
//
// add 3 foo bar
//  using the results of the previous list, add foo=bar to the file
//  at index 3 in the list
//
// add 3 foo bar baz qux
//  using the results of the previous list, add foo=bar and baz=qux
//  to the file at index 3 in the list
//
// Feel free to extend these commands/errors as you need to.
while let line = prompt("> "){
    var commandString : String = ""
    var parts = line.split(separator: " ").map({String($0)})
    var command: MMCommand?
    
    let file = MM_FileImport()
    
    do{
        guard parts.count > 0 else {
            throw MMCliError.unknownCommand
        }
        
        commandString = parts.removeFirst();
        
        switch(commandString){
        case "list":
            if parts.isEmpty {
                last = MMResultSet(library.all())
            } else {
                let keyword = parts.removeFirst()
                last = MMResultSet(library.search(term: keyword))
            }
            last.show()
            break
            
        case "search":
            // CLARIFY WITH PAUL
            break
            
        case "add":
            if parts.isEmpty {
                throw MMCliError.invalidParameters
            } else {
                let index = Int(parts.removeFirst())
                let file = try last.get(index: index!)
                let metadata = MM_Metadata(keyword: parts.removeFirst(), value: parts.removeFirst())
                library.add(metadata: metadata, file: file)
            }
            break
            
        case "set":
            if parts.isEmpty {
                throw MMCliError.invalidParameters
            } else {
                let index = Int(parts.removeFirst())
                let file = try last.get(index: index!)
                let keyword = parts.removeFirst()
                let value = parts.removeFirst()
                var metadata = MM_Metadata(keyword: keyword, value: "")
                library.remove(metadata: metadata, file: file)
                metadata = MM_Metadata(keyword: keyword, value: value)
                library.add(metadata: metadata, file: file)
            }
            break
            
        case "del":
            if parts.isEmpty {
                throw MMCliError.invalidParameters
            } else {
                let index = Int(parts.removeFirst())
                let file = try last.get(index: index!)
                let metadata = MM_Metadata(keyword: parts.removeFirst(), value: "")
                library.remove(metadata: metadata, file: file)
            }
            break
            
        case "save-search":
            if parts.isEmpty {
                throw MMCliError.invalidParameters
            } else {
                let filename = parts.removeFirst()
                let file = MM_FileExport()
                try file.write(filename: filename, items: last.all())
            }
            break
            
        case "save":
            if parts.isEmpty {
                throw MMCliError.invalidParameters
            } else {
                let filename = parts.removeFirst()
                let file = MM_FileExport()
                try file.write(filename: filename, items: library.all())
            }
            break
            
        case "load":
            do {
                let files = try file.read(filename: parts.removeFirst())
                for element in files {
                    library.add(file: element)
                }
            } catch {
                throw MMCliError.invalidParameters
            }
//            command = UnimplementedCommand()
            break
            
        case "help":
            command = HelpCommand()
            break
        case "quit":
            command = QuitCommand()
            break
        default:
            throw MMCliError.unknownCommand
        }
        
        if command != nil {
            // try execute the command and catch any thrown errors below
            try command!.execute()
            
            // if there are any results from the command, print them out here
            if let results = command!.results {
                print(results)
                results.show()
                last = results
            }
        }
        
    }catch MMCliError.unknownCommand {
        print("command \"\(commandString)\" not found -- see \"help\" for list")
    }catch MMCliError.invalidParameters {
        print("invalid parameters for \"\(commandString)\" -- see \"help\" for list")
    }catch MMCliError.unimplementedCommand {
        print("\"\(commandString)\" is unimplemented")
    }catch MMCliError.missingResultSet {
        print("no previous results to work from... ")
    }
}
