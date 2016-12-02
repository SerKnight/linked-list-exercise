# require './lib/node.rb'
# require './lib/list.rb'

class List
  include Enumerable

  def initialize(options={} )
    @options = options
    @head = nil
    @size = 0
  end

  # add object to list based on list type
  def add(object)
    node = Node.new(object)
    if @size == 0
      @head = node
    else
      current = @head
      while !current.next.nil?
        current = current.next
      end
      current.next = node
    end
    @size += 1
    return node
  end

  def head
    @head
  end

  # enumerable mixin method
  def each
  end

  # returns all elements in list
  def elements
    ary = []
    current_node = @head
    until current_node == nil
      ary << current_node.object
      current_node = current_node.next
    end
    ary
  end

  def empty?
    @size == 0
  end

  def length
    @size
  end

  # returns true if object is a member of the list, false otherwise
  def member?(object)
  end

  # returns and removes the first element of the list; or nil if the list is empty
  def pop
    nil
  end

end