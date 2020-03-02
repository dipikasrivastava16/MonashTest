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
        dashBoardData = [dashboardModel.getNextlectures(number: 3), dashboardModel.getNextLiveFeed(number: 1), dashboardModel.getNextShuttleBuses(number: 2)]
        self.tableView.register(UINib(nibName: "TodayHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TodayHeaderView")
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
        let cellHeight = self.tableView(tableView, heightForRowAt: indexPath)
        let cell: ParentCell
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell") as! ClassTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "CarParkCell") as! CarParkCell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "ShuttleBusCell") as! ShuttleBusCell
        default:
            fatalError("How do you get here?")
        }
        cell.addSeparater(row: indexPath.row, totalRows: numOfRowsInSection, cellHeight: cellHeight)
        cell.configureCorner(row: indexPath.row, section: indexPath.section, totalRow: numOfRowsInSection)
        cell.configureCell(cellModel: (dashBoardData?[indexPath.section] as! Array)[indexPath.row])
        return cell
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 57
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TodayHeaderView")
            let containerView = view?.viewWithTag(100)
            containerView?.layer.cornerRadius = 5.0
            containerView?.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            
            let todayView = view?.viewWithTag(101)
            let gradient = CAGradientLayer()
            gradient.shouldRasterize = true
            gradient.frame = todayView?.bounds ?? .zero
            gradient.colors = [UIColor(red: 242/255, green: 54/255.0, blue: 49/255.0, alpha: 1.0).cgColor, UIColor.systemRed.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            todayView?.layer.insertSublayer(gradient, at: 0)
            return view
            
        } else {
            return nil
        }
    }
}
