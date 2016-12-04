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
    @size == 0 ? add_first_node(node) : add_next_node(node)
    @size += 1
    return node
  end

  def add_first_node(node)
    @head = node
  end

  def add_next_node(node)
    current = @head
    while !current.next.nil?
      current = current.next
    end
    current.next = node
  end

  def head
    @head
  end

  # enumerable mixin method
  def each
    if block_given?
      self.elements.each { |e| yield(e) }
    else
      self.elements
    end
  end

  # returns all elements in list
  def elements
    ary = []
    current = @head
    until current == nil
      ary << current.object
      current = current.next
    end
    @options[:sorted] == 1 ? ary.reverse : ary
  end

  def empty?
    @size == 0
  end

  def length
    @size
  end

  # returns true if object is a member of the list, false otherwise
  def member?(object)
    elements.include?(object)
  end

  # returns and removes the first element of the list; or nil if the list is empty
  def pop
    return nil if @head.nil?
    first = @head
    next_node = first.next
    @head = next_node
    return first.object
  end

end