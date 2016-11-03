//
//  ViewController.swift
//  仿西窗烛卡片切换
//
//  Created by 马海江 on 16/11/3.
//  Copyright © 2016年 Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SwipeableCardsDataSource, SwipeableCardsDelegate{

    @IBOutlet weak var cardsWidth: NSLayoutConstraint!
    @IBOutlet weak var cardsHeight: NSLayoutConstraint!
    @IBOutlet weak var cards: SwipeableCards!
    var cardsData = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeCardsData()
        cards.dataSource = self
        cards.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func makeCardsData() -> () {
        for i in 0..<100 {
            cardsData.append(i)
        }
    }
    
    @IBAction func changeOffset(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            cards.offset = (5, 5)
        case 1:
            cards.offset = (0, 5)
        case 2:
            cards.offset = (-5, 5)
        case 3:
            cards.offset = (-5, -5)
        default:
            break
        }
    }
   
    @IBAction func changeNumber(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            cards.numberOfVisibleItems = 3
        case 1:
            cards.numberOfVisibleItems = 2
        case 2:
            cards.numberOfVisibleItems = 5
        default:
            break
        }
    }
    // SwipeableCardsDataSource methods
    func numberOfTotalCards(in cards: SwipeableCards) -> Int {
        return cardsData.count
    }
    func view(for cards: SwipeableCards, index: Int, reusingView: UIView?) -> UIView {
        var label: UILabel? = reusingView as? UILabel
        if label == nil {
            let labelFrame = CGRect(x: 0, y: 0, width: cardsWidth.constant - 30, height: cardsHeight.constant - 20)
            label = UILabel(frame: labelFrame)
            label!.textAlignment = .center
            label!.layer.cornerRadius = 5
        }
        label!.text = String(cardsData[index])
        label!.layer.backgroundColor = Color.random.cgColor
        return label!
    }
    
    // SwipeableCardsDelegate methods
    func cards(_ cards: SwipeableCards, beforeSwipingItemAt index: Int) {
        print("Begin swiping card \(index)!")
    }
    func cards(_ cards: SwipeableCards, didLeftRemovedItemAt index: Int) {
        print("<--\(index)")
    }
    func cards(_ cards: SwipeableCards, didRightRemovedItemAt index: Int) {
        print("\(index)-->")
    }
    func cards(_ cards: SwipeableCards, didRemovedItemAt index: Int) {
        print("index of removed card:\(index)")
    }
}

