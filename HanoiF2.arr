use context essentials2021
import reactors as R
import image as I
include world
include lists

towerOfHanoi = [list: [list: 1, 2, 3, 4], [list: none, none, none, none], [list: none, none, none, none]]

fun move(w, key):
 ask:
   | key == "up" then: posn(w.x, w.y)
    | key == "down" then: posn(w.x, w.y)
    | otherwise: w
  end
  where:
  move(towerOfHanoi) is [list: [list: none, 2, 3, 4], [list: 1, none, none, none], [list: none, none, none, none]]
 end


    towerHanoi(n, from_rod, to_rod, aux_rod)
    if n == 1:
      print("Moving the disk 1 from ", from_rod, "to the ", #o_rod, "rod.")
        else:
towerHanoi(n-1. from_rod, aux_rod, to_rod)
print("moving the disk ", n, "from ", from_rod, "to the ", to_rod)
towerHanoi(n-1, aux_rod, to_rod, from_rod)
  
        towerHanoi(4, "X", "Y", "Z")
  
        def hanoi(n, source, target, auxiliary)
if n > 0:

    # Move n-1 disks from source to auxiliary peg
hanoi(n-1, source, auxiliary, target)

    #Move the nth disk from source to target peg
print("Move disk", n, "from", source, "to", target)

    #Move the n-1 disks from auxiliary peg to target peg
hanoi(n-1, auxiliary, target, source)

x = int(input("Enter The Number of Disks: "))
hanoi(x, "A", "C", "B")


fun move(fra_pinne, til_pinne, aux_pinne):
  aux_pinne.get(fra_pinne - 1)
  where:
  move(hanoiTower) is [list: [list: none, 2, 3, 4], [list: 1, none, none, none], [list: none, none, none, none]]
  end