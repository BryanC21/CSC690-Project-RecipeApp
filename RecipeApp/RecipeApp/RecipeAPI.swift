//
//  RecipeAPI.swift
//  RecipeApp
//
//

import Foundation


struct RecipeAPI {
    
    func getRecipe(for id: String, callback:  @escaping (Recipe) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            return
        }
        print("Calling API for recipe")
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: { (maybeData: Data?, maybeResponse: URLResponse?, maybeError: Error?) in
                
            print("Got response from server")
            if let error = maybeError {
                print(error)
                return
            }
            guard let data = maybeData else {
                print("No data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(Recipe.self, from: data)
                
                callback(response)
        
            } catch {
                print(error)
            }
            
        }
        )
        task.resume()
        
    }
    
    func getRecipesList(for category: String, callback:  @escaping (RecipesList) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {
            return
        }
        print("Calling API for recipes list")
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: { (maybeData: Data?, maybeResponse: URLResponse?, maybeError: Error?) in
                
            print("Got response from server")
            if let error = maybeError {
                print(error)
                return
            }
            guard let data = maybeData else {
                print("No data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(RecipesList.self, from: data)
                
                callback(response)
        
            } catch {
                print(error)
            }
            
        }
        )
        task.resume()
        
    }
    
    func getCategories(callback:  @escaping (CategoryType) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?c=list") else {
            return
        }
        print("Calling API for food categories")
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: { (maybeData: Data?, maybeResponse: URLResponse?, maybeError: Error?) in
                
            print("Got response from server")
            if let error = maybeError {
                print(error)
                return
            }
            guard let data = maybeData else {
                print("No data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(CategoryType.self, from: data)
                
                callback(response)
        
            } catch {
                print(error)
            }
            
        }
        )
        task.resume()
    }
}
