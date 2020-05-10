//
//  File.swift
//  PetRescue
//
//  Created by Flo on 10/05/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import Firebase

struct Ad {

    let ref: DatabaseReference?
    let key: String
    let age: String
    let animalImage: String
    let details: String
    let gender: String
    let kind: String
    let locality: String
    let name: String

    init(age: String,
         animalImage: String,
         details: String,
         gender: String,
         kind: String,
         locality: String,
         name: String,
         key: String = "") {
        self.age = age
        self.animalImage = animalImage
        self.details = details
        self.gender = gender
        self.kind = kind
        self.locality = locality
        self.name = name
        self.ref = nil
        self.key = key
    }

    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let age = value["age"] as? String,
            let animalImage = value["animalImage"] as? String,
            let details = value["details"] as? String,
            let gender = value["gender"] as? String,
            let kind = value["kind"] as? String,
            let locality = value["locality"] as? String,
            let name = value["name"] as? String else {
                return  nil
        }

        self.age = age
        self.animalImage = animalImage
        self.details = details
        self.gender = gender
        self.kind = kind
        self.locality = locality
        self.name = name
        self.ref = snapshot.ref
        self.key = snapshot.key
    }

    func toAnyObject() -> Any {
        return [
            "age": age,
            "animalImage": animalImage,
            "details": details,
            "gender": gender,
            "kind": kind,
            "locality": locality,
            "name": name,
        ]
    }

    static func uploadMedia(image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        let storageRef = Storage.storage().reference().child("animalsPictures").child("\(InputValuesManager.randomString(length: 20)).png")
        if let uploadData = image.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData, metadata: nil) { (_, error) in
                if error != nil {
                    print("error")
                    completion(nil)
                } else {
                    storageRef.downloadURL(completion: { (url, error) in
                        completion(url?.absoluteString)
                    })
                }
            }
        }
    }
}
