//
//  install.swift
//  TemplateInstaller
//
//  Created by Александр Чегошев on 21.03.2021.
//  Copyright © 2021 SkyEng. All rights reserved.
//

import Foundation

let templateNames = [
    "Service.xctemplate",
    "TableViewCell.xctemplate",
    "TableReusableView.xctemplate",
    "CollectionViewCell.xctemplate",
    "CollectionReusableView.xctemplate"
]

let arguments = CommandLine.arguments.dropFirst()



func copyTemplates(named names: [String]) {
    
    guard let destinationFolderURL = makeDestinationFolderURL(option: arguments.first) else {
        printInConsole("Failed to create URL for destination folder")
        return
    }
    
    for name in names {
        print("====================================\n")
        print(name + "\n")
        print("Installing to \(destinationFolderURL.path)")
        
        copyTemplate(named: name, toFolder: destinationFolderURL)
        
        print("====================================")
    }
}

func makeDestinationFolderURL(option: String?) -> URL? {
    switch option {
    case "into_xcode":
        let relativePath = "Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"
        let xcodeDeveloperFolderPath = bash(command: "xcode-select", arguments: ["--print-path"])
        var url = URL(fileURLWithPath: xcodeDeveloperFolderPath)
        url.appendPathComponent(relativePath, isDirectory: true)
        return url

    default:
        var url = URL(fileURLWithPath: NSHomeDirectory())
        url.appendPathComponent("Library/Developer/Xcode/Templates", isDirectory: true)
        return url
    }
}

func copyTemplate(named templateName: String, toFolder destinationFolderURL: URL) {
    
    let fileManager = FileManager.default
    let errorHandler = FileManagerErrorHandler()
    fileManager.delegate = errorHandler
    
    let destinationFileURL = destinationFolderURL.appendingPathComponent(templateName)
    let alreadyExists = fileManager.fileExists(atPath: destinationFileURL.path)
    do {
        try fileManager.copyItem(at: .init(fileURLWithPath: templateName),
                                 to: destinationFileURL)

        let action = alreadyExists ? "replaced" : "installed"
        printInConsole("Template \(action) succesfully 🎉. Enjoy it 🙂", success: true)
    } catch {
        printInConsole(error.localizedDescription)
    }
}

func printInConsole(_ message: String, success: Bool = false) {
    let prefix = success ? "✅  " : "❌  Ooops! Something went wrong 😡 : "
    print(prefix + message)
}

func shell(launchPath: String, arguments: [String]) -> String
{
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        //remove newline character.
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

class FileManagerErrorHandler: NSObject, FileManagerDelegate {
    
    
    func fileManager(_ fileManager: FileManager,
                     shouldProceedAfterError error: Error,
                     copyingItemAt srcURL: URL,
                     to dstURL: URL) -> Bool {
        switch error {
        case CocoaError.fileWriteFileExists:
            
            guard removeItem(at: dstURL, with: fileManager) else { return false }
            guard copyItem(at: srcURL, to: dstURL, with: fileManager) else { return false }
            return true
            
        case CocoaError.fileNoSuchFile:
            
            let destinationFolderURL = dstURL.deletingLastPathComponent()
            
            if !fileManager.fileExists(atPath: destinationFolderURL.path) {
                guard createDirectory(at: destinationFolderURL, with: fileManager) else { return false }
            } else {
                return false
            }
            
            return true
            
        default:
            return false
        }
    }
    
    func removeItem(at url: URL, with fileManager: FileManager) -> Bool {
        do {
            try fileManager.removeItem(at: url)
        } catch {
            printInConsole("Failed to remove existing file: \(error.localizedDescription))")
            return false
        }
        return true
    }
    
    func copyItem(at srcURL: URL, to dstURL: URL, with fileManager: FileManager) -> Bool {
        do {
            try fileManager.copyItem(at: srcURL, to: dstURL)
        } catch {
            printInConsole("Failed to copy: \(error.localizedDescription))")
            return false
        }
        return true
    }
    
    func createDirectory(at url: URL, with fileManager: FileManager) -> Bool {
        do {
            try fileManager.createDirectory(at: url,
                                            withIntermediateDirectories: true,
                                            attributes: nil)
        } catch {
            printInConsole("Failed to create folder: \(error.localizedDescription))")
            return false
        }
        return true
    }
}

copyTemplates(named: templateNames)
