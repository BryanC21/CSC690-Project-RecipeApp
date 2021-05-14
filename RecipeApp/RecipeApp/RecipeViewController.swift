//
//  RecipeViewController.swift
//  RecipeApp
//
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var recipeTableView: UITableView!
    var recipeId = ""
    var recipeData: [Recipe.Meals] = []
    
    func tableView(_ recipeTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ recipeTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeHeaderCell") as? RecipeHeaderCell else {
                return UITableViewCell()
            }
            if recipeData.count > 0{
                cell.recipeName.text = recipeData[0].strMeal
                //set and load image
                guard let imageURL = URL(string: recipeData[0].strMealThumb) else { return cell}

                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }

                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.recipeImage.image = image
                    }
                }
            }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeIngredientsCell") as? RecipeIngredientsCell else {
                return UITableViewCell()
            }
            if recipeData.count > 0{ //logic for many ingredients
                var ing = ""
                //The API has 20 recipes that are set to null if unused rather than an array so need to get values out one by one
                if(recipeData[0].strIngredient1 != nil && recipeData[0].strIngredient2 != ""){
                    ing.append("•\(recipeData[0].strMeasure1!) - \(recipeData[0].strIngredient1!)")
                }
                if (recipeData[0].strIngredient2 != nil && recipeData[0].strIngredient2 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure2!) - \(recipeData[0].strIngredient2!)")
                }
                if (recipeData[0].strIngredient3 != nil && recipeData[0].strIngredient3 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure3!) - \(recipeData[0].strIngredient3!)")
                }
                if (recipeData[0].strIngredient4 != nil && recipeData[0].strIngredient4 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure4!) - \(recipeData[0].strIngredient4!)")
                }
                if (recipeData[0].strIngredient5 != nil && recipeData[0].strIngredient5 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure5!) - \(recipeData[0].strIngredient5!)")
                }
                if (recipeData[0].strIngredient6 != nil && recipeData[0].strIngredient6 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure6!) - \(recipeData[0].strIngredient6!)")
                }
                if (recipeData[0].strIngredient7 != nil && recipeData[0].strIngredient7 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure7!) - \(recipeData[0].strIngredient7!)")
                }
                if (recipeData[0].strIngredient8 != nil && recipeData[0].strIngredient8 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure8!) - \(recipeData[0].strIngredient8!)")
                }
                if (recipeData[0].strIngredient9 != nil && recipeData[0].strIngredient9 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure9!) - \(recipeData[0].strIngredient9!)")
                }
                if (recipeData[0].strIngredient10 != nil && recipeData[0].strIngredient10 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure10!) - \(recipeData[0].strIngredient10!)")
                }
                if (recipeData[0].strIngredient11 != nil && recipeData[0].strIngredient11 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure11!) - \(recipeData[0].strIngredient11!)")
                }
                if (recipeData[0].strIngredient12 != nil && recipeData[0].strIngredient12 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure12!) - \(recipeData[0].strIngredient12!)")
                }
                if (recipeData[0].strIngredient13 != nil && recipeData[0].strIngredient13 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure13!) - \(recipeData[0].strIngredient13!)")
                }
                if (recipeData[0].strIngredient14 != nil && recipeData[0].strIngredient14 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure14!) - \(recipeData[0].strIngredient14!)")
                }
                if (recipeData[0].strIngredient15 != nil && recipeData[0].strIngredient15 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure15!) - \(recipeData[0].strIngredient15!)")
                }
                if (recipeData[0].strIngredient16 != nil && recipeData[0].strIngredient16 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure16!) - \(recipeData[0].strIngredient16!)")
                }
                if (recipeData[0].strIngredient17 != nil && recipeData[0].strIngredient17 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure17!) - \(recipeData[0].strIngredient17!)")
                }
                if (recipeData[0].strIngredient18 != nil && recipeData[0].strIngredient18 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure18!) - \(recipeData[0].strIngredient18!)")
                }
                if (recipeData[0].strIngredient19 != nil && recipeData[0].strIngredient19 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure19!) - \(recipeData[0].strIngredient19!)")
                }
                if (recipeData[0].strIngredient20 != nil && recipeData[0].strIngredient20 != ""){
                    ing.append("\n•\(recipeData[0].strMeasure20!) - \(recipeData[0].strIngredient20!)")
                }
                
                cell.ingredients.text = ing
            }
            return cell
        } else if indexPath.row == 2 {
            guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: "RecipeInstructionsCell") as? RecipeInstructionsCell else {
                return UITableViewCell()
            }
            if recipeData.count > 0{
                cell.instructions.text = recipeData[0].strInstructions
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func viewDidLoad() {
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        recipeTableView.allowsSelection = false
        let api = RecipeAPI()
        api.getRecipe(for: recipeId, callback: { results in
            self.recipeData = results.meals
            print(self.recipeData[0].strMeal)
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        })
    }
}
