//
//  ViewController.swift
//  Project1
//
//  Created by El ati El adimi, Othmane on 11/08/2021.
//  Copyright © 2021 El ati El adimi, Othmane. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	var pictures = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let items = try! fm.contentsOfDirectory(atPath: path)

		for item in items {
			if item.hasPrefix("nssl") {
				pictures.append(item)
			}
		}
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedImage = pictures[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}
}
