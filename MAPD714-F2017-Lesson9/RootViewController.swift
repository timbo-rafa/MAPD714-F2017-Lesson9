import UIKit

class RootViewController: UITableViewController, UITextFieldDelegate {

    //private var familyNames: [String]!
    //private var cellPointSize: CGFloat!
    //private var favouritesList: FavouritesList!
    private var remembrList: RemembrList!
    private var listTitle: String = "RememBR List" // pegar do remembrList
    //private static let familyCell = "FamilyName"
    private static let remembrCell = "RemembrCell"
    //private static let favouritesCell = "Favourites"
    
    // this application event triggers every time the view is going to be rendered
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // this application event triggers the first time the application is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remembrList = RemembrList.SharedRemembrList
        listTitle = remembrList.listTitle
    }
    
    //data source methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //return favouritesList.favourites.isEmpty ? 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows in the section.
        return 5 //remembrList.list.count
        //return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "RememBR List"
        //return section == 0 ? "All Font Families" : "My Favourite Fonts"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.remembrCell, for: indexPath) as! CustomCellTableViewCell
        cell.CellText.delegate = self
        return cell
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
