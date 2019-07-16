//
//  PopularityViewController.swift
//  JamFlight
//
//  Created by Alan Santoso on 15/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import Charts

class PopularityViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    
    var numbers: [Double] = [20,50,10,40,80,95,120]
    let months = ["Jul 2019", "Aug 2019", "Sep 2019", "Oct 2019", "Nov 2019", "Dec 2019", "Jan 2020", "Feb 2020", "Mar 2020", "Apr 2020", "May 2020", "Jun 2020"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        updateGraph()
        lineChartView.backgroundColor = .clear
        lineChartView.legend.enabled = false
        lineChartView.isUserInteractionEnabled = false
        
    }
    
    
    func updateGraph(){
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<numbers.count{
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            lineChartEntry.append(value)
        }
        
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number")
        line1.setColor(#colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1))
        line1.setCircleColor(.white)
        line1.lineWidth = 2
        line1.circleRadius = 3
        line1.fillAlpha = 65/255
        line1.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        line1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        line1.drawCircleHoleEnabled = false
        
        let data = LineChartData()
        data.addDataSet(line1)
        
        lineChartView.data = data
        //ChartView.chartDescription?.text = "testing chart"
        
        
        // label dikanan dihapus
        let rightAxis = lineChartView.rightAxis
        rightAxis.drawLabelsEnabled = false
        rightAxis.gridColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)
        rightAxis.axisLineColor = .clear
        
        let leftAxis = lineChartView.leftAxis
        leftAxis.gridColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)
        leftAxis.axisLineColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)
        leftAxis.labelTextColor = .white
        
        
        let xAxis = lineChartView.xAxis
        //ilangin grid dalem line
        xAxis.drawGridLinesEnabled = false
        
        //jan - dec
        xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        xAxis.granularity = 1
        xAxis.labelTextColor = .white
        
        //x label ditaro dibawah
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.axisLineColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)
        
    
        
    }



}
