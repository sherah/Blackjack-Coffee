describe "", ->
  
  it "should should be reasonable", ->
    expect(true).toBe(true)

describe "", ->
  testView = new BlackjackView()
  it "should have 52 cards", ->
    console.log testView
    testDeck = testView.makeDeck()
    expect(testDeck.length).toEqual(52)

describe "", ->
  testView = new BlackjackView()
  it "should give player a card", ->
    expect(testView.player.card1).toBeTruthy()

