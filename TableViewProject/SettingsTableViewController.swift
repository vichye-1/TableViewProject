//
//  SettingsTableViewController.swift
//  TableViewProject
//
//  Created by 양승혜 on 5/23/24.
//

import UIKit

enum SettingOptions: CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}
//var settings = SettingOptions.allCases.count

class SettingsTableViewController: UITableViewController {
    
    let allcases = SettingOptions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(allcases)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allcases[section].mainOptions
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allcases.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allcases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting1", for: indexPath)
        
        cell.textLabel?.font = .systemFont(ofSize: 13)
        let section = indexPath.section
        let row = indexPath.row
        cell.textLabel?.text = allcases[section].subOptions[row]
        
        return cell
    }
    
    
}
