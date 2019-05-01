//
//  ViewController.swift
//  SegmentedControl
//
//  Created by Cuong on 4/27/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var animationView: UIView!
    
    @IBOutlet weak var leadingView: NSLayoutConstraint!
    
    @IBOutlet weak var leadingTableView: NSLayoutConstraint!
    
    
    
    var names = ["A", "B", "C", "D", "E", "F"]
    
    var numbers = [Int](0...4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.textColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    let width = UIScreen.main.bounds.width / 2 - 8
    
    
    @IBAction func indexChanged(_ sender: Any)  {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textLabel.text = "Array Numbers"
            textLabel.textColor = UIColor.groupTableViewBackground
            
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
                self.leadingTableView.constant = 8
                self.leadingView.constant = 8
                
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("The animation is complete!")
                print(self.segmentedControl.selectedSegmentIndex)
            }
            
            
        default:
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
    
                self.leadingTableView.constant = UIScreen.main.bounds.width/2
                
                self.leadingView.constant = UIScreen.main.bounds.width/2
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("The animation is complete!")
                print(self.segmentedControl.selectedSegmentIndex)
            }
            textLabel.text = "Array Names"
            textLabel.textColor = UIColor.green
            break
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return numbers.count
        default:
            return names.count
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        if segmentedControl.selectedSegmentIndex == 0 {
            cell.displayLabel.text = String(numbers[indexPath.row])
            cell.displayView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            textLabel.textColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        } else {
            cell.displayLabel.text = names[indexPath.row]
            cell.displayView.backgroundColor = UIColor.green
        }
        return cell
    }
    
}

