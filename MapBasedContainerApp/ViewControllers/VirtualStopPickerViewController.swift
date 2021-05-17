//
//  VirtualStopPickerViewController.swift
//  MapBasedContainerApp
//
//  Created by JB on 2021/05/13.
//

import UIKit

class VirtualStopPickerViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        
        return view
    }()
    
    private lazy var departureButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move to departure", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5.0
        
        return button
    }()
    
    private lazy var destinationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move to destination", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5.0
        
        return button
    }()
    
    private lazy var bookingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move to booking", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5.0
        
        return button
    }()
    
    var listener: UIViewController?
    
    override func viewDidLoad() {
        configureViews()
        
        bindButtonEvents()
    }
    
    private func configureViews() {
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(24)
            maker.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        
        [departureButton, destinationButton, bookingButton, UIView()].forEach({ stackView.addArrangedSubview($0) })
    }
    
    private func bindButtonEvents() {
        departureButton.addTarget(self, action: #selector(tapDepartureButton), for: .touchUpInside)
        destinationButton.addTarget(self, action: #selector(tapDestinationButton), for: .touchUpInside)
        bookingButton.addTarget(self, action: #selector(tapBookingButton), for: .touchUpInside)
    }
    
    @objc
    private func tapDepartureButton() {
        guard let listener = listener,
              let mainViewController = listener as? MainViewController else { return }
        
        mainViewController.moveToRoute(.departure)
    }
    
    @objc
    private func tapDestinationButton() {
        guard let listener = listener,
              let mainViewController = listener as? MainViewController else { return }
        
        mainViewController.moveToRoute(.destination)
    }
    
    @objc
    private func tapBookingButton() {
        guard let listener = listener,
              let mainViewController = listener as? MainViewController else { return }
        
        mainViewController.moveToRoute(.booking)

    }
}
