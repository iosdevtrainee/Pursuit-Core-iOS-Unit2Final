//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private var crayons: [Crayon] = Crayon.allTheCrayons
  @IBOutlet weak var tableView: UITableView!
  var defaultAlpha: CGFloat = 1.0
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableView.dataSource = self
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailVC = segue.destination  as? DetailViewController,
    let indexPath = tableView.indexPathForSelectedRow else { return }
    let crayon = crayons[indexPath.row]
    detailVC.crayon = crayon
  }

}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
    let crayon = crayons[indexPath.row]
    let dividend: CGFloat = 255.0
    let rgb = Helpers.crayonToRGB(crayon: crayon)
    cell.textLabel?.text = crayon.name
    cell.detailTextLabel?.text = crayon.hex
    cell.backgroundColor = UIColor(displayP3Red: rgb.red,
                                   green: rgb.green,
                                   blue: rgb.blue, alpha: defaultAlpha)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return crayons.count
  }
}
