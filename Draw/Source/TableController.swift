//
//  TableController.swift
//  Draw
//
//  Created by Julian Grosshauser on 21/01/16.
//  Copyright © 2016 Julian Grosshauser. All rights reserved.
//

import UIKit

final class TableController: UITableViewController {

    //MARK: Properties

    private let controllers: [UIViewController]

    //MARK: Initialization

    init(controllers: [UIViewController]) {
        self.controllers = controllers
        super.init(style: .Plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: String(UITableViewCell))
    }
}

//MARK: UITableViewDataSource

extension TableController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controllers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(UITableViewCell))!
        cell.textLabel?.text = String(controllers[indexPath.row])
        return cell
    }
}

//MARK: UITableViewDelegate

extension TableController {

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(controllers[indexPath.row], animated: true)
    }
}
