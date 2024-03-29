//
//  ProgressCheck.swift
//  EatDa
//
//  Created by 김희진 on 2022/05/22.
//

import Foundation
import SnapKit
import UIKit

final class ProgressCheck: UIView {
   
    private lazy var index = 0
    private lazy var stepList: [UIImageView] = []

    init(index: Int, range: Int) {
        super.init(frame: .zero)
        self.index = index
        for _ in 1...range {
            let view = UIImageView()
            view.backgroundColor = .white
            view.image =  UIImage(named: "termUncheck")
            self.stepList.append(view)
            stepStackView.addArrangedSubview(view)
        }
        setupUI()
    }

    private lazy var stepStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 8
        view.distribution = .fillEqually
        view.axis = .horizontal
        return view
    }()
    
    func setupUI(){
        addSubview(stepStackView)
        stepStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        if stepList.count > 0 {
            for i in 0...index {
                stepList[i].image = UIImage(named: "termCheck")
                
            }
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
