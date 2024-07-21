//
//  DiffableListConfigurationCollectionView.swift
//  TableViewProject
//
//  Created by 양승혜 on 7/21/24.
//

import UIKit
import SnapKit

struct Setting: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

class DiffableListConfigurationCollectionView: UIViewController {
    
    enum Section: String, CaseIterable {
        case general = "전체 설정"
        case personal = "개인 설정"
        case other = "기타"
    }
    
    lazy var settingCollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Setting>!
    
    let generalSetting = [Setting(title: "공지사항", imageName: "info.circle"), Setting(title: "실험실", imageName: "atom"), Setting(title: "버전 정보", imageName: "doc.circle")]
    let personalSetting = [Setting(title: "개인/보안", imageName: "person.fill"), Setting(title: "알림", imageName: "megaphone"), Setting(title: "채팅", imageName: "bubble.left"), Setting(title: "멀티프로필", imageName: "person.fill.badge.plus")]
    let otherSetting = [Setting(title: "고객센터/도움말", imageName: "person.fill.questionmark")]
    
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .clear
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(settingCollectionView)
        settingCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        configureDataSource()
        updateSnapShot()
    }
    
    private func updateSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Setting>()
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(generalSetting, toSection: .general)
        snapShot.appendItems(personalSetting, toSection: .personal)
        snapShot.appendItems(otherSetting, toSection: .other)
        dataSource.apply(snapShot)
    }
    
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Setting>!
        
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.textProperties.color = .white
            content.textProperties.font = .boldSystemFont(ofSize: 16)
            content.image = UIImage(systemName: itemIdentifier.imageName)
            content.imageProperties.tintColor = .white
            
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .black
            backgroundConfig.cornerRadius = 16
            backgroundConfig.strokeColor = .systemGray6
            backgroundConfig.strokeWidth = 4
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: settingCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}
