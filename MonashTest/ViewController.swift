//
//  ViewController.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dashboardModel = DashboardViewModel()
    var dashBoardData: Array<Any>?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        self.tableView.backgroundColor = self.navigationController?.navigationBar.barTintColor
        dashBoardData = [dashboardModel.getNextlectures(number: 3), dashboardModel.getNextLiveFeed(number: 2), dashboardModel.getNextShuttleBuses(number: 2)]
        // Do any additional setup after loading the view.
    }

}

extension ViewController {
    private func configureNavigationBar() {

        // left Navigation Bar
        let greetingLabel = UILabel()
        greetingLabel.numberOfLines = 2
        
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let greeting = NSMutableAttributedString(string: "Hey, \(dashboardModel.student.name)", attributes: firstAttributes)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5.0
        let date = Date()
        let subText = NSAttributedString(string: "\n\(date.todayDate) \(date.dayofTheWeek), Week \(date.weekInSemester(starting: dashboardModel.student.semesterStartDate))", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        greeting.append(subText)
        greeting.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, greeting.length))
        greetingLabel.attributedText = greeting

        let leftItem = UIBarButtonItem(customView: greetingLabel)
        self.navigationItem.leftBarButtonItem = leftItem

        // Right Navigation Bar
        
        let btnSearch = UIButton.init(type: .custom)
        btnSearch.setImage(UIImage(named: "search"), for: .normal)

        let btnProfile = UIButton.init(type: .custom)
        btnProfile.setImage(UIImage(named: "profile"), for: .normal)

        let stackview = UIStackView.init(arrangedSubviews: [btnSearch, btnProfile])
        stackview.distribution = .equalSpacing
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.spacing = 8

        let rightBarButton = UIBarButtonItem(customView: stackview)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dashBoardData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numOfRowsInSection = tableView.numberOfRows(inSection: indexPath.section)
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell") as! ClassTableViewCell
            if indexPath.row != numOfRowsInSection - 1 {
                let bottomBorder = CALayer()
                bottomBorder.frame = CGRect(x: cell.containerView.frame.origin.x + 15, y: tableView.rowHeight-1, width:cell.containerView.frame.size.width - 30, height: 1.0)
                bottomBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
                cell.contentView.layer.addSublayer(bottomBorder)
            }
            
            if indexPath.row == 0 && indexPath.row == numOfRowsInSection - 1 {
                cell.containerView.layer.cornerRadius = 5.0
                cell.containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
                
            } else if indexPath.row == 0 {
                cell.containerView.layer.cornerRadius = 5.0
                cell.containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
                
            } else if indexPath.row == numOfRowsInSection - 1 {
                cell.containerView.layer.cornerRadius = 5.0
                cell.containerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
            }
            cell.configureCell(cellModel: (dashBoardData?[indexPath.section] as! Array)[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarParkCell") as! CarParkCell
            if indexPath.row != numOfRowsInSection - 1 {
                let bottomBorder = CALayer()
                bottomBorder.frame = CGRect(x: cell.containerView.frame.origin.x + 15, y: self.tableView(tableView, heightForRowAt: indexPath)-1, width:cell.containerView.frame.size.width - 30, height: 1.0)
                bottomBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
                cell.contentView.layer.addSublayer(bottomBorder)
            }
            cell.configureCell(cellModel: (dashBoardData?[indexPath.section] as! Array)[indexPath.row])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShuttleBusCell") as! ShuttleBusCell
            if indexPath.row != numOfRowsInSection - 1 {
                let bottomBorder = CALayer()
                bottomBorder.frame = CGRect(x: cell.containerView.frame.origin.x + 15, y: self.tableView(tableView, heightForRowAt: indexPath)-1, width:cell.containerView.frame.size.width - 30, height: 1.0)
                bottomBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
                cell.contentView.layer.addSublayer(bottomBorder)
            }
            cell.configureCell(cellModel: (dashBoardData?[indexPath.section] as! Array)[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarParkCell")
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dashBoardData![section] as! Array<Any>).count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return "Available Car Parks"
        case 2:
            return "InterCampus Shuttle Bus"
            
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 131
        case 1:
            return 50
        case 2:
            return 50
            
        default:
            return 0
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}
