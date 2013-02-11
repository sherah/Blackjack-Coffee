###
  This is how you define a class in coffeescript. Internally it does what
  Backbone.View.extend does.

  You need to explicitly define your class as a property of the global window
  object, because coffeescript is always executed in an anonymous function scope 
  instead of the global scope. 
  
  You can still normally access the class as BlackjackView everywhere, though.
###
class window.BlackjackView extends Backbone.View

  events:
    "click .hit-button": "hit"
    "click .stand-button": "stand"
    "click .reset-button": "reset"

  player:
    name: "player"
    cards: []
  dealer:
    name: "dealer"
    cards: []

  ###
    In the constructor you'll want to define the variables that contain the
    state of the game. Some examples that could be useful are already in there.

    Remember, in coffeescript you use an @ instead of this.
  ###
  initialize: ->
    # this is how you call a member function
    @reset()
      
  ###
    This function is meant to reset the game state whenever a new round starts.
  
    You'll probably want to set some instance properties, render 
  ###
  reset: ->
    #todo: fix shuffle
    @shuffledDeck = @makeDeck()
    @shuffledDeck = new Cards(@shuffledDeck.shuffle())
    console.log @shuffledDeck
    @deal()
  
  deal: ->
    @player.cards.push(@shuffledDeck.pop())
    @player.cards.push(@shuffledDeck.pop())
    @dealer.cards.push(@shuffledDeck.pop())
    @dealer.cards.push(@shuffledDeck.pop())

    $(".dealer-cards").html()
    $(".dealer-cards").append("<div class='card'>#{@dealer.cards[0].attributes.name} #{@dealer.cards[0].attributes.suit}</div>")
    $(".dealer-cards").append("<div class='card'>#{@dealer.cards[1].attributes.name} #{@dealer.cards[1].attributes.suit}</div>")
   
    $(".player-cards").append("<div class='card'>#{@player.cards[0].attributes.name} #{@player.cards[0].attributes.suit}</div>")
    $(".player-cards").append("<div class='card'>#{@player.cards[1].attributes.name} #{@player.cards[1].attributes.suit}</div>")


    #@hit()


    
  ###
    Give the player another card. If the player has 21, they lose. If they have
    21 points exactly, they win and if they have less than 21 points they can decide
    to hit or stand again.
  ###
  hit: ->
    #debugger
    @player.cards.push(@shuffledDeck.pop())
    $(".player-cards").html()
    $(".player-cards").append("<div class='card'>#{@player.card3.attributes.name} #{@player.card3.attributes.suit}</div>")
    console.log("yep it's running")
    @dealerHit()

  score: -> (cards)


  dealerHit: ->
    #if the current dealer score is under 16, hit again 
    

  ###
    Reveal the dealer's face down card. Give the dealer cards until they have 17
    points or more. If the dealer has over 21 points or the player has more points
    than the dealer (but less than 21), the player wins. 
  ###


  stand: ->
    alert "TOTO implement stand"

  makeDeck: ->
    suits = [
      'hearts'
      'spades'
      'diamonds'
      'clubs'
    ]

    cardNames = [
      2
      3
      4
      5
      6
      7
      8
      9
      10
      'Jack'
      'Queen'
      'King'
      'Ace'
    ]

    deck = new Cards
    for suit in suits
      for cardName in cardNames
        deck.add new Card({name:cardName, suit:suit})

    return deck

class window.Deck extends Backbone.Collection.extend({
  model: Card
});
