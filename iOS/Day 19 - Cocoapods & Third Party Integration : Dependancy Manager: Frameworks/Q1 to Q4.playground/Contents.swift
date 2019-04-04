import UIKit

var str = "Hello, playground"


/*
 
 
 1. Explain the pod integration cycle.
 
 The integration cycle of pod follows the following steps:
 
  Step 1: Installation of POD
    sudo gem install cocoapods
 
  Step 2: Then we have to go to root directory in the terminal and enter the command
    pod init
 
  Step 3: Then go to Podfile present in our project directory and run the following command
 pod 'PODNAME', '~> VERSION'
 
 Step 4: Then run the following command
  pod install
 
 Step 5: Then after that its time to update the pod when its available run the following command
  pod update PODNAME
 
 2. How to update only a single pod.
 
 Run the command below on terminal:
    pod update PodName
 
 3. Delete a pod from project.
 
 Following are the ways to delete pod:
 
 Way 1: Cocoapods-Deintegrate plugin
 pod deintegrate
 
 Way 2: Cocoapods-clean plugin
 pod clean
 rm podFile
 
 4. Update to a particular lib version
 
 pod update 'PODNAME', 'Version'
 
 
 */
