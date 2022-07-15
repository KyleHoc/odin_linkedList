class LinkedList
    attr_accessor :list
    def initialize()
        @list = []
    end

    def append(value)
        my_node = Node.new()
        my_node.value = value
        unless @list.empty?
          @list[@list.length - 1].next_node = my_node
        end
        @list.append(my_node)
    end

    def prepend(value)
        my_node = Node.new()
        my_node.value = value

        @list.prepend(my_node)
        my_node.next_node = @list[1]
    end

    def size()
        return @list.length
    end

    def head()
        return @list[0]
    end

    def tail()
        return @list[@list.length - 1]
    end

    def at(index)
        return @list[index]
    end

    def pop()
        @list.pop
    end

    def contains?(value)
        is_present = false

        @list.each do |item|
            if item.value == value
                is_present = true
            end
        end
        is_present
    end

    def find(value)
        position = nil

        @list.each_with_index do |item, index|
            if item.value == value
                position = index
            end
        end
        position
    end

    def to_s()
        @list.each do |item|
            print "( #{item.value} ) -> "
        end
        puts " nil"
    end

    def insert_at (value, index)
        my_node = Node.new()
        my_node.value = value
        @list.insert(index, my_node)
        @list[index].next_node = @list[index + 1]
        @list[index - 1].next_node = my_node
    end

    def remove_at(index)
        @list.delete_at(index)
        @list[index - 1].next_node = @list[index]
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize()
        @value = nil
        @next_node = nil
    end

    def value()
        return @value
    end
end

my_list = LinkedList.new()
my_list.append(50)
my_list.append(275)
my_list.append(13)

my_list.to_s()
my_list.prepend(21)
my_list.to_s()
my_list.insert_at(999, 2)
my_list.to_s()
my_list.remove_at(3)
my_list.to_s
puts my_list.at(0).next_node.next_node.next_node.value

#Output:
#( 50 ) -> ( 275 ) -> ( 13 ) ->  nil
#( 21 ) -> ( 50 ) -> ( 275 ) -> ( 13 ) ->  nil
#( 21 ) -> ( 50 ) -> ( 999 ) -> ( 275 ) -> ( 13 ) ->  nil
#( 21 ) -> ( 50 ) -> ( 999 ) -> ( 13 ) ->  nil
#13
