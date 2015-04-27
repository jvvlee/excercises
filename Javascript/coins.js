function shortChangeMaker (amount, allowed_coins) {
  if (amount == 0) {return []}
  
  var shortest 

  for (var i=0; i < allowed_coins.length; i++) {
    var coins = []
    allowed_coins = allowed_coins.slice(i);
    
    if (allowed_coins[0] > amount) {
      allowed_coins = allowed_coins.slice(1)
      coins = coins.concat(shortChangeMaker(amount, allowed_coins));
    } else {
      var new_amount = amount - allowed_coins[0]
      coins.push(allowed_coins[0]);

      coins = coins.concat(shortChangeMaker(new_amount, allowed_coins));
    }
    
    shortest = shortest || coins
    
    if (coins.length < shortest.length) {
      shortest = coins
    }
  }
  
  return shortest 
}

//Very first instinct is to loop until largest or smallest amount is exhausted, then find the next one.
//However, I also want to find the mixed combinations.
//Therefore, at every step I should run changeMaker more than once in  "paralell", call every denomination except for ones that are too much...
//
//What to do if every coin doesn't fit 

function allChange (amount, allowed_coins) {
  //assumes allowed_coins is sorted
 
  if (amount == 0) {return 1} //a combination was found
  if (allowed_coins = []) {return 0} //the coins were exhausted and a combination was not found
  
  var combinations = 0
  
  for (var i=0; i < allowed_coins.length; i++) {
    allowed_coins = allowed_coins.slice(i);
    
    if (allowed_coins[0] > amount) {
      allowed_coins = allowed_coins.slice(1);
      combinations += allChange(amount, allowed_coins);
    } else {
      var new_amount = amount - allowed_coins[0]
      combinations += allChange(amount, allowed_coins);
    }
    
  }
  //if I think about this like a branching tree, all combinations that don't sum up should be immediately terminated.
  //In that way, the complexity of this algorithm would be O(n!), adding another entry expands the entire tree
  return combinations
}

//there is theoretically a finite number of combinations with the tree approach...lets do it that way