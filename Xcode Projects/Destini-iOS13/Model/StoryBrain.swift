    //
    //  StoryBrain.swift
    //  Destini-iOS13
    //
    //  Created by Angela Yu on 08/08/2019.
    //  Copyright © 2019 The App Brewery. All rights reserved.
    //
    
    import Foundation
    
    struct StoryBrain {
        
        var storyNumber = 0
        
        let stories = [
            Story(
                title: "AMONG US! You start off the round, in Skeld, going to the left to instantly get on cams and see red (always sus) acting suspcious in front of admin going in and out not doing his task. What do you do?",
                choice1: "Run to the button to try and get him out before the first sabotage!", choice1Destination: 2,
                choice2: "Stay on cams and just wait until something actually happen", choice2Destination: 1
            ),
            Story(
                title: "OH NO! The lights turn off and you see no one around you. What do you do?",
                choice1: "Book it to lights without hesitation", choice1Destination: 2,
                choice2: "Stay on cams for an alibi", choice2Destination: 3
            ),
            Story(
                title: "You find a dead body somewhere but you can't seem to spot it on your screen",
                choice1: "REPORT!", choice1Destination: 5,
                choice2: "Look around to see if you can spot any colors walking away.", choice2Destination: 4
            ),
            Story(
                title: "(VENTS) POP. You notice that someone came out of vents but it is too late you have been killed by RED",
                choice1: "The", choice1Destination: 0,
                choice2: "End", choice2Destination: 0
            ),
            Story(
                title: "You can't find anyone but before you could report the body. BLUE walks up from admin and sees you. Everyone throws sus on you and you get voted out. PLAYER is not An Imposter!",
                choice1: "The", choice1Destination: 0,
                choice2: "End", choice2Destination: 0
            ),
            Story(
                title: "MEETING STARTED! You first tell everyone that red is super sus and that the body is in cafeteria. Pink and Red both says that it must be a self report since most of the people are in electrical. PLAYER is not An Imposter!",
                choice1: "The", choice1Destination: 0,
                choice2: "End", choice2Destination: 0
            )
        ]
        
        func getStoryTitle() -> String {
            return stories[storyNumber].title
        }
        
        func getChoice1() -> String {
            return stories[storyNumber].choice1
        }
        
        func getChoice2() -> String {
            return stories[storyNumber].choice2
        }
        
        mutating func nextStory(userChoice: String) {
            
            let currentStory = stories[storyNumber]
            if userChoice == currentStory.choice1 {
                storyNumber = currentStory.choice1Destination
            } else if userChoice == currentStory.choice2 {
                storyNumber = currentStory.choice2Destination
            }
        }
        
    }
    
    
