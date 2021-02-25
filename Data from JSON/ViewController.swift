//
//  ViewController.swift
//  Data from JSON
//
//  Created by Admin on 1/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPostData { (posts) in
            for post in posts {
                print(post.title)
                print(post.body)
                print("\n")
            }
        }
    }

    func fetchPostData(completionHandler: @escaping ([Post]) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let postData = try JSONDecoder().decode([Post].self, from: data)
                
                completionHandler(postData)
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}

