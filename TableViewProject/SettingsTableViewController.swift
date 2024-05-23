//
//  SettingsTableViewController.swift
//  TableViewProject
//
//  Created by 양승혜 on 5/23/24.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let sections = ["전체 설정", "개인 설정", "기타"]
    let entireItems = ["공지사항", "실험실", "버전 정보"]
    let privateItems = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let etcItems = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return entireItems.count
        } else if section == 1 {
            return privateItems.count
        } else if section == 2 {
            return etcItems.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting1", for: indexPath)
        
        cell.textLabel?.font = .systemFont(ofSize: 13)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = entireItems[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = privateItems[indexPath.row]
        } else {
            cell.textLabel?.text = etcItems[indexPath.row]
        }
        
        return cell
    }
    
    
}
