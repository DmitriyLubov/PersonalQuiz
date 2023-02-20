//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getPopularAnimal() -> Animal? {
        let animals = answersChosen.map { $0.animal }
        var countAnimals: [Animal: Int] = [:]
        
        for animal in Set(animals) {
            countAnimals[animal] = animals.filter { $0 == animal }.count
        }
        let animal = countAnimals.sorted { $0.1 > $1.1 }.first?.key
        
        return animal
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
