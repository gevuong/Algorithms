var LinkedListCycle = function(head) {
    if (head) {
        return false
    }
   let  hash = {}
    while (head.next) {
        if (hash[head.next.val]) {
            return true
        } else {
            hash[head.next.val] = 0;
        }
    }
    return false
};
