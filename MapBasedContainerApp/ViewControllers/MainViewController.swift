//
//  MainViewController.swift
//  MapBasedContainerApp
//
//  Created by JB on 2021/05/13.
//

import UIKit
import MapKit
import SnapKit

class MainViewController: UIViewController {
    enum Route {
        case departure
        case destination
        case booking
        
        var viewController: UIViewController {
            switch self {
            case .departure: return DepartureViewController()
            case .destination: return DestinationViewController()
            case .booking: return BookingViewController()
            }
        }
    }
    
    private var currentRoute: Route = .departure
    
    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureMapCoordinate()
        
        moveToRoute(.departure)
    }
    
    private func configureViews() {
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    private func configureMapCoordinate() {
        // Set region on the map
        let yangjae = CLLocation(latitude: 37.485287, longitude: 127.036608).coordinate
        let region = MKCoordinateRegion(center: yangjae,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)

        mapView.setRegion(region, animated: true)
    }

    
    private func addRouteViewController(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        
        child.didMove(toParent: self)
    }
    
    private func removeRouteViewController() {
        if let currentViewController = children.first {
            currentViewController.willMove(toParent: nil)
            
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParent()
        }
    }
    
    func moveToRoute(_ route: Route) {
        currentRoute = route
        
        removeRouteViewController()
        
        addRouteViewController(currentRoute.viewController)
    }
}

extension MainViewController {
    func addPinpointOnMap() {
        
    }
    
    func addRouteOnMap() {
        
    }
}
