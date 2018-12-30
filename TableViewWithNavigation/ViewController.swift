//
//  ViewController.swift
//  TableViewWithNavigation
//
//  Created by 舟木正憲 on 2018/12/30.
//  Copyright © 2018 masanori. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let animals = ["Dog 🐶", "Cat 😺", "Panda 🐼", "Tigar 🐯", "Snake 🐍"]

    @IBOutlet var animalTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animalTableView.dataSource = self
        animalTableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController, let indexPath = sender as? IndexPath {
            detailVC.message = animals[indexPath.row]
        }
    }

    // セクション数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    // セルのコンテンツの表示のために使う
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)

        let label = cell.viewWithTag(1) as? UILabel
        // indexPath.row で上から何番目かを指定できる
        label?.text = animals[indexPath.row]

        return cell
    }

    // セルが選択されたときに実行される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToDetail", sender: indexPath)
    }
}

