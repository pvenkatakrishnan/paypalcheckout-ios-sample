# webview-sample

This is a sample application that can be used for Demoing and Development of the `Native Checkout` iOS SDK. 


# Getting Started

* Clone this Repo
* Run `pod install` to fetch the paypalnativecheckout-ios library
* Open webview-sample project (webview-sample.xcworkspace)
* You should see `Nativecheckout.framework` pod under the `Pods` folder automatically setup as dependency to work with the `webview-sample` project

You should now be able to run the project out of the box. The project may connect to the production server and pull
down a production bundle. 

# The Experiance

The experiance is driven by React-Native. The iOS SDK takes care of integrating with the merchant app (this sample), and 
provides integration points for the React-Native bundle. 

