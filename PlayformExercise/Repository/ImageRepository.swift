//
//  ImageRepository.swift
//  PlayformExercise
//
//  Created by shlomo carmen on 02/08/2021.
//

import Foundation
import UIKit

class ImageRepository {
    
    static let shared = ImageRepository()
    
    let starUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Five-pointed_star.svg/1200px-Five-pointed_star.svg.png"
    let sunUrl = "https://solarsystem.nasa.gov/system/basic_html_elements/11561_Sun.png"
    
    private init() {
        
    }
    
    func getImage(complited: Bool) -> UIImage? {
        let urlString = complited ? starUrl : sunUrl
        guard let url = URL(string: urlString) else {
            return getSavedImage()
        }
        guard let data = try? Data(contentsOf: url) else {
            return getSavedImage()
        }
        saveImage(image: UIImage(data: data)!)
        return UIImage(data: data)
    }
    
    func saveImage(image: UIImage) {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documents.appendingPathComponent("savedImage.png")
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
        }
    }
    
    func getSavedImage() -> UIImage? {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsUrl.appendingPathComponent("savedImage.png")
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {}
        return nil
    }
    
    
}
