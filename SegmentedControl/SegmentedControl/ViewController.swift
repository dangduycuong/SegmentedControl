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
    
    var display = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setData()
    }
    
    let width = UIScreen.main.bounds.width / 2 - 8
    
    
//    var choose: Bool = true {
//        didSet {
//
//        }
//    }
    
    func setData() {
        display = numbers
    }
    
    @IBAction func indexChanged(_ sender: Any)  {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textLabel.text = "First Segment Selected"
            //display = names
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
                
                self.leadingTableView.constant = 8
                self.leadingView.constant = 8
                //self.animationView.bounds.width = width
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("The animation is complete!")
            }
            
            
        default:
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
    
                self.leadingTableView.constant = UIScreen.main.bounds.width/2
                
                self.leadingView.constant = UIScreen.main.bounds.width/2
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("The animation is complete!")
            }
            textLabel.text = "Second Segment Selected"
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        //cell.numberLabel.text = String(indexPath.row)
        cell.numberLabel.text = String(display[indexPath.row])
        return cell
    }
    

}

