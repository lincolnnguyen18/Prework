# View Controller (delegate of text field)
### Properties and Setup
    Set outlets
    Initialize bill, tip, and tipPercentages
    Override viewDidLoad
        Call super
        Make view controller delegate of billAmountTextField
    Override touchesBegan
            End editing
### Text Field Delegate Actions
    Before billAmountTextField returns
        Hide keyboard
        Unwrap billAmountTextField value into bill
        Calculate tip
        Display tip and total
### Actions
    When tipControl is tapped
        Calculate tip
    Call updatelabels
### Navigation
    Override prepare(for:sender:) - source view controller for unwind segue
        Call super
### Private Methods
    updateLabels function
        Multiply bill with corresponding tip in tipPercentages using tipControl's selectedSegmentIndex as the array index
        Save sum of bill and tip in total constant
        Update tipAmountLabel and totalLabels

# Settings View Controller
### Properties and Setup
    Set outlets
    Override viewDidLoad
        Call super
        Set title of view
### Navigation
    unwindToSettings function - action method for destination view controller
        If source view controller can be downcasted into a MealViewController and its meal property is non-nil, store them into sourceViewController and meal
