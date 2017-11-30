import Foundation
import UIKit

class FavouritesList {
    // Singleton design pattern
    static let SharedFavouritesList = FavouritesList()
    // Our favourite fonts
    private(set) var favourites:[String]
    
    // constructor
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    // This method adds a font to the user preferences file
    func addFavourite(fontName: String) {
        if !favourites.contains(fontName) {
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    // This method saves font favourites to the user preferences file
    private func saveFavourites() {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    // this method removes a favourite font from the user preferences file
    func removeFavourite(fontName: String) {
        // if let: type guard, checks to see if index exists (error checking)
        if let index = favourites.index(of: fontName) {
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favourites[from]
        favourites.remove(at: from)
        favourites.insert(item, at: to)
        saveFavourites()
    }
}
