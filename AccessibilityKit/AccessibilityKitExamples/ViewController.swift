//
//  ViewController.swift
//  AccessibilityKitExample
//
//  Created by Kosta Eleftheriou on 9/3/18.
//  Copyright © 2018 Kpaw. All rights reserved.
//

import UIKit
import AccessibilityKit

class MaxFontTextViewCell: UITableViewCell {
  
  let maxFontTextView = MaxFontTextView()
  let gradient = CAGradientLayer()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(maxFontTextView)
    contentView.layer.insertSublayer(gradient, at: 0)
  }
  
  override func layoutSubviews() {
    gradient.frame = contentView.bounds
    maxFontTextView.frame = contentView.bounds
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class ViewController: UITableViewController {
  
  var dataSource: [String] = [
    "Test 😎",
    "Another one",
    "It works 💪",
    "Testing",
    "This is interesting",
    "Line one...\nLine two!",
    ":)",
    "More text",
    "CAPITAL LETTERS",
    "❤️",
    "Some text goes here",
    "🙉🐶",
    "What happens if the text is longer?",
    "COOL",
    "Let's try this.\nNew line...\nAnother one.",
    "The quick brown fox jumped over the lazy dog.",
    "Accessible text",
    ]
  
  private let cellIdentifier = "MaxFontViewCellIdentifier"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableView.register(MaxFontTextViewCell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.separatorStyle = .none
    tableView.alwaysBounceVertical = true
    tableView.backgroundColor = .black
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    tableView.reloadData()
  }

  override var prefersStatusBarHidden: Bool { return true }
}

extension ViewController {
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let bgColors = [UIColor.gray, UIColor.brown, UIColor.orange, UIColor.red, UIColor.magenta, UIColor.blue, UIColor.green, UIColor.cyan]
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MaxFontTextViewCell
    cell.maxFontTextView.attributedText = .init(string: "\(dataSource[indexPath.row])", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(1.0)])
    cell.gradient.colors = [bgColors[indexPath.row % bgColors.count].cgColor, UIColor.black.cgColor]
    cell.gradient.startPoint = .init(x: -0.4, y: -0.4) // default is (0.5, 0.0)
    cell.gradient.endPoint   = .init(x:  1.4, y:  1.4) // default is (0.5, 1.0)
    return cell
  }
  
}
