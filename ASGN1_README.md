# COSC346 Assignment 1 - Media Manager Library

## Team SMAX:

Sam Paterson (3175949)

Max Huang (4427762)

***

## Project Specifications

To design, implement, test, and document a tool for managing a media library - building upon
nothing more than the Foundation framework.

The tool must be able handle a large collection of media of assorted types (images, video, music,
text documents) as a library and manage it - including a set of metadata attached to each of these
 types of media.

The library must support the following features:

* Import and export of data from files.
* Searching metadata for keywords - and displaying a list of the files returned by the search.
* Adding, changing/setting, and removing metadata keywords or values.

***

### Object Oriented Concepts in Design and Implementation


### the way in which object-oriented concepts were used in your design and implementation;

When designing our program from the start we wanted to decouple the front and backend as much as possible, this would make it easier to work on seperatly as a pair but also allowed us to make changes to either front or backend without affecting the other side asmuch. Because the MM_collection class uses protocols for the functions the front end will always know that any calls to the backend will always be implemented.

Another design we used was inheritence. when creating the command classes that the main class calls we quickly realised that we had to repeat alot of code in the variables and also in the "init()" functions, so we decided to use inheritence to reduce the amount of duplicate code by storing most the vairable in the parent class "CommandInitialiser" and using the parents "init()" function raither than basically the same "init()" function in each class.

The last design principle we used is a singleton pattern. We realised that we were often making a tempory file and metadata and using it for the collection functions. The issue with just making just a function to do this work is that this function is called by multiple classes, so to make it available to every class in the file (fileprivate class) we used a singleton pattern ****(we could also put it in the parent class or make it a static a static function)



### how you tested your code;

We implemented two types of testing: Unit tests and bash script testing. 
We used Unit testing to test the individual backend components against what we expected them to do (eg test "add(file)", "add(metadata, file)"). Testing in this manner allowed us to make sure that the backend works as expected so if there are issues with the program as a whole we know it's to do with the front end.

We used bash script testing to test the program as a whole to make sure the user expience is pleasent and the program does what is required and expected. We testing with a large range of inputs and commands in various orders so that we could deal with anything that the user could attempt. Because we tested the backend with unit tests we know if there are any porblems it is a an issue with the front end which made debugging so much easier.

### if you completed the assignment in a pair, you must explain the role taken by each member of your pair; and

To decide the roles we both read the specifications and Sam had an idea on how to do the backend (collection class functions) so he started working on that while Max had an idea about working with JSON files so he started working on the "front end" stuff. We then worked together to incorperate our code and make it work with each of our systems.

This method of role seperation worked well because we were able to work on different files and different aspects so we had no conficts when merging code. In terms of getting in each way or slowing the other down we never had any problems because Sam started and finished the backend almost before Mac started so Max was able to use his code straight away thus streamlining production.



### if you implemented any extensions, how many bonus marks (up to 3) you believe you should be awarded, and why. Note that the bonus marks can only be used to reach the maximum mark of 20.



### Addtional functionality added:

* [TBA] Check if the filepath has been added when loading a file - prevent duplicates.
* [TBA] 
Added a detailed list which shows the filename, type, metadata for a specified file/files by using an index after using list command. We choose to do this because we often wondered if the changes we made to a file (eg adding the deleting) did what was intended, before the only other way to see was to export to try search for the key or value and see if the results were what was intended, this is a much more convenant and sensible way to show the file contents. ##(could change this to "we thought the user would want a way to see what is in the file without exporting it, so we made this functionallty to do so")

Added a user confirmation prompt when deleting a item from the collection. We choose to do this so it would be harder for the user to delete something unintentionally by having it set to "no" by default.


### Assumptions made

* If duplicate keys exist in a file when importing, the first occurrence of the key is stored and ignores any further metadata with the same key. 
* When setting a new value for a duplicate key (for a file), there is no issue as to which one of the duplicate keys should be changed because the program works by first removing all instances of that key and then adding a new key/value pair with the original key and new value as the new key/value pair. This results in removing all duplicates for that key.
* Exported metadata as JSON does not appear in the same order as when they were imported.
* When searching for multiple keywords, if a single file matches multiple times only one instance of that file is displayed as the result to the user.
