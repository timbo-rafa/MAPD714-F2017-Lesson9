import Foundation
import UIKit

class RemembrList {
    // Singleton design pattern
    static let SharedRemembrList = RemembrList()
    //static let SharedFavouritesList = FavouritesList()
    // Our remembr list
    private(set) var list:[String]
    //private(set) var favourites:[String]
    
    private(set) var quantity:[Integer]
    private(set) var listTitle:String
    
    private let defaultItems = [ "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    private let defaultQuantity = [ 5, 5, 5, 5, 5]
    
    init() {
        let defaults = UserDefaults.standard
        
        let storedList = defaults.object(forKey: "remembrList") as? [String]
        list = storedList != nil ? storedList! : defaultItems
        
        let storedTitle = defaults.object(forKey: "remembrTitle") as? String
        listTitle = storedTitle != nil ? storedTitle! : "RememBR List"
        
        let storedQuantity = defaults.object(forKey: "remembrQuantity") as? [Integer]
        
        quantity = storedQuantity != nil ? storedQuantity! : defaultQuantity
        
    }
    
    func addQuantity(quantity: Integer) {
        
    }
    
    // This method adds an item to the list
    func addItem(item: String) {
        if !list.contains(item) {
            list.append(item)
            saveList()
        }
    }
    
    // This method changes the title of the list
    func addTitle(title: String) {
        listTitle = title
        saveTitle()
    }
    
    // This method saves the title of the list
    private func saveTitle() {
        let defaults = UserDefaults.standard
        defaults.set(listTitle, forKey: "remembrTitle")
    }
    
    // This method saves the list to a file
    private func saveList() {
        let defaults = UserDefaults.standard
        defaults.set(list, forKey: "remembrList")
        defaults.synchronize()
    }
    
    // this method removes an item from the list
    func removeItem(item: String) {
        if let index = list.index(of: item) {
            list.remove(at: index)
            saveList()
        }
    }
    
    // this method changes an item's position on the list
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = list[from]
        list.remove(at: from)
        list.insert(item, at: to)
        saveList()
    }
}
