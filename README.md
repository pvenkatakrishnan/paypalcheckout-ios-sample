# webview-sample

This is a sample application that can be used for Demoing and Development of the `Native Checkout` iOS SDK. 


# Getting Started

* Clone this Repo
* Run `git submodule init && git submodule update` to grab the iOS SDK Submodule in this repo
* Open webview-sample project (there is no longer a workspace)
* You should find NativeCheckout.xcodeproj attached to the WebView-Sample project under the Frameworks group in xCode.

You should now be able to run the project out of the box. The project may connect to the production server and pull
down a production bundle. 

# The Experiance

The experiance is driven by React-Native. The iOS SDK takes care of integrating with the merchant app (this sample), and 
provides integration points for the React-Native bundle. 

To make alterations to the experiance, you should also obtain the React-Native project repo. https://github.paypal.com/nativexo/native-checkout

Using this repo, you can start the React-Native development server, and point the SDK to load development experiance from there.
