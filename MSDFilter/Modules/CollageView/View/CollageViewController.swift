//
//  CollageViewController.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 27/09/2021.
//

import UIKit
import ImagePicker

class CollageViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collageView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Prperties
    
    var firstImageView = UIImageView()
    var secondImageView = UIImageView()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        
        let shapePath = UIBezierPath()
        shapePath.move(to: CGPoint(x: collageView.frame.size.width * 2/3, y: 0))
        shapePath.addLine(to: CGPoint(x: collageView.frame.size.width * 1/3, y: collageView.frame.size.height))
        shapePath.addLine(to: CGPoint(x: collageView.frame.size.width, y: collageView.frame.size.height))
        shapePath.addLine(to: CGPoint(x: collageView.frame.size.width, y: 0))
        shapePath.close()
        let path = UIBezierPath(rect: view.bounds)
        
        path.append(shapePath)
      
        firstImageView.frame = collageView.bounds
        firstImageView.frame = path.bounds
        firstImageView.contentMode = .scaleAspectFill
        collageView.clipsToBounds = true
        
        secondImageView.frame = collageView.bounds
        secondImageView.contentMode = .scaleAspectFill
        collageView.addSubview(secondImageView)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        firstImageView.layer.mask = maskLayer
        collageView.addSubview(firstImageView)
    }
    
    // MARK: - Actions
    
    @IBAction func selectImageAction(_ sender: Any) {
        
        let config = Configuration()
        config.allowMultiplePhotoSelection = true
        config.collapseCollectionViewWhileShot = false
        let imagePicker = ImagePickerController(configuration: config)

        imagePicker.imageLimit = 2
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        
    }
}

// MARK: - Image Picker Delegate

extension CollageViewController: ImagePickerDelegate {
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
        if let firstImage = images.first {
            self.firstImageView.image = firstImage
        }
        
        if let secondImage = images.last {
            self.secondImageView.image = secondImage
        }
        
        imagePicker.dismiss(animated: true)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true)
    }
    
}
