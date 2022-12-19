# 100 Days of Swift

https://www.hackingwithswift.com/100/swiftui

## 100 days of swift
    2022-11-01 - Days 1-4
    2022-11-02 - Days 5-7.3
    2022-11-03 - Days 7.4-9.1

## 100 days of swiftUI
    2022-11-04 Day 10-15
    2022-11-05 Day 16-17
    2022-11-06 Day 18-19
    2022-11-07 Day 20.1-20.3
    2022-11-08 Day 20.4-22


## Day 16-18 WeSplit
Form, NavigationView, @State, @FocusState, Picker, TextField, ForEach


## Day 19 Challenge Day - Unit Converter

Let's do temperature conversion between Celsius, Fahrenheit, and Kelvin

I could just have 3 fields, one for each unit, and update them live whenever you enter new values.

Interface
- big Unit Converter title at the top
- 1 input TextField view
- 1 picker view for input
- 1 picker view for output
- 1 output Text view
- maybe switch to 3 text input fields with live updating

Technical details
- Underlying store in celsius or kelvin
- iOS 15.5
- 

### Notes
The instructions strongly suggested I use an array to store the conversion types. I missed that and used an enum. Combining enum with ForEach was  a bit of a yak-shave.
Foundation Units and Measurement would be a better way to do the conversions.
I couldn't figure out how to customize Double.formatted(), so I left it as the default with no arguments.

- had to set deployment target to iOS 15.5 because that's what I have downloaded for the simulator

## Day 20 Guess the Flag
HStack, VStack, ZStack, Image, LinearGradient

## Day 23 Views and Modifiers

View composition with

    struct Foo: View { 
        var body: some View Text("foo") 
    }

View Modifier with

    struct Foo: ViewModifier { 
        func body(content: c) -> some View { content.clipShape(Capsule()) } 
    }

Custom container with

    struct Foo<Content: View>: View {
        let number: Int
        let content: (Int) -> Content
        var body: some View { content(number) }
    }

    // use in ContentView body:
    Foo(number: 1) { element in
        Text(element)
    }

## Day 25 Rock Paper Scissors

Requirements
- randomly select win or lose for the first move of the game
- game is 10 turns
- each turn
    - game chooses a move
    - game alternates between asking for win and lose
    - correct answer gains a point, incorrect loses a point
- show score after 10th turn

User Interface
- VStack
    - player's score
    - app's move
    - win or lose
    - move buttons
- alert to show score at end of game
- improvement ideas
    - make the move a ZStack with the name superimposed over a big emoji or image
        - maybe just a lozenge button would look better
    - 

Technical
- property to store possible moves
- properties for the app's current choice and win/lose
- use `toggle()` to switch win/lose for each turn

How do we calculate which moves are winners and which moves are losers?
- using the hint to store winning and losing moves in parallel arrays - I might have gone for a dictionary here

## Day 26 BetterRest
Stepper, DatePicker, DateFormatter, CreateML.app

## Day 27 BetterRest
Stepper, DatePicker, DateFormatter

## Day 29 Word Scramble
List, Bundle.main.url(forResource:), UITextChecker, NSRange, NSNotFound
onAppear(), fatalError()

## Day 30 Word Scramble
withAnimation(), .autocapitalization(.none), .onSubmit, fatalError(), .onAppear(perform:)

## Day 32 Animations
* implicit animation
* explicit animation
* `withAnimation() {}`

## Day 33 Animations
* multiple animations, gesture animations, transitions
* .offset, .gesture, DragGesture().onChanged/.onEnded, CGSize.zero
* `.transition(.asymmentric ...)`

## Day 34 Update Guess the Flag with Animations
- TODO: try using transition(.asymmetric) so the flag flips on tap, but cross fades for the next round
- I used explicit withAnimation{}, but the HWS+ solution used implicit .animation()
- I subscribed to HWS+

## Day 35 Consolidation III - Challenge - Times Tables
- select multiplication tables from 2 to 12
- select how many questions to solve: 5, 10, 20
- generate questions within the difficulty range

### Basic UI
- game setup
    - stepper for highest operand
    - horizontal chooser for number of questions
    - Begin button -> present first question
- present question
    - What is _ x _ ?
    - numeric keyboard
    - OK button -> question result
- question result
    - Correct! / Sorry.
    - _ x _ is +
    - OK button -> present next question or game summary
- game summary
    - you got _ of _ correct
    - "Play again" button -> game setup

## Day 36 iExpense
    @StateObject, @ObservedObject @EnvironmentObject
    @Published
    .sheet(isPresented:) {}
    ForEach.onDelete(perform:)
    UserDefaults, @AppStorage
    Codable protocol
    IndexSet

## Day 37 iExpense
* Building a list we can delete from
    * Expenses class
        * ObservableObject protocol
        * @Published used when creating items array
        * @StateObject ... = Expenses()
    * ExpenseItem struct
    * atOffsets: IndexSet
    * .onDelete()
* Working with Identifiable items in SwiftUI
    * UUID()
    * Identifiable protocol
* Sharing an observed object with a new view
    * @ObservedObject
    * Fixing the AddView PreviewProvider
* Making changes permanent with UserDefaults
    * ExpenseItem is Codable
    * Expenses.init() loads from UserDefaults
    * change id to a var to get rid of a warning 🤷
* Final polish
    * @Environment(\.dismiss) to access dismiss()
    * make the list items more useful

## Day 38 - iExpense Wrap up
On reading the solution article:
- I could do the currency code from memory
- I should make the amount style a View protocol extension because it could be useful in other views for this app.
- splitting personal and business
    - I had the same items.filter{} strategy
        - but I made it the responsibility of the view rather than making two properties on the Expenses class
    - I know that I should remove items by searching for them, rather than based on index
    - I guess I'm surprised that ExpenseItem isn't Equatable
    - a separate delete function for each type seems like a code smell


## Day 39 - Moonshot
GeometryReader, ScrollView, NavigationLink
* Resizing images to fit the screen using GeometryReader
    * .clipped
    * .scaleToFit() .scaleToFill()
    * GeometryReader - aligned to top left corner by default
    * inside GeoRea.., nest two frames to center the content: .frame(width: geo.size.width, height: geo.size.height)
* How ScrollView lets us work with scrolling data
    * ScrollView ... (.vertical | .horizontal) with HStack or VStack
    * Lazy( H | V )Stack - are "greedy" with layout space and will try to grow to infinity, vs regular stacks that are only as large as they need to be.
* Pushing new views onto the stack using NavigationLink
    * NavigationView
        * NavigationLink { detail view } label: { link label }
* Working with hierarchical Codable data
    * Codable
    * Each data type must be Codable
    * JSON property names must match swift property names
* How to lay out views in a scrolling grid
    * ScrollView > LazyVGrid(columns: layout) { grid item content }
    * layout: GridItem(.fixed or .adaptive with size constraints)

## Day 40 - Moonshot
* Loading a specific kind of Codable data
    * extension Bundle.main.decode(filename)
    * decode() extension returns a fixed type of [String: Astronaut]
* Using generics to load any kind of Codable data
    * update decode to have an associated type T that conforms to the Codable protocol
    * add a type hint at the point of use, ie: let missions: [Mission] = Bundle.main.decode(...)
* Formatting our mission view
    * put custom string properties on Mission like the model pattern
    * Use LazyVGrid
    * JSONDecoder().dateDecodingStrategy = .formatted(DateFormatter().dateFormat = strftimeTemplate)
    * change launchDate from String to Date so Codable and JSONdecoder know what to do with it
    * for some reason, extend ShapeStyle where Self == Color to have some custom color properties. I guess you can also put them in the asset catalog, but that's harder to version control. Maybe it should be in a sub struct like Color.Local or prefix the property names with something app-specific like .moonshotDarkBackground . 
    * and then a bunch of padding and formatting to make the grid view nicer
    * .overlay(Shape().stroke()) to create a frame around something
    * make the nav title white by doing ScrollView {}.preferredColorScheme(.dark)

## Day 41 - Moonshot
* Showing mission details with ScrollView and GeometryReader
    * use GeometryReader to size mission.image
    * SwiftUI Preview needs
        * sample data
        * .preferredColorScheme() because the preview pane doesn't know that the previous view already has that set
* Merging Codable structs
    * MissionView.init() populates crew: [CrewMember] with astronauts from the mission.crew name/role list
    * update Preview setup to populate astronauts
    * still need to do some styling 
        * of the crew list - card around each crew member to visually separate them? - might have to put a georeader around each one to get the size I want
            * I ended up splitting the .padding(.horizontal) into .padding(.trailing) .background(Color) .clipShape(Capsule()) .padding(.leading) to make the capsule shaped background that I wanted.
* Finishing up with one last view

## Day 42 - Moonshot: Wrap up

1. Add the launch date to MissionView, below the mission badge. You might choose to format this differently given that more space is available, but it’s down to you.
2. Extract one or two pieces of view code into their own new SwiftUI views – the horizontal scroll view in MissionView is a great candidate, but if you followed my styling then you could also move the Rectangle dividers out too.
    - crew members view
3. For a tough challenge, add a toolbar item to ContentView that toggles between showing missions as a grid and as a list.
    - I just did a version with LazyVStack, but I think the desired implementation uses a List
    - I read the HWS+ solution, and my version was basically the same.
    - I added a default opacity animation between list and grid
    - my ideal experience would have the mission summary items animate between list and grid with each item translating to its new location
    - there is still lots of redundancy between the two views
    - early on I considered just making the gridItem 100% wide to act like a list row. maybe that's the easy way to get the translation animation to work

## Day 43 - 9.1 Drawing
* Drawing: Introduction
* Creating custom paths with SwiftUI
    * Path { path in }
        * path.move(), path.addLine()
        * path.closeSubpath()
    * .stroke(style: StrokeStyle(lineWidth, lineCap, lineJoin))
* Paths vs shapes in SwiftUI
    * protocol Shape { func path() -> Path }
    * Path.addArc()
    * swiftui drawing geometry:
        * coordinate plane is flipped vertically, so +y is down, +x is right, -y is up, -x is left
        * 0 degrees points to the right
        * coordinates are measured from bottom-left(?) I don't think this is right
        * clockwise appears to be counterclockwise because clockwise goes from the positive y-axis to the positive x-axis. if the origin is in the upper-left, then positive y is down and positive x is to the left, so the arc is really counterclockwise.
* Adding strokeBorder() support with InsettableShape
    * .stroke() draws a line centered on the edge of a shape
    * .strokeBorder() draws the line offset so that it is contained within the shape and does not leave the shape's border
        * available when something conforms to the InsettableShape protocol

## Day 44 - 9.2 Drawing
* Transforming shapes using CGAffineTransform and even-odd fills
    * `stride(from: to: by:)`
    * `CGAffineTransform(rotationAngle:, translationX:, y: )`
    * `FillStyle(eoFill: true)`
* Creative borders and fills using ImagePaint
    * `ImagePaint(image: scale:)`
    * works as `background`, `stroke`, `border`, `fill`
* Enabling high-performance Metal rendering with drawingGroup()
    * `drawingGroup()` modifier

## Day 45 - 9.3 Drawing
* [Special effects in SwiftUI: blurs, blending, and more](https://www.hackingwithswift.com/books/ios-swiftui/special-effects-in-swiftui-blurs-blending-and-more)
    * an `Image` and `shape.fill(.red).blendMode(.multiply)` in a `VSTack` is equivalent to just `image.colorMultiply(.red)`
    * `.blendMode`
      * `.normal`
      * `.multiply`
      * `.screen`
* [Animating simple shapes with animatableData](https://www.hackingwithswift.com/books/ios-swiftui/animating-simple-shapes-with-animatabledata)
    * `withAnimation {}` isn't animating the trapezoid offset change
    * to make a view animatable, you have to give it an `animatableData` computed property, then `withAnimation` will work
* [Animating complex shapes with AnimatablePair](https://www.hackingwithswift.com/books/ios-swiftui/animating-complex-shapes-with-animatablepair)
    * `animatableData` is a single property, but what if we want to animate more than one value?
    * using `var animatableData: AnimatablePair<Double, CGFloat>` let's us animate a pair of values
    * to animate more that two values, treat AnimatablePair like a cons cell from LISP: `AnimatablePair<Double, AnimatablePair<Foo, AnimatablePair<Bar, Baz>>>`
      * access the value of type `Bar` with `newValue.second.second.first`
* [Creating a spirograph with SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/creating-a-spirograph-with-swiftui)

## Day 46 - 9.4 Drawing: Wrap up

2022-12-08

### Challenge - Draw an Arrow

1. Create an Arrow shape – having it point straight up is fine. This could be a rectangle/triangle-style arrow, or perhaps three lines, or maybe something else depending on what kind of arrow you want to draw.
    * `struct Arrow: Shape`
    * Draw a triangle and rectangle using `Path`
    * Conform to `InsettableShape` with `inset(by:)`
    * Maybe I should be using a `GeometryReader` instead of calculalting things manually?
2. Make the line thickness of your Arrow shape animatable.
    * Make `insetAmount` available via `animatableData` property.
3. Create a ColorCyclingRectangle shape that is the rectangular cousin of ColorCyclingCircle, allowing us to control the position of the gradient using one or more properties.
    * Just copy `ColorCyclingCircle` and replace `Circle` with `Rectangle`
    * Make `LinearGradient` startPoint and endPoint controllable.

## Day 47
- [What you learned](https://www.hackingwithswift.com/guide/ios-swiftui/4/1/what-you-learned)
- [Key points](https://www.hackingwithswift.com/guide/ios-swiftui/4/2/key-points)
- [Challenge](https://www.hackingwithswift.com/guide/ios-swiftui/4/3/challenge)

### There should be:
- (p1) a list of all activities they want to track, 
  - (p2) tapping one of the activities should show a detail screen with the description
    - (p2) make that detail screen contain how many times they have completed it, 
    - (p2) plus a button incrementing their completion count
- (p1) plus a form to add new activities – 
  - a title and 
  - description should be enough
- (p3) use Codable and UserDefaults to load and save all your data

### UI
- `ContentView`
  - `@StateObject` `Activities()`
  - `@State` `sheetIsShowing`
  - `NavigationView`
    - `ScrollView`
      - `ForEach` of activities
        - activity row view
          - activity name
          - `NavigationLink` to activity detail view
    - `sheet` for new activities
      - name
      - description
      - done button

### Data
- `struct` Activity
  - fields
    - name
    - description
    - completionCount
  - protocols
    - `Identifiable` for `ForEach`
    - `Equatable` for `indexOf(at:)`
    - `Codable` for storing in `UserDefaults`
- `class` Activities
  - fields
    - activities: `[Activity]`
  - protocols
    - `ObservableObject` for `@StateObject`/`@ObservedObject` and `@Published`


## Day 49 - Project 10 Part 1 - Cupcake Corner

`Codable`, `URLSession`, `disabled()` modifier

- Cupcake Corner: Introduction
- [Adding Codable conformance for @Published properties](https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties)
  - `Codable` doesn't automatically support property wrappers
  - to conform to `Codable`
    - `enum CodingKeys: CodingKey { case name }`
    - `required init(from decoder: Decoder)`
    - `func encode(to encoder: Encoder)`
- [Sending and receiving Codable data with URLSession and SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui)
  - async/await
  - `.task {}` view modifier
  - loadData()
    - build URL with `URL(string:)`
    - fetch `(data, _)` with `try await URLSession.shared.data(from:)`
    - decode with `JSONDecoder`
- [Loading an image from a remote server](https://www.hackingwithswift.com/books/ios-swiftui/loading-an-image-from-a-remote-server)
  - You can't apply view modifiers to an `AsyncImage`. Instead, apply them in the `content` closure.
  - `AsyncImage(url:)`
  - `AsyncImage(url:, scale:)`
  - `AsyncImage(url:, content:, placeholder:) { image in } placeholder: {}`
  - `AsyncImage(url:, scale:, transaction:, content:) { phase in }`
    - `phase.image`
    - `phase.error`
  - `ProgressView()` animated progress indicator
- [Validating and disabling forms](https://www.hackingwithswift.com/books/ios-swiftui/validating-and-disabling-forms)
  - Apply `.disabled(Bool)` view modifier to `Button()`

## [Day 50 - Project 10 Part 2 - Cupcake Corner](https://www.hackingwithswift.com/100/swiftui/50)
- Taking basic order details
  - `class Order: ObservableObject`
  - `$order.specialRequestEnabled.animation()`
    - `$`binding -> `@Published` property -> `.animation()` implicit view modifier
  - use computed property with `didSet` to reset sprinkles and frosting when turning off specialRequest
- Checking for a valid address
  - `Order#hasValidAddress: Bool`
  - `Section.disabled {order.hasValidAddress == false}`
  - SwiftUI Preview of a subview: Add `NavigationView` to make `navigationTitle` display
- Preparing for checkout
  - set the cupcake price by position in the type array
  - `CheckoutView`
    - The image is 699 pixels tall so that it can be evenly divided by 3.
    - Reserve some space for the image so the layout doesn't jump around when replacing the placeholder ProgressView
      - `AsyncImage(url:, scale: 3).frame(height:233)`

## [Day 51 – Project 10 part 3 - Cupcake Corner](https://www.hackingwithswift.com/100/swiftui/51)
- Encoding an ObservableObject class
  - `Codable` protocol wants definitions for
    - `enum Foo: CodingKey`
    - `encode(to:)`
    - `required init(from:)`
  - and then we don't get to use the struct-synthesized initializer because we've definied our own, so we make an empty `init() {}`
- Sending and receiving orders over the internet
  - `func placeOrder() async …`
  - `Button()` can't directly execute an async function
  - so we make a detatched(?) `Task`
    - `Button("…") { Task { await placeOrder() } }`
  - `placeOrder()`
    - `URLRequest`
      - `.setValue()`
      - `.httpMethod`
    - `URLSession.shared.upload(for:from:)`
    - decode the response
    - update confirmation method and show alert

## [Day 52 - Project 10 part 4 - Cupcake Corner: Wrap up](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-wrap-up)
- Challenge
  1. Improve the address validation to make sure a string of pure whitespace is invalid.
     - `.trimmingCharacters(in: .whitespaces)`
     - DRY up the big boolean expression by looping over the fields and applying the same test to each one
       - This loop might not be as fast as a boolean expression, but the loop is less error-prone for this validation.
  2. Show an alert if our call to `placeOrder()` fails.
     - add an alert()
     - put `showingOrderError = true` in the `catch` block
  3. Convert `Order` to a `struct` and wrap it in an `ObservableObject` `class`. This will make `Codable` conformance simpler.
      - `Codable` conformance is much easier, but now every View has to know about OrderWrapper's implementation.
- HWS+ Solutions:
  - Print the URLSession error in the catch block
  - use `@dynamicMemberLookup` with `subscript()` implementations to get rid of all of the `orderWrapper.order.` business. It reminds me of Ruby's `method_missing()`.
  - KeyPath finally pays off

## [Day 53 - Project 11 part 1 - Bookworm](https://www.hackingwithswift.com/100/swiftui/53)
- Bookworm: Introduction
- Creating a custom component with @Binding
  - [JARED SINCLAIR - When Should I Use @State, @Binding, @ObservedObject, @EnvironmentObject, or @Environment?](https://jaredsinclair.com/2020/05/07/swiftui-cheat-sheet.html)
  - Use `@State` when your view needs to mutate one of its own properties.
  - Use `@Binding` when your view needs to mutate a property owned by an ancestor view, or owned by an observable object that an ancestor has a reference to.
- Accepting multi-line text input with TextEditor
  - `@AppStorage` wrapper - is backed by `UserDefaults`
  - `TextEditor(text:)`
- How to combine Core Data and SwiftUI
  - `DataController: ObservableObject`
    - `NSPersistentContainer(name:)` persists data for the given model
    - `init() { container.loadPersistentStores }`
  - `BookwormApp: App`
    - `@StateObject private var dataController = DataController()` instantiate controller
    - `ContentView().environment(\.managedObjectContext, dataController.container.viewContext)` make it available to the main view
  - `ContentView: View`
    - `@Environment(\.managedObjectContext) var moc` provides a way to operate on the managed objects (ie `moc.save()`)
    - `@FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>` makes data from Student model available
    - properties of `student` are all optional, so we'll do a bunch of nil coalescing for now
    - 

## [Day 54 - Project 11, part 2 - Bookworm](https://www.hackingwithswift.com/100/swiftui/54)
- Creating books with Core Data
  - `let newBook = Book(context: moc)` create a new instance of the model
  - then set its properties
  - then save it with `moc.save()`
- Adding a custom star rating component
  - `RatingView` w/ `@Binding` for the rating value
  - Tell the previews to use a static value with `.constant(4)`
  - we create an image function to calculate the image shape for each star, but we put the color logic inline in the .foregroundColor(…) 🤷
- Building a list with @FetchRequest
  - Make an EmojiRatingView that takes `rating: Int16` because CoreData will be giving us an Int16
    - use a switch statement in the example
    - it only supports custom rating emojis for 1-5, higher than 5 just shows the 5th emoji
    - it should be initialized with an take an array of emojis so it can support any rating value
  - CoreData objects conform to `Identifiable`

## [Day 55 - Project 11, part 3 - Bookworm](https://www.hackingwithswift.com/100/swiftui/55)
- Showing book details
  - use `.constant()` to make the `RatingView` read-only
- Sorting fetch requests with `SortDescriptor`
  - `SortDescriptor(\.title, order: .reverse)`
- Deleting from a Core Data fetch request
  - `ForEach {}` `.onDelete(perform:)`
  - `managedObjectContext.delete(book)`
  - `managedObjectContext.save()`
- Using an alert to pop a `NavigationLink` programmatically
  - Use `dismiss()` to pop the NavigationLink
  - Use the `@Environment` wrapper to include `\.dismiss` and `.managedObjectContext` in `DetailView`
  - `.alert` buttons with roles `.destructive` and `.cancel`
  - put a trash icon in the toolbar

## [Day 6 - Project 11, part 4 - Bookworm](https://www.hackingwithswift.com/100/swiftui/56)
- our custom view doesn't support accessibility features
- Right now it’s possible to select no title, author, or genre for books, which causes a problem for the detail view. Please fix this, either by forcing defaults, validating the form, or showing a default picture for unknown genres – you can choose.
  - I'm putting the validation logic in `AddBookView`, like we did with CupcakeCorner.
  - I think the validation should live with the data: In the core data model itself, or in some kind of controller.
- Modify ContentView so that books rated as 1 star are highlighted somehow, such as having their name shown in red.
  - tried to add a `LinearGradient` to the list item using a `ZStack`, but I couldn't get it to cover the whole background.
- Add a new “date” attribute to the Book entity, assigning Date.now to it so it gets the current date and time, then format that nicely somewhere in DetailView.
  - might be nicer to make this "days/weeks/months/years ago"

## [Day 57 – Project 12, part one](https://www.hackingwithswift.com/100/swiftui/57)
- Core Data: Introduction
- Why does `\.self` work for `ForEach`?
  - `Hashable`
  - CoreData assigns its own objectId
  - hash values calculated between two runs of the app might be different
- Creating `NSManagedObject` subclasses
  - Inspectors > Data Model > Codegen: Manual/None
  - Editor > Create NSManagedObject Subclass
    - CoreDataProject > Next
    - Movie > Next
    - Select CoreDataProject folder > Create
  - You may add nil-coalescing computed properties to `extension Movie`
- Conditional saving of `NSManagedObjectContext`
  - `if movie.hasChanges { try? moc.save() }`
  - `if moc.hasChanges { try? moc.save() }`
- Ensuring Core Data objects are unique using constraints
  - Data Model Inspector with Entity highlighted > Constraints
  - `DataController`
    - `self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump`
      - Merging a bunch of objects seems like a smell. I look forward to seeing an example where this makes sense.

## [Day 58 – Project 12, part two](https://www.hackingwithswift.com/100/swiftui/58)
- Filtering @FetchRequest using NSPredicate
  - `NSPredicate(format: "universe == %@", "Star Wars")`
  - `NSPredicate(format: "name < %@)`
  - `NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])`
  - `BEGINSWITH`
  - `ENDSWITH`
  - `NOT`
  - `CONTAINS`
  - `[c]` case insensitive modifier
- Dynamically filtering @FetchRequest with SwiftUI
  - To update the fetch request with new predicates
    - create a new `FilteredList` view with `init(filter: String)`
      - the init body is: `_fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))`
    - then show it with `FilteredList(filter: lastNameFilter)`
  - Make the `FilteredList` view generic
    - `Singer` -> `T: NSManagedObject`
    - key name
      - `%K` will insert an argument without adding single quotes around it: `NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)`
    - closure to configure the view
      - now we pass a closure to `FilteredList` with an explicit type: `{ (singer: Singer) in … }`
- One-to-many relationships with Core Data, SwiftUI, and @FetchRequest

## [Day 59 – Project 12, part three](https://www.hackingwithswift.com/100/swiftui/59)
All three of these tasks require you to modify the FilteredList view we made:

- Make it accept a string parameter that controls which predicate is applied. You can use Swift’s string interpolation to place this in the predicate.
  - using `%@` doesn't work. you have to use string interpolation as suggested.
- Modify the predicate string parameter to be an enum such as .beginsWith, then make that enum get resolved to a string inside the initializer.
  - I made the enum `String, CaseIterable, Identifiable` to make it work in `ForEach` and make the case values strings.
  - I just had to use `.rawValue` to get it to display in a `Text()`
  - I didn't have to do anything special for the value to get resolved to a string.
- Make FilteredList accept an array of `SortDescriptor` objects to get used in its fetch request.
  - This ended up a bit messy since I'm only using one `SortDescriptor`, but `FilteredList` definitely takes an array of them.

