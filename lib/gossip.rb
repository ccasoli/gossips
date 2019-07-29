class Gossip
    attr_accessor :author ,:content

    def initialize(author, content)
        @author = author
        @content = content
        @comment = []
    end

    def save
        CSV.open('db/gossip.csv', 'ab') {|csv| csv << [@author, @content]}
    end

    def self.all
        array_gossips = []
        CSV.read('db/gossip.csv').each {|line| array_gossips << Gossip.new(line[0], line[1])}
        array_gossips
    end

    def self.find(id_gossip)
        self.all[id_gossip]
    end

    def update(id_gossip)
        gossips = CSV.read("db/gossip.csv")
        gossips[id_gossip] = [@author, @content]
        CSV.open('db/gossip.csv', 'wb') {|csv| gossips.each {|gossip| csv << gossip}}
    end
end