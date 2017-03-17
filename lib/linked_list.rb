# frozen_string_literal: true

# An LinkedList class
class LinkedList
  # a node in the list
  class Node
    attr_accessor :value, :next
    def initialize(value, succ = nil)
      @value = value
      @next = succ
    end
  end

  attr_accessor :head

  def initialize
    @head = Node.new(nil)
  end

  def append(value)
    node = head
    node = node.next while node.next
    node.next = Node.new(value)
    self
  end

  def prepend(value)
    head.value = value
    self.head = Node.new(nil, head)
    self
  end

  # This provides `find`, etc.
  include Enumerable

  def each
    node = head.next
    while node
      yield node.value
      node = node.next
    end
  end

  def remove
    prev = head
    curr = prev.next
    while curr
      if yield curr.value
        prev.next = curr.next
        return curr.value
      end
      prev = curr
      curr = prev.next
    end
  end

  def length
    count
  end

  def to_s
    node = head.next
    result = ''
    while node
      result += (result.empty? ? '' : ', ') + node.value.to_s
      node = node.next
    end
    result
  end
end
