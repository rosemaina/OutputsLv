import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var foodItems = [Food]()
    var moc:NSManagedObjectContext!
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        self.tableView.dataSource = self
        
        loadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData(){
        let foodRequest:NSFetchRequest<Food> = Food.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "added", ascending: false)
        foodRequest.sortDescriptors = [sortDescriptor]
        
        do {
            try foodItems = moc.fetch(foodRequest)
            
        }catch {
            print("Could not load data")
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func addFoodToDatabase(_ sender: UIButton) {
        let foodItem = Food(context: moc)
        foodItem.added = NSDate() as Date
        
        if sender.tag == 0 {
            foodItem.foodType = "Fruit"
        }else {
            foodItem.foodType = "Vegetable"
        }
        
        appDelegate?.saveContext()
        
        loadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // 1
        let foodItem = foodItems[indexPath.row]
        
        // 2
        let foodType = foodItem.foodType
        cell.textLabel?.text = foodType
        
        // 3
        let foodDate = foodItem.added as! Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d yyyy, hh:mm"
        
        cell.detailTextLabel?.text = dateFormatter.string(from: foodDate)
        
        // 4
        if foodType == "Fruit" {
            cell.imageView?.image = UIImage(named: "Apple")
        }else{
            cell.imageView?.image = UIImage(named: "Salad")
        }
        
        return cell
    }

    
}

