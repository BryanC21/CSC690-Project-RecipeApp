//
//  RecipeResultsViewController.swift
//  RecipeApp
//
//

import UIKit

class RecipeResultsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    @IBOutlet weak var recipesListTableView: UITableView!
    var category = ""
    var listOfRecipes: [RecipesList.Meals] = []
    
    override func viewDidLoad() {
        recipesListTableView.delegate = self
        recipesListTableView.dataSource = self
        categoryTitle.text = "Viewing \(category) Recipes"
        let api = RecipeAPI()
        api.getRecipesList(for: category, callback: { results in
            self.listOfRecipes = results.meals
            DispatchQueue.main.async {
                self.recipesListTableView.reloadData()
            }
        })
    }
    
    func tableView(_ recipesListTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfRecipes.count
    }
    
    func tableView(_ recipesListTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recipesListTableView.dequeueReusableCell(withIdentifier: "RecipeResultCell") as? RecipeResultCell else {
            return UITableViewCell()
        }
        cell.recipeTitle.text = listOfRecipes[indexPath.row].strMeal
        guard let imageURL = URL(string: listOfRecipes[indexPath.row].strMealThumb) else { return cell}

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.recipeImage.image = image
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destination = segue.destination as? RecipeViewController
            let row = (sender as! IndexPath).row
            let selected = listOfRecipes[row].idMeal
            destination?.recipeId = selected
    }
    
    func tableView(_ categoryTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "ShowRecipe", sender: indexPath)
    }
    
}
