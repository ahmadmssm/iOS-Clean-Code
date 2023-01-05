//
//  ViewController.swift
//  CleanCodeDemoApp
//
//  Created by Ahmad Mahmoud on 07/11/2022.
//

import UIKit
import Factory
import DataModule

class ViewController: UIViewController {

    // @Injected(Container.repo) private var repo: Repo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Task {
//            do {
//                let countries = try await repo.fetchAppCountries()
//                print("")
//                print("Fetched \(countries.count) countries.")
//            } catch {
//                print("Fetching images failed with error \(error)")
//            }
//        }
    }
}

