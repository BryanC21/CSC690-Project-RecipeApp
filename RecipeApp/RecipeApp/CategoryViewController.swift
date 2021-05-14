//
//  ViewController.swift
//  RecipeApp
//
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories: [CategoryType.Meals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        let api = RecipeAPI()
        api.getCategories(callback: { results in
            self.categories = results.meals
            DispatchQueue.main.async {
                self.categoryTableView.reloadData()
            }
        })
        // Do any additional setup after loading the view.
    }

    func tableView(_ categoryTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ categoryTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell else {
            return UITableViewCell()
        }
        cell.categoryLabel.text = categories[indexPath.row].strCategory
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destination = segue.destination as? RecipeResultsViewController
            let row = (sender as! IndexPath).row
            let selectedCategory = categories[row].strCategory
            destination?.category = selectedCategory
    }
    
    func tableView(_ categoryTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "CategoryToResults", sender: indexPath)
    }
    

}

