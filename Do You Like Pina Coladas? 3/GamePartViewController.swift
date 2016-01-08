//
//  GamePartViewController.swift
//  Do You Like Pina Coladas? 3
//
//  Created by TSoto1 on 12/20/15.
//  Copyright (c) 2015 TSoto1. All rights reserved.
//

import UIKit

class GamePartViewController: UIViewController
{
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var time = Int()
    var theScore = Int()
    var clock = NSTimer()
    
    // connected the timer label and score label. Created two interger variables that later become the text for the labels, also created the timer variable
    
    @IBOutlet weak var imageView: UIImageView!
    // connected the image view
    
    var umbrella : UIImage = UIImage(named: "umbrella")!
    var cherry : UIImage = UIImage(named: "cherry")!
    var virginRum : UIImage = UIImage(named: "non-alchoholic rum")!
    var coconut : UIImage = UIImage(named: "coconut")!
    var pineapple : UIImage = UIImage(named: "pineapple")!
    
    var badApple : UIImage = UIImage(named: "apple")!
    var badPear : UIImage = UIImage(named: "pear")!
    var badLime : UIImage = UIImage(named: "lime")!
    var badUmbrella : UIImage = UIImage(named: "bad umbrella")!
    var badLemon : UIImage = UIImage(named: "lemon")!
    // created a variable for each image
    
    var ingredients: [UIImage] = []
    var nextRandomImage = UIImage()
    // created an empty array that is used later along with a variable
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.startGame()
        self.makeArray()
        // runs the "startGame" and "makeArray" functions when the view loads
     
        
    
    }

    
    func startGame()
    {
        time = 60
        timerLabel.text = "\(time)"
        // sets the time variable to 60 and makes the timerLabel text equal the time variable
        
        theScore = 0
        scoreLabel.text = "\(theScore)"
        // sets the score variable to 0 and makes the scoreLabel text equal the score variable
        
        clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
        // sets the clock variable so that every second it runs the "countdown" function
    }
    
    func countdown()
    {
        --time
        timerLabel.text = "\(time)"
        // subtracts one from the time variable
        
        if time == 0
        {
            self.gameOver()
            print("game over")
        }
    }
    
    
    
    func makeArray()
    {
        ingredients.append(umbrella)
        ingredients.append(cherry)
        ingredients.append(virginRum)
        ingredients.append(coconut)
        ingredients.append(pineapple)
        ingredients.append(badApple)
        ingredients.append(badPear)
        ingredients.append(badLime)
        ingredients.append(badUmbrella)
        ingredients.append(badLemon)
        // adds all of the variables created at the begging to the ingredients array
        
        let nextRandomImage = Int(arc4random_uniform(UInt32(ingredients.count)))
            imageView.image = ingredients[nextRandomImage]
        // randomizes the array
    }

    
    
    
    @IBAction func yesButton(sender: AnyObject)
    {
        if imageView.image == umbrella || imageView.image == cherry || imageView.image == virginRum || imageView.image == coconut || imageView.image == pineapple
        {
            theScore = theScore + 20
            scoreLabel.text = "\(theScore)"
            view.backgroundColor = UIColor.cyanColor()
            // checks to see if the proper button was hit for the image displayed and then adds points to "theScore" variable
        }
        
        if imageView.image == badApple || imageView.image == badPear || imageView.image == badLime || imageView.image == badUmbrella || imageView.image == badLemon
        {
            theScore = theScore - 40
            scoreLabel.text = "\(theScore)"
            view.backgroundColor = UIColor.redColor()
            // checks to see if the proper button was hit for the image displayed and then subtracts points to "theScore" variable
        }
        
        makeArray()
        
            }
    
    @IBAction func noButton(sender: AnyObject)
    {
        if imageView.image == umbrella || imageView.image == cherry || imageView.image == virginRum || imageView.image == coconut || imageView.image == pineapple
        {
            theScore = theScore - 40
            scoreLabel.text = "\(theScore)"
            view.backgroundColor = UIColor.redColor()
            // checks to see if the proper button was hit for the image displayed and then subtracts points to "theScore" variable
            
        }
        
        if imageView.image == badApple || imageView.image == badPear || imageView.image == badLime || imageView.image == badUmbrella || imageView.image == badLemon
        {
            theScore = theScore + 20
            scoreLabel.text = "\(theScore)"
            view.backgroundColor = UIColor.cyanColor()
            // checks to see if the proper button was hit for the image displayed and then adds points to "theScore" variable
        }
        
        makeArray()
    }
    
    
    func gameOver()
    {
        
        let alert = UIAlertController(title: "Times Up!", message: "Congrats! Your score was \(theScore)! Rupert Holmes would be proud!", preferredStyle: UIAlertControllerStyle.Alert)
        // creates the alert that pops up
        
        presentViewController(alert, animated: true, completion: nil)
        // shows the alert
        
        let resetGame = UIAlertAction(title: "Play Again?", style: UIAlertActionStyle.Default, handler: {sender in self.time = 60
            self.theScore = 60
            self.imageView.image = self.coconut})
        
        // creates the resetGame action
        
        alert.addAction(resetGame)
        // adds the resetGame action to the alert
    }
}

