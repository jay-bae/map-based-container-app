//
//  DepartureViewController.swift
//  MapBasedContainerApp
//
//  Created by JB on 2021/05/13.
//

import UIKit
import FloatingPanel

class DepartureViewController: UIViewController {
    private lazy var viewNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "\(DepartureViewController.self)"
        label.backgroundColor = .white
        
        return label
    }()
    
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
        
        let pickerViewController = VirtualStopPickerViewController()
        pickerViewController.listener = self.parent
        fpControl.set(contentViewController: pickerViewController)
        
        fpControl.layout = CustomFloatingPanelLayout()
        fpControl.addPanel(toParent: self, animated: false)
        fpControl.surfaceView.backgroundColor = .white
        
        view.addSubview(viewNameLabel)
        viewNameLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(16)
            maker.bottom.equalTo(fpControl.surfaceView.snp.top).offset(-10)
        }
    }    
}

extension DepartureViewController {
    class CustomFloatingPanelLayout: FloatingPanelLayout {
        var position: FloatingPanelPosition = .bottom
        var initialState: FloatingPanelState = .half

        var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
            return [
                .full: FloatingPanelLayoutAnchor(absoluteInset: 350.0, edge: .bottom, referenceGuide: .safeArea),
                .half: FloatingPanelLayoutAnchor(absoluteInset: 150.0, edge: .bottom, referenceGuide: .safeArea),
            ]
        }

        func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
            return 0.0
        }
    }

}
