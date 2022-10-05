//
//  MovieUITableViewController.swift
//  Editable TableView ICE1
//
//  Created by Student on 10/3/22.
//

import UIKit

class MovieUITableViewController: UITableViewController {
    var nameOfDataStoreVariable: MovieList!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfDataStoreVariable.listOfMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "MyTableCell", for: indexPath)
        let myAwesomeMovie = self.nameOfDataStoreVariable.listOfMovies[indexPath.row]
        
        cell.textLabel?.text = myAwesomeMovie.title
        cell.detailTextLabel?.text = String(myAwesomeMovie.year)
        
        return cell
    }
    
    @IBAction func addAMovie() {
        let myNewMovie = Movie(title: "New Film" +
                       String(self.nameOfDataStoreVariable.listOfMovies.count + 1), year: 2010 + self.nameOfDataStoreVariable.listOfMovies.count )
        
        self.nameOfDataStoreVariable.add(film: myNewMovie)
        
        let numRows = self.nameOfDataStoreVariable.listOfMovies.count
        
        tableView.insertRows(at: [IndexPath(row: numRows-1, section: 0)], with: .automatic)
        
    }
    
    @IBAction func toggleEditMote(_ sender: UIButton) {
        if isEditing {
            setEditing(false, animated: true)
            // Want to edit again later?
            sender.setTitle("Edit", for: .normal)
        } else {
            setEditing(true, animated: true)
            // Tell app when you're done with editing
            sender.setTitle("Done", for: .normal)
        }
    }
    
//    As part of the UITableViewDelegateLinks to an external site.'s methods, we will need to implement (write) the code to respond to the tableView(_:editingStyle:forRowAt) method.Links to an external site.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if( editingStyle == .delete) {
                nameOfDataStoreVariable.remove(atIndex: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
}
