# require './lib/node.rb'
# require './lib/list.rb'

class List
  include Enumerable

  def initialize(options={} )
    @options = options
    @head = nil
  end

  # add object to list based on list type
  def add(object)
    current = @head ? @head : Node.new(object, nil)
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(object, nil)
  end

  # enumerable mixin method
  def each
  end

  # returns all elements in list
  def elements
    ary = []
    current = @head
    while current.next != nil
      ary << current.object
      current = current.next
    end
    return ary << current.object
  end

  # returns true if the list is empty, false otherwise
  def empty?
    true
  end

  # returns length of list
  def length
    count = 0
    current = @head.nil? ? (return 0) : @head
    while current.next != nil
      count += 1
      current = current.next
    end
    return count
  end

  # returns true if object is a member of the list, false otherwise
  def member?(object)
  end

  # returns and removes the first element of the list; or nil if the list is empty
  def pop
    nil
  end

end