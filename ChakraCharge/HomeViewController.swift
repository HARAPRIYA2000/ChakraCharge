//
//  HomeViewController.swift
//  ChakraCharge
//
//  Created by Harapriya on 19/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var wholeTableView: UITableView!
    
    var dataFromApi: GetAllDataAPI?
    private var isInProgressApiCall: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getApiData()
        
        wholeTableView.delegate = self
        wholeTableView.dataSource = self
        
        wholeTableView.register(Sectin1TableViewCell.nib, forCellReuseIdentifier: Sectin1TableViewCell.identifier)
        
        wholeTableView.register(Sec2TableViewCell.nibForSec2, forCellReuseIdentifier: Sec2TableViewCell.identifierForSec2)
        
        wholeTableView.register(Section3TableViewCell.nibForSec3, forCellReuseIdentifier: Section3TableViewCell.identifierForSec3)
        
        wholeTableView.register(Section4TableViewCell.nibForSec4, forCellReuseIdentifier: Section4TableViewCell.identifierForSec4)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isInProgressApiCall ? 0 : 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell1 = wholeTableView.dequeueReusableCell(withIdentifier: Sectin1TableViewCell.identifier) as! Sectin1TableViewCell
            cell1.sec1DataLabel.text = dataFromApi?.data.section1.planName
            cell1.percentagesLabel.text = dataFromApi?.data.section1.progress
            return cell1
        case 1:
            let cell2 = wholeTableView.dequeueReusableCell(withIdentifier: Sec2TableViewCell.identifierForSec2) as! Sec2TableViewCell
            cell2.accuracyPercentages.text = dataFromApi?.data.section2.accuracy
            cell2.workoutDuration.text = dataFromApi?.data.section2.workoutDuration
            cell2.repsAmount.text = String(dataFromApi?.data.section2.reps ?? 0)
            cell2.caloryAmount.text = String(dataFromApi?.data.section2.caloriesBurned ?? 0)
            return cell2
        case 2:
            let cell3 = wholeTableView.dequeueReusableCell(withIdentifier: Section3TableViewCell.identifierForSec3) as! Section3TableViewCell
            cell3.cellFromStructureData = dataFromApi
            return cell3
        case 3:
            let cell4 = wholeTableView.dequeueReusableCell(withIdentifier: Section4TableViewCell.identifierForSec4) as! Section4TableViewCell
            cell4.cellFromStructureDataForSec4 = dataFromApi
            return cell4
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 250
        case 1: return 240
        case 2: return 200
        case 3: return 300
        default: return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = UIColor.clear
        }
    }
}

extension HomeViewController {
    func getApiData() {
        isInProgressApiCall = true
        let url = URL(string: "http://52.25.229.242:8000/homepage_v2/")!
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let decoder = JSONDecoder()
                self.dataFromApi = try decoder.decode(GetAllDataAPI.self, from: data)
                
                //MARK: Print API data for debuging, you can see all Response here from API
                //print(self.dataFromApi?.data ?? "")
                DispatchQueue.main.async {
                    self.isInProgressApiCall = false
                    self.wholeTableView.reloadData()
                }
            } catch {
                print("Error decoding JSON:", error)
            }
        }
        task.resume()
    }
}
