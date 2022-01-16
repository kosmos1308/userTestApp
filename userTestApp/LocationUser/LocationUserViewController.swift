//
//  LocationUserViewController.swift
//  userTestApp
//
//  Created by pavel on 15.01.22.
//

import UIKit
import MapKit

final class LocationUserViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.tintColor = .systemRed
        button.layer.cornerRadius = Metrics.cornerRadiusCloseButton
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.layer.borderWidth = 1.5
        return button
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "mapAnnotation")
        return mapView
    }()
    
    private let closeAnnotationButton = UIButton(type: .roundedRect)
    private let userAnnotaion = MKPointAnnotation()
    
    private var pinName: String = ""
    private var latitude: Double = 0.0
    private var longitude: Double = 0.0
    
    var viewModel: LocationUserViewModelProtocol? {
        didSet {
            self.pinName = self.viewModel?.userNamePinInfo ?? ""
            self.latitude = self.viewModel?.userLatitude ?? 0
            self.longitude = self.viewModel?.userLongitude ?? 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.mapView.delegate = self
        self.view.addSubview(self.mapView)
        self.setupAnnotaion()
        self.setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        self.view.addSubview(self.closeButton)
        NSLayoutConstraint.activate([
            self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Metrics.top*2),
            self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingTextView),
            self.closeButton.heightAnchor.constraint(equalToConstant: Metrics.widthCloseButton),
            self.closeButton.widthAnchor.constraint(equalToConstant: Metrics.widthCloseButton)
        ])
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupAnnotaion() {
        let initialLocation = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        self.mapView.setRegion(region, animated: true)
        
        self.userAnnotaion.title = self.pinName
        self.userAnnotaion.coordinate = CLLocationCoordinate2D(latitude: initialLocation.latitude, longitude: initialLocation.longitude)
        self.mapView.addAnnotation(self.userAnnotaion)
    }
}

extension LocationUserViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "mapAnnotation", for: annotation)
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = self.closeAnnotationButton
        
        return annotationView
    }
}
