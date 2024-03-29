//
//  MypageViewController.swift
//  EatDa
//
//  Created by 김희진 on 2022/06/01.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MyPageViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    private lazy var scrollView = UIScrollView()
    private lazy var contentsView = UIView()

    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "마이페이지"
        label.textColor = .label
        label.font = .myBoldSystemFont(ofSize: 25.0)
        return label
    }()
    
    private lazy var noticeBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(imageLiteralResourceName: "bell")
        return button
    }()
    
    private lazy var userRecView: UIView = {
        let view = UIView()
        view.backgroundColor = .applyButtonColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var userImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "empy_profile")
        view.layer.cornerRadius = 45
        return view
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .myMediumSystemFont(ofSize: 21)
        label.text = "지원 님"
        label.textColor = .white
        return label
    }()

    private lazy var profileChangeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .applyButtonColor
        button.titleLabel?.textColor = .white
        button.setTitle("프로필 변경하기", for: .normal)
        button.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        button.rx.tap.bind { [weak self] in
            let vc = ChangeProfileViewController()
            vc.hidesBottomBarWhenPushed = true
            
            let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            self?.navigationItem.backBarButtonItem = backBarButtonItem
 
            self?.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag)
        return button
    }()

    private lazy var logoImaga: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo_grey")
        return view
    }()
    
    
    
    // 내 활동
    private lazy var myActivityView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var myActivityPostView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var myActivityreviewView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var myActivityEventView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var myActivitydiviedView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrayBorderColor
        return view
    }()

    private lazy var myActivitydiviedView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrayBorderColor
        return view
    }()

    private lazy var myActivityPostButton: UIButton = {
        let button = UIButton()
        button.rx.tap.bind { [weak self] in
            print("1")

//            let vc = ChangeProfileViewController()
//            vc.hidesBottomBarWhenPushed = true
//            self?.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var myActivityReviewButton: UIButton = {
        let button = UIButton()
        button.rx.tap.bind { [weak self] in
            print("2")
        }.disposed(by: disposeBag)

        return button
    }()
    
    private lazy var myActivityEventButton: UIButton = {
        let button = UIButton()
        button.rx.tap.bind { [weak self] in
            print("3")

        }.disposed(by: disposeBag)

        return button
    }()

    private lazy var myActivityTitleLable: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "내 활동"
        label.textColor = .mainTextColor
        return label
    }()
    
    private lazy var myActivityPostTitleLable: UILabel = {
        let label = UILabel()
        label.font = .myMediumSystemFont(ofSize: 13)
        label.text = "작성글"
        label.textColor = .discribeTextColor
        return label
    }()

    private lazy var myActivityPostCountLable: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "0"
        label.textColor = .mainTextColor
        return label
    }()

    private lazy var myActivityReviewTitleLable: UILabel = {
        let label = UILabel()
        label.font = .myMediumSystemFont(ofSize: 13)
        label.text = "리뷰"
        label.textColor = .discribeTextColor
        return label
    }()

    private lazy var myActivityReviewCountLable: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "0"
        label.textColor = .mainTextColor
        return label
    }()

    
    private lazy var myActivityEventTitleLable: UILabel = {
        let label = UILabel()
        label.font = .myMediumSystemFont(ofSize: 13)
        label.text = "이벤트"
        label.textColor = .discribeTextColor
        return label
    }()

    private lazy var myActivityEventCountLable: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "0"
        label.textColor = .mainTextColor
        return label
    }()

    private lazy var myActivitydiviedSectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor
        return view
    }()

    private lazy var recentMatzipSectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor
        return view
    }()

    
    //최근 본 맛집
    private lazy var recentMatzipView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var recentMatzipTitleLable: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "최근 본 맛집"
        label.textColor = .mainTextColor
        return label
    }()

    //계정설정
    private lazy var settingHeader: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var settingHeaderImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "settings")
        return view
    }()
    
    private lazy var settingHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "계정설정"
        label.textColor = .mainTextColor
        return label
    }()
    
    private lazy var settingTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tag = 1
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var tableViewSectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor
        return view
    }()
    
    private lazy var csHeader: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var csHeaderImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "settings")
        return view
    }()
    
    private lazy var csHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = .myBoldSystemFont(ofSize: 18)
        label.text = "고객센터"
        label.textColor = .mainTextColor
        return label
    }()
    
    private lazy var csTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tag = 2
        return tableView
    }()

    private lazy var collectionView: RecommendCollectionView = {
        let collectionView = RecommendCollectionView()
        collectionView.bind(RestaurantListViewModel())
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()

        setupUI()
        binding()
    }
    
    func binding() {
        collectionView.rx.modelSelected(RestaurantListModel.self)
            .subscribe(onNext: { model in
                print(">> ", model.id)
            }).disposed(by: disposeBag)
    }
    
    
    func setupNavigation() {
        self.navigationItem.rightBarButtonItems = [noticeBarButton]
    }
    
    func setupUI(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.height.equalTo(1150)
            make.width.centerX.top.bottom.equalToSuperview()
        }
        
        [headerTitleLabel, userRecView, myActivityView, myActivitydiviedSectionView, recentMatzipView, recentMatzipSectionView, settingHeader, settingTableView, tableViewSectionView, csHeader, csTableView].forEach{ contentsView.addSubview($0) }
        
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21.2)
            $0.leading.equalToSuperview().inset(22.54)
        }

        userRecView.snp.makeConstraints { make in
            make.top.equalTo(headerTitleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(13)
            make.height.equalTo(130)
        }
        
        myActivityView.snp.makeConstraints { make in
            make.top.equalTo(userRecView.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(144)
        }
        
        [userImageView, userNameLabel, profileChangeButton, logoImaga].forEach{ userRecView.addSubview($0) }
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(90)
        }
        
        logoImaga.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalTo(userImageView.snp.trailing).offset(14)
        }
        
        profileChangeButton.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom)
            make.leading.equalTo(userImageView.snp.trailing).offset(14)
        }
        
        [myActivityTitleLable, myActivityPostView, myActivityreviewView, myActivityEventView, myActivitydiviedView1, myActivitydiviedView2].forEach{ myActivityView.addSubview($0) }

        myActivityTitleLable.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(28)
        }
        
        let btnwidth = ( UIScreen.main.bounds.size.width - 44 ) / 3
        myActivityPostView.snp.makeConstraints { make in
            make.top.equalTo(myActivityTitleLable.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(btnwidth)
        }
        myActivityreviewView.snp.makeConstraints { make in
            make.top.equalTo(myActivityTitleLable.snp.bottom)
            make.leading.equalTo(myActivityPostView.snp.trailing)
            make.height.equalTo(100)
            make.width.equalTo(btnwidth)
        }
        
        myActivityEventView.snp.makeConstraints { make in
            make.top.equalTo(myActivityTitleLable.snp.bottom)
            make.leading.equalTo(myActivityreviewView.snp.trailing)
            make.height.equalTo(100)
            make.width.equalTo(btnwidth)
        }
        
        [myActivityPostTitleLable, myActivityPostCountLable, myActivityPostButton].forEach{ myActivityPostView.addSubview($0) }
        myActivityPostCountLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        
        myActivityPostTitleLable.snp.makeConstraints { make in
            make.top.equalTo(myActivityPostCountLable.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }
        
        myActivityPostButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [myActivityReviewTitleLable, myActivityReviewCountLable, myActivityReviewButton ].forEach{ myActivityreviewView .addSubview($0) }
        myActivityReviewCountLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        
        myActivityReviewTitleLable.snp.makeConstraints { make in
            make.top.equalTo(myActivityPostCountLable.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }
        
        myActivityReviewButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        
        [myActivityEventTitleLable, myActivityEventCountLable, myActivityEventButton ].forEach{ myActivityEventView.addSubview($0) }
        myActivityEventCountLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        
        myActivityEventTitleLable.snp.makeConstraints { make in
            make.top.equalTo(myActivityEventCountLable.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }
        
        myActivityEventButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        myActivitydiviedView1.snp.makeConstraints { make in
            make.leading.equalTo(myActivityPostButton.snp.trailing)
            make.centerY.equalTo(myActivityPostButton)
            make.width.equalTo(1)
            make.height.equalTo(30)
        }
        myActivitydiviedView2.snp.makeConstraints { make in
            make.leading.equalTo(myActivityReviewButton.snp.trailing)
            make.centerY.equalTo(myActivityPostButton)
            make.width.equalTo(1)
            make.height.equalTo(30)
        }

        myActivitydiviedSectionView.snp.makeConstraints { make in
            make.top.equalTo(myActivityView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(10)
        }
        
        recentMatzipView.snp.makeConstraints { make in
            make.height.equalTo(275)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(myActivitydiviedSectionView.snp.bottom)
        }
        
        [collectionView, recentMatzipTitleLable].forEach { recentMatzipView.addSubview($0) }
        recentMatzipTitleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().inset(22.54)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(recentMatzipTitleLable.snp.bottom).offset(15)
            make.height.equalTo(RecommendCollectionViewCell.height)
        }
        
        recentMatzipSectionView.snp.makeConstraints { make in
            make.top.equalTo(recentMatzipView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(10)
        }

        settingHeader.snp.makeConstraints { make in
            make.top.equalTo(recentMatzipSectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        [settingHeaderImage, settingHeaderLabel].forEach { settingHeader.addSubview($0) }
        settingHeaderImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
        }
        settingHeaderLabel.snp.makeConstraints { make in
            make.leading.equalTo(settingHeaderImage.snp.trailing).offset(7)
            make.centerY.equalToSuperview()
        }
        
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(settingHeader.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(45 * 2)
        }
        
        tableViewSectionView.snp.makeConstraints { make in
            make.top.equalTo(settingTableView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(10)
        }
        
        csHeader.snp.makeConstraints { make in
            make.top.equalTo(tableViewSectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        [csHeaderImage, csHeaderLabel].forEach { csHeader.addSubview($0) }
        csHeaderImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
        }
        csHeaderLabel.snp.makeConstraints { make in
            make.leading.equalTo(csHeaderImage.snp.trailing).offset(7)
            make.centerY.equalToSuperview()
        }
        
        csTableView.snp.makeConstraints { make in
            make.top.equalTo(csHeader.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(45 * 5)
        }
    }
    
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return 2
        }else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.indentationLevel = 1
        cell.textLabel?.font = .mySystemFont(ofSize: 16)
        cell.accessoryType = .disclosureIndicator

        if tableView.tag == 1 {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "알림 설정"
            case 1:
                cell.textLabel?.text = "계정관리"
            default:
                cell.textLabel?.text = "알림 설정"
            }
            return cell
            
        } else {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "공지사항"
            case 1:
                cell.textLabel?.text = "신고 / 문의하기"
            case 2:
                cell.textLabel?.text = "FAQ"
            case 3:
                cell.textLabel?.text = "약관 및 정책"
            case 4:
                cell.textLabel?.text = "개인정보 처리 방침"
            default:
                cell.textLabel?.text = "공지사항"
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
