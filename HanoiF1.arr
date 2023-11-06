use context essentials2021
import reactors as R
import image as I
include world
include lists


#En enkel representasjon av en pinne med ringer i spillet Hanoi Tårnet
fun create-pin(rings):
  stack(rings) # stack er en fiktiv funksjon som plasserer ringene i en stabel
end

#Initialiserer spillet med 4 ringer på pinne 1
fun initialize-game():
  pin1 = create-pin([list: 4, 3, 2, 1]) 
  # En liste med 4 ringer, største (4) nederst
  pin2 = create-pin([list: ])
  pin3 = create-pin([list: ])
  [list: pin1, pin2, pin3]
end

error1 = "Ingen ringer å flytte fra pinne "
error2 = "Kan ikke plassere en større ring på en mindre ring"
error3 = "Index out of bounds: "

fun link-at(lst, index, value):
  if index < 0 or index >= length(lst):
    error3 + tostring(index)
  else:
    # Create a new list with the value at the specified index replaced
    var new-list = [list: ]
    var i = 0
    for elem(lst)
      if i == index:
        new-list = link(new-list, value)
      else:
        new-list = link(new-list, lst[i])
    new-list
  end
end


#Flytter en ring fra en pinne til en annen
#Antar at 'game-state' er en liste av pinner, og hver pinne er en liste av ringer
fun move-ring(game-state, from-pin, to-pin):
  var from-stack = game-state[from-pin]
  var to-stack = game-state[to-pin]
  if from-stack.is-empty(): 
    error1 + tostring(from-pin)
  else if 
    (to-stack.is-empty()) and (from-stack.first() > to-stack.first()): 
    error2
  else:
    var ring-to-move = from-stack.first()
    var new-from-stack = from-stack.rest()
    var new-to-stack = link(ring-to-move, to-stack)
    game-state[from-pin] = new-from-stack
    game-state[to-pin] = new-to-stack
    link-at(game-state, from-pin, new-from-stack)
    link-at(game-state, to-pin, new-to-stack)
    game-state
  end
end