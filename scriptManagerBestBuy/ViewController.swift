//
//  ViewController.swift
//  scriptManagerBestBuy
//
//  Created by Zain Lakhani on 2020-08-30.
//  Copyright © 2020 Arif Lakhani. All rights reserved.
//

import Cocoa
import Alamofire

class ViewController: NSViewController {
    
    var background:NSView?
    var offersButton:NSButton?
    var totalCountLabel:NSTextField?
    var totalCount:Int?
    
    @IBOutlet weak var offerTableHeaders: NSTableHeaderView!
    
    @IBOutlet weak var offerTable: NSScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.download("https://marketplace.bestbuy.ca/api/offers/export",parameters: ["api_key": "e417af22-e80f-4dd6-953f-03c34f3a44d7"]).response {
            result in
            let url = result.fileURL!
            
            AF.request("https://marketplace.bestbuy.ca/api/offers", parameters: ["api_key": "e417af22-e80f-4dd6-953f-03c34f3a44d7"])
                .responseJSON { json in
                    let data = json.data
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(offerResults.self, from: data!)
                        self.totalCount = results.total_count
                        print(self.totalCount)
                        
                        self.view.setFrameSize(NSSize(width: 1000, height: 650))
                        self.background = NSView(frame: self.view.frame)
                        self.background?.wantsLayer = true
                        self.background?.layer?.backgroundColor = .white

                        
                        self.offersButton = NSButton(frame: NSRect(x: 10, y: self.view.frame.maxY - self.view.frame.height/2, width: self.view.frame.width/2 - 10, height: self.view.frame.height/2 - 10))
                        
                        self.offersButton?.wantsLayer = true
                        self.offersButton?.layer?.backgroundColor = .init(genericCMYKCyan: 0, magenta: 0.62, yellow: 1.0, black: 0.0, alpha: 1.0)
                        self.offersButton?.layer?.borderColor = .black
                        self.offersButton?.layer?.cornerRadius = 7.0
                        //                        self.offersButton?.layer?.borderColor = .white
                        self.offersButton?.action = #selector(self.offerButtonPressed(sender:))
                        self.offersButton?.title = ""
                        
                        self.view.addSubview(self.background!)
                        self.view.addSubview(self.offersButton!)
                        
                        self.totalCountLabel = NSTextField(frame: NSRect(x: 20, y: self.view.frame.height - 120, width: self.offersButton!.frame.width, height: 107))
                        
                        self.totalCountLabel?.stringValue = "\(self.totalCount!) Offers"
                        self.totalCountLabel?.isBezeled = false
                        self.totalCountLabel?.drawsBackground = false
                        self.totalCountLabel?.isEditable = false
                        self.totalCountLabel?.isSelectable = false
                        self.totalCountLabel?.textColor = .white
                        self.totalCountLabel?.font = NSFont(name: "Kailasa", size: 40)
                        
                        self.view.addSubview(self.totalCountLabel!)
                        
                
                        
                        let file = try NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
                        
                        
                        if(file.contains("13026724")) {
                            print("YES")
                        }
                    }
                    catch {
                        print("failed")
                    }
            }
            
            
            
        }
        //        AF.request("https://marketplace.bestbuy.ca/api/offers/export",parameters: ["api_key": "333281a3-8a7a-4cca-a415-f73f3089b8af"]).response {result in
        //            print(result)
        //        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @objc func offerButtonPressed(sender:NSButton) {
        
        NSAnimationContext.runAnimationGroup(){_ in

            NSAnimationContext.current.duration = 1.0
            
            self.background!.animator().alphaValue = 0.0
            self.offersButton!.animator().alphaValue = 0.0
            self.totalCountLabel?.animator().frame = NSRect(x: 20, y: self.view.frame.height - 120, width: self.offersButton!.frame.width, height: 107)
        }
        
    }
    
}

