//
//  MasterVCPresenter.swift
//  GamesOfPatterns
//
//  Created by Sergey on 05.08.2023.
//

import UIKit

class MasterVCPresenter: NSObject {
    let model = PatternsNamesModel()
    var view: MasterViewController!
    var router: MasterRouter!
    
    init(view: MasterViewController!) {
        self.view = view
    }
    
}

extension MasterVCPresenter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        model.patterns.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.patterns[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIds.cellId.rawValue, for: indexPath)
        cell.textLabel?.text = model.patterns[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PatternsTypes.allCases[section].rawValue
    }
}

extension MasterVCPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        let name = model.patterns[indexPath.section][indexPath.row]
        router = MasterRouter(masterPresenter: self)
        router.showViewController(name: name)
    }
}
