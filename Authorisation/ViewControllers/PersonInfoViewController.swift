//
//  PersonInfoViewController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 05.04.2023.
//

import UIKit

final class PersonInfoViewController: UIViewController {

    
    @IBOutlet var avatar: UIImageView! {
        didSet {
            avatar.layer.cornerRadius = avatar.frame.height / 2
        }
    }
    @IBOutlet var fullNameAndAge: UILabel!
    @IBOutlet var occupation: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var hobbyValue: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModelDataToView()
        navigationItem.title = user.person.name + " " + user.person.surname
        view.addVerticalGradientLayer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BiographyViewController else { return }
        bioVC.user = user
    }
    
    private func loadModelDataToView() {
        avatar.image = UIImage(named: user.person.photo)
        fullNameAndAge.text = user.person.fullName + ", " + user.person.age
        occupation.text = user.person.occupation
        location.text = user.person.location
        hobbyValue.text = user.person.hobby
    }
}
