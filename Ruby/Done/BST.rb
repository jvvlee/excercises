#brute force O((n^2)..(n-h^2)) time where n is the number of nodes and h is the height. Memory is O(1) for value

def isBST?(root_node)
  return true if root_node.nil?
  value = root_node.val
  
  if compare_right_tree(root_node.right, value) && compare_left_tree(root_node.left, value)
    return isBST?(root_node.right) && isBST?(root_node.left)
  end
  
  return false
end

def compare_right_tree(node, val)
  if node.left.val > val && node.right.val > val
    return (compare_right_tree(node.left, val) && compare_left_tree(node.right, val))
  end
  
  return false
end

def compare_left_tree(node, val)
  if node.left.val < val && node.right.val < val
    return (compare_left_tree(node.left, val) && compare_left_tree(node.right, val))
  end
  
  return false
end

#better outcome
#
#Remember that every node has an upper and lower limit
#Outer branches only have an upper or lower bound, if nil, make no comparison.
#

def betterIsBST?(root_node, max, min) #O(n) time, checks each node once
  return true if root_node.nil?
  
  max_check = !max || root_node.val < max
  min_check = !min || root_node.val > min
  
  unless max_check && min_check
    return false #evaluate self first
  end
  
  left = betterIsBST?(root_node.left, root_node.val, min)
  right = betterIsBST?(root_node.right, max, root_node.val)
  
  return left && right #tell children to evaluate themselves
end

