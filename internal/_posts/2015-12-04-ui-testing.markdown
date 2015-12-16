---
layout: post
title:  "A Noob&apos;s Guide to Xcode UITesting"
date:   2015-12-04 17:04:40
author: Nicola Asamoah
categories: ios
image: images/blogs/ui-test.png
excerpt: "Beginner tips to writing UI tests in Xcode"
---

# A Noob’s Guide to Xcode UITesting

A while ago, I needed a new UI Test to verify the new user journey added into the app. I had already seen a couple tutorials and understood the concept of XCUIElementQuery (app.collectionViews does not retain a reference to an element on screen. However, `elementBoundByIndex` does). Tutorials were great but since UITesting is still in its infancy, there seemed to be an absence of quick FAQs. In no way is this a full technical guide to UITesting but it will list some helpful beginner tips. In reality, it’s very straightforward but there are a few (in hindsight glaringly obvious) principles to bear in mind.

The requirement was to get to the screen with the TableView, tap a disclosure and verify that screen is on the correct details screen. The first set of questions came to mind:

 1. How to refer to a disclosure programmatically?
 2. Inside a UITableViewCell, how to get the value/ text from the 1st UILabel?

### How to refer to a disclosure programmatically?
In hindsight, the question I was asking: How is this `<element>` picked up in a UITest?
The easiest way to find out which XCUIElement something is, is to record a test. Once the simulator is running, click around the full journey. Before stopping, click around other related elements. The exact test you’re planning may not be possible and you may have to adapt and take inspiration from attributes on nearby elements.

In particular, information disclosures display as buttons. A UITableViewCellAccessoryDetailDisclosureButton has a label "More Info,..."  therefore:
`tablesQuery.cells.elementAtIndex(0).buttons.elementMatchingPredicate(NSPredicate(format: "label BEGINSWITH[c] More")).tap()`


### How to get # element when there are one or more on screen
Cells/Buttons etc.. are all queries to return an array of elements at the time. Therefore, `elementBoundAtIndex(#)` or element must be called to perform a tap or inspect its properties. However, locating any element via its name or index is highly unstable. Refactor where possible and use accessibility identifiers the access elements via `elementMatchingType(identifier)`.


### How to verify that the `<element>` is correct one needed?
`debugDescription` is your friend. On any query at runtime, call `debugDescription` and inspect the labels/staticTexts and more.


### How to return the text/value of an element?
Calling `staticTexts` is the way to return the strings inside elements. Note, `staticTexts` is also a query so the needed element must be retrieved from it.

#### Multiple UILabels inside a Cell
This is the same as asking how to get text. If contains a string, it will be returned as an element in staticTexts- regardless of how complicated the view hierarchy may seem. Therefore, `cells.elementAtIndex(0).staticTexts.elementAtIndex(1).label` will return the second label inside the first cell.

#### What are all the actions that can be applied to an element?
Look at the Xcode documentation. That it really the best way to reinforce that:
1. XCUIElementQuery Cells/ Buttons/CollectionView behave no different from each other- the return type is always a query
2. The only methods that return strings are staticTexts, label and name. Therefore, only staticText is the only method that does not return debugging information.
3. All main user interactions are possible - from directional swipes to sliding up the tray


### Inside a UITableViewCell, how to get the value/ text from the 1st UILabel
Based on all the previous questions, this answer is now simple:
-Either via recording a test or looking at the document, a UITableViewCell will be returned in cells.
-To get the text, use staticTexts.
-To get the 1st label, set an identifier and access it by elementMatchingType

Therefore:
`Cells.elementMatchingType(.Any, identifier:"programTitleLabel")`

Good luck UITesting.


----------


Other useful reading:

-[WWDC UITesting](https://developer.apple.com/videos/play/wwdc2015-406/)

-[UI Testing with Xcode 7 and Swift Part 1](http://www.runtimecrash.com/2015/09/08/ui-testing-with-xcode-7-and-swift-part-1/)

-[UI Testing Cheat Sheet](https://github.com/joemasilotti/UI-Testing-Cheat-Sheet)

