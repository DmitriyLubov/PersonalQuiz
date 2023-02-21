//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton.toggle()
        updateLabel()
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private extension ResultViewController {
    private func getPopularAnimal() -> Animal? {
        let animals = answersChosen.map { $0.animal }
        var countAnimals: [Animal: Int] = [:]
        
        for animal in Set(animals) {
            countAnimals[animal] = animals.filter { $0 == animal }.count
        }
        let animal = countAnimals.sorted { $0.1 > $1.1 }.first?.key
        
        return animal
    }
    
    private func updateLabel() {
        guard let animal = getPopularAnimal() else { return }
        
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
}
