//
//  ChartViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-11-24.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    lazy var chart: PieChartView = {
        let chart = PieChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.backgroundColor = .white
        return chart
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(chart)
        NSLayoutConstraint.activate([
            chart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chart.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chart.widthAnchor.constraint(equalToConstant: 300),
            chart.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        let vancouverPopulation = PieChartDataEntry(value: 70.3, label: "Vancouver")
        let TorontoPopulation = PieChartDataEntry(value: 65.3, label: "Toronto")
        let set = PieChartDataSet(entries: [vancouverPopulation, TorontoPopulation], label: "Cnada Population")
        
        set.colors = ChartColorTemplates.liberty()
        + ChartColorTemplates.colorful()
        + ChartColorTemplates.vordiplom()
        + ChartColorTemplates.joyful()
        + ChartColorTemplates.pastel()
        + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]

        let pieChartData = PieChartData(dataSet: set)
        chart.data = pieChartData
    }
}
