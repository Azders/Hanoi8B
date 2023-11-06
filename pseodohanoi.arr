use context essentials2021
include reactors
include world
import lists as L
import image as I


# konstanter
pin = circle(5, "solid", "black")
circle-red = circle(10, "solid", "red")
circle-green = circle(20, "solid", "green")
circle-blue = circle(30, "solid", "blue")
circle-yellow = circle(40, "solid", "yellow")
bakgrunn = rectangle(500, 250, "outline", "black")

# setter x posisjonen til pinnene
left-pin-pos= 125
center-pin-pos = 250
right-pin-pos = 375


# liste av pinner, samt initiell tilstand
Left-pin = [list: 4, 3, 2, 1]
Center-pin = [list: 0, 0, 0, 0]
Right-pin = [list: 0, 0, 0, 0]

Hanoi-initiell = [list: [list: 4, 3, 2, 1], [list: 0, 0, 0, 0], [list: 0, 0, 0, 0]]

# gjeldende tilstand (liste)
Current-state = [list: Left-pin, Center-pin, Right-pin]
    
# legger inn variabler i et datasett og konverterer til string
data Disks(x) --> String:
  | (1) == "red"
  | (2) == "blue"
  | (3) == "green"
  | (4) == "yellow"
end

data Pins --> String:
  | pin-left == "left"
  | pin-center == "center"
  | pin-right == "right"
end


# ved trykk av "tab", byttes disk-valget (som en rullerende funksjon)
fun chooseDisk(c):
  
  if (event-type == "tab"):
    c = for chooseDisk(colorTab from range(0,3)))
    colorTab + 1
    else:
    false
  end
end

# viser gjeldende disk (med farge)
fun displayDisk(display):
  currentColor = get.chooseDisk(c)
end

# flytting av valgt disk
fun handle-Red(event-type):
  doc: 
  "flytter rød disk til tildelt posisjon, sjekker det minste tallet (1 er lik rød) og oppdaterer verdien i angitt liste"

  if (event-type == "left") and num-min.get[List: Current-state] == 1:
    put-image(circle-red, left-pin-pos)
    update-list
    
  if else (event-type == "up") and num-min.get[List: Current-state] == 1:
      put-image(circle-red, center-pin-pos)
      update-list
      
    if else (event-type == "right") and num-min.get[List: Current-state] == 1:
      put-image(circle-red, right-pin-pos)
        update-list
      end
    end
  end
end

fun handle-Blue(event-type):
  doc: 
  "flytter blå disk til tildelt posisjon, sjekker det minste tallet (2 er lik blå) og oppdaterer verdien i angitt liste"

if (event-type == "left") and num-min.get[List: Current-state] == 2:
    put-image(circle-blue, left-pin-pos)
          update-list
    
  if else (event-type == "up") and num-min.get[List: Current-state] == 2:
      put-image(circle-blue, center-pin-pos)
            update-list
      
    if else (event-type == "right") and num-min.get[List: Current-state] == 2:
        put-image(circle-blue, right-pin-pos)
              update-list
      end
    end
  end
end

fun handle-Green(event-type):
  doc: 
  "flytter grønn disk til tildelt posisjon, sjekker det minste tallet (3 er lik grønn) og oppdaterer verdien i angitt liste"

  if (event-type == "left") and num-min.get[List: Current-state] == 3:
    put-image(circle-green, left-pin-pos)
          update-list
    
    if else (event-type == "up") and num-min.get[List: Current-state] == 3:
      put-image(circle-green, center-pin-pos)
            update-list
      
      if else (event-type == "right") and num-min.get[List: Current-state] == 3:
        put-image(circle-green, right-pin-pos)
              update-list
      end
    end
  end
end

fun handle-Yellow(event-type):
  doc: 
  "flytter gul disk til tildelt posisjon, sjekker det minste tallet (4 er lik gul) og oppdaterer verdien i angitt liste"

  if (event-type == "left") and num-min.get[List: Current-state] == 4:
    put-image(circle-yellow, left-pin-pos)
          update-list
    
    if else (event-type == "up") and num-min.get[List: Current-state] == 4:
      put-image(circle-yellow, center-pin-pos)
            update-list
      
      if else (event-type == "right") and num-min.get[List: Current-state] == 4:
        put-image(circle-yellow, right-pin-pos)
              update-list
      end
    end
  end
end


r = reactor:
init: "Gratulerer! Du har fullført spillet!"
end


fun start-spill(event-type)
  doc:
  "Starter spillet"
  if (event-type == "enter"):
    place-image(pin, left-pin, 125,
      place-image(pin, center-pin, 125,
        place-image(pin, right-pin, 125,
          place-image(circle-red, left-pin, 125,
            place-image(circle-blue, left-pin, 125,
              place-image(circle-green, left-pin, 125,
                place-image(circle-yellow, left-pin, 125,
                  background)))))))
  end
end
                  

fun restart-spill(event-type)
  doc: 
  "Restarter spillet"
  if (event-type == "backspace"):
    place-image(pin, left-pin, 125,
      place-image(pin, center-pin, 125,
        place-image(pin, right-pin, 125,
          place-image(circle-red, left-pin, 125,
            place-image(circle-blue, left-pin, 125,
              place-image(circle-green, left-pin, 125,
                place-image(circle-yellow, left-pin, 125,
                  background)))))))
  end
end


fun spill-ferdig(f):
  doc:
   "sjekker om spillet er fullført"
  if Right-pin is [list: 4, 3, 2, 1]
    interact(r)
      else
      false
  end
end