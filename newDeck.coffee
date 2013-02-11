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

# Functions:
#square = (x) -> x * x

makeDeck = () -> 
  deck = []
  for suit in suits
    for cardName in cardNames
      deck.push([suit,cardName])