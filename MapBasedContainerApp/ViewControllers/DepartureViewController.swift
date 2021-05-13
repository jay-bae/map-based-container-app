//
//  DepartureViewController.swift
//  MapBasedContainerApp
//
//  Created by JB on 2021/05/13.
//

import UIKit
import FloatingPanel

class DepartureViewController: UIViewController {
    private lazy var fpControl = FloatingPanelController()
    
    override func loadView() {
        super.loadView()
        
        let mainFrame = UIScreen.main.bounds
        view = PassThroughView(frame: mainFrame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    private func configureViews() {
        view.backgroundColor = .clear
        
        fpControl.delegate = self
        fpControl.set(contentViewController: VirtualStopPickerViewController())
        fpControl.addPanel(toParent: self, animated: false)
        fpControl.surfaceView.backgroundColor = .white
    }
}

extension DepartureViewController: FloatingPanelControllerDelegate {
    
}
