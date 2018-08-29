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

### how you tested your code;

### if you completed the assignment in a pair, you must explain the role taken by each member of your pair; and

To decide the roles we both read the specifications and Sam had an idea on how to do the backend (collection class functions) so he started working on that while Max had an idea about working with JSON files so he started working on the "front end" stuff. We then worked together to incorperate our code and make it work with each of our systems.

This method of role seperation worked well because we were able to work on different files and different aspects so we had no conficts when merging code. In terms of getting in each way or slowing the other down we never had any problems because Sam started and finished the backend almost before Mac started so Max was able to use his code straight away thus streamlining production.



### if you implemented any extensions, how many bonus marks (up to 3) you believe you should be awarded, and why. Note that the bonus marks can only be used to reach the maximum mark of 20.



### Addtional functionality added:

* [TBA] Check if the filepath has been added when loading a file - prevent duplicates.
* [TBA] 
Added a detailed list which shows the filename, type, metadata for a specified file/files by using an index after using list command. We choose to do this because we often wondered if the changes we made to a file (eg adding the deleting) did what was intended, before the only other way to see was to export to try search for the key or value and see if the results were what was intended, this is a much more convenant and sensible way to show the file contents. ##(could change this to "we thought the user would want a way to see what is in the file without exporting it, so we made this functionallty to do so")


### Assumptions made

* If duplicate keys exist in a file when importing, the first occurrence of the key is stored and ignores any further metadata with the same key. 
* When setting a new value for a duplicate key (for a file), there is no issue as to which one of the duplicate keys should be changed because the program works by first removing all instances of that key and then adding a new key/value pair with the original key and new value as the new key/value pair. This results in removing all duplicates for that key.
* Exported metadata as JSON does not appear in the same order as when they were imported.
