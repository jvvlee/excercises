var Link = function (next,prev,value) {
  this.next_link = next
  this.prev_link = prev
  this.value = value
}

Link.prototype.next = function (item) {
  if (typeof item !== "undefined") {
    this.next_link = item; //Is this reference correct? Will I have to copy the arguments array to avoid 
  } 
  
  return this.next_link
};

Link.prototype.prev = function (item) {
  if (typeof item !== "undefined") {
    this.prev_link = item;
  }
  
  return this.prev_link
};


Link.prototype.insert = function (item) { //assumes item is an instance of link with an id
  var followingLink = this.next;
  
  this.next(item);
  followingLink.prev(item);
  return item;
};

var LinkedList = function (link) {
  this.link = link
  //I shall assume I can reconstitute a list from only one link
}

LinkList.prototype.first = function () {
  while (this.link.prev()) {
    this.link = this.link.prev()
  }
  
  return this.link
},
  
LinkedList.prototype.last = function () {
  while (this.link.next()) {
    this.link = this.link.next()
  }
  
  return this.link
},

LinkedList.prototype.pop = function () {
  var last_link = this.last();
  var new_last = last_link.prev();
  new_last.next = nil
  
  return last_link
},

LinkedList.prototype.push = function (link) {
  var last_link = this.last();
  
  last_link.next = link;
  return link
}

//Given a linked list of integers and an integer value, delete every node of the linkedlist containing that value. Use JavaScript.

var obliterator = function (linkedList, value) {
  var link = linkedList.first();
  
  while (link.next()) {
    var val = link.val();
    
    if (val === value) {
      var prev = link.prev();
      
      prev.next(link.next()); //sets reference of previous "next" to the current link's "next"
      link.next.prev(prev); //sets next node to refer to the previous node as previous
    }
    
    link = link.next(); //no references remain, should be garbage collected?
  }
  
  return linkedList;
}