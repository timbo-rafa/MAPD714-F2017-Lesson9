import Foundation
import UIKit

class RemembrList {
    // Singleton design pattern
    static let SharedRemembrList = RemembrList()
    //static let SharedFavouritesList = FavouritesList()
    // Our remembr list
    private(set) var list:[String]
    //private(set) var favourites:[String]
    
    
    init() {
        let defaults = UserDefaults.standard
        let storedList = defaults.object(forKey: "remembrList") as? [String]
        list = storedList != nil ? storedList! : []
    }
    
    // This method adds an item to the list
    func addItem(item: String) {
        if !list.contains(item) {
            list.append(item)
            saveList()
        }
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
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = list[from]
        list.remove(at: from)
        list.insert(item, at: to)
        saveList()
    }
}
