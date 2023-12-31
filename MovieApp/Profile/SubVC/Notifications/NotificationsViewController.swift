//
//  NotificationsViewController.swift
//  MovieApp
//
//  Created by Vanopr on 04.01.2024.
//

import UIKit
import SnapKit

final class NotificationsViewController: ViewController, NotificationsVCProtocol {
    
    // MARK: - Presenter
    var presenter: NotificationsPresenterProtocol!
    
    // MARK: - Private UI Properties
    private var mainView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.appTextGrey.withAlphaComponent(0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private var settingLabel: UILabel = {
        let label = UILabel.makeLabel(
            font: .montserratMedium(ofSize: 14),
            color: .appTextGrey,
            numberOfLines: 1,
            alignment: .left
        )
        label.text = "Messages Notifications".localized
        return label
    }()
    
    private var notificationsLabel: UILabel = {
        let label = UILabel.makeLabel(
            font: .montserratMedium(ofSize: 16),
            color: .white,
            numberOfLines: 1,
            alignment: .left
        )
        label.text =  "Show Notifications".localized
        return label
    }()
    
    private var notificationSwitch: UISwitch = {
        var switcher = UISwitch()
        switcher.isOn = false
        switcher.onTintColor = .appBlue
        return switcher
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isTranslucent = true
        view.backgroundColor = .appDark
        view.addSubview(mainView)
        mainView.addSubviews(settingLabel, notificationsLabel, notificationSwitch)
        title = "Notifications".localized
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                .offset(LayoutConstraint.standardOffset)
            make.left.right.equalToSuperview()
                .inset(LayoutConstraint.standardOffset)
            make.height.equalTo(LayoutConstraint.mainViewHeight)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
                .offset(LayoutConstraint.settingLabelTopOffset)
            make.left.equalToSuperview()
                .offset(LayoutConstraint.labelLeftOffset)
        }
        
        notificationsLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
                .offset(LayoutConstraint.notificationsLabelBottomOffset)
            make.left.equalToSuperview()
                .offset(LayoutConstraint.labelLeftOffset)
        }
        
        notificationSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(notificationsLabel.snp.centerY)
            make.right.equalToSuperview()
                .offset(-LayoutConstraint.standardOffset)
        }
    }
}

// MARK: - LayoutConstraint
private enum LayoutConstraint {
    static let standardOffset: CGFloat = 20
    static let mainViewHeight: CGFloat = 140
    static let settingLabelTopOffset: CGFloat = 28
    static let labelLeftOffset: CGFloat = 16
    static let notificationsLabelBottomOffset: CGFloat = -28
}
