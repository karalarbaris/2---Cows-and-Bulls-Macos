//
//  ViewController.swift
//  2 - Cows and Bulls Macos
//
//  Created by Baris Karalar on 7.12.2021.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    @IBOutlet var guess: NSTextField!
    
    var answer = ""
    var guesses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func submitGuess(_ sender: NSButton) {
    
    }
    
    func result(for guess: String) -> String {
        return "result"
    }
    

}

extension ViewController: NSTableViewDelegate {
    
}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return guesses.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if tableColumn?.title == "Guess" {
            // this is the "Guess" column; show a previous guess
            vw.textField?.stringValue = guesses[row]
        } else {
            // this is the "Result" column; call our new method
            vw.textField?.stringValue = result(for: guesses[row])
        }
        
        
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
}

