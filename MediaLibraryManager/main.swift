//
//  main.swift
//  MediaLibraryManager
//
//  Created by Paul Crane on 18/06/18.
//  Modified by Max Huang and Sam Paterson on 16/08/18.
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

/**
    Finds all the files associated with the keyword.
 
    - parameters:
        - parts:   The commandline arguments
        - last:    The list of last listed items

    - returns:
        - metadata:    A new metadata instance
        - file:        A new file instance
 */
func makeMetadataAndFile(let_parts: [String], last: MMResultSet)throws -> (metadata: MMMetadata, file: MMFile){
    var parts = let_parts
    let index = Int(parts.removeFirst())
    let file = try last.get(index: index!)
    let keyword = parts.removeFirst()
    let value = parts.removeFirst()
    let metadata = MM_Metadata(keyword: keyword, value: value)
    return(metadata: metadata, file: file)
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
    var command: MMCommand
    
    do{
        guard parts.count > 0 else {
            throw MMCliError.unknownCommand
        }
        
        commandString = parts.removeFirst();
        
        switch(commandString){
        case "list":
            command = SearchCommand(library, parts, toList: true)
            break
            
        case "search":
            command = SearchCommand(library, parts)
            break
            
        case "add":
            command = AddCommand(library, parts, last)
            break
            
        case "set":
            command = SetCommand(library, parts, last)
            break
            
        case "del":
            command = DeleteCommand(library, parts, last)
            break
            
        case "save-search":
            command = SaveCommand(library, parts, last, saveSearch: true)
            break
            
        case "save":
            command = SaveCommand(library, parts, last)
            break
            
        case "load":
            command = LoadCommand(library, parts)
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
        
        
        // try execute the command and catch any thrown errors below
        try command.execute()
            
        // if there are any results from the command, print them out here
        if let results = command.results {
            results.show()
            last = results
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
